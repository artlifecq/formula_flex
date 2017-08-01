package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.app.ui.alert.QiuHunTiShiPanelExt;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.hunyin.HunYinHuDongData;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.cfg.hunyin.QiuHunVo;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	import com.rpgGame.coreData.clientConfig.Q_interaction;
	import com.rpgGame.coreData.enum.HunYinEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.marriage.bean.MarriageInfo;
	import com.rpgGame.netData.marriage.bean.MarriageLoggerInfo;
	import com.rpgGame.netData.marriage.message.SCDivorceMessage;
	import com.rpgGame.netData.marriage.message.SCInteractionMessage;
	import com.rpgGame.netData.marriage.message.SCMarriageInfoMessage;
	import com.rpgGame.netData.marriage.message.SCMarriageLogMessage;
	import com.rpgGame.netData.marriage.message.SCNoticeByDivorceMessage;
	import com.rpgGame.netData.marriage.message.SCNoticeZoneMessage;
	import com.rpgGame.netData.marriage.message.SCProposalResultMessage;
	import com.rpgGame.netData.marriage.message.SCRefuseNtoiceMessage;
	import com.rpgGame.netData.marriage.message.SCRoundChangeMarriageMessage;
	import com.rpgGame.netData.marriage.message.SCTargetProposalMessage;
	import com.rpgGame.netData.marriage.message.SCUpGradeMessage;
	import com.rpgGame.netData.marriage.message.SCUpdateZoneSubNumMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class HunYinManager
	{
		//结婚数据
		private var _marriageInfo: MarriageInfo;
		
		public  static var ins:HunYinManager=new HunYinManager();
		
		private var _qiuhuntishiPanel:QiuHunTiShiPanelExt;
		private var _qiuhunListVo:Vector.<QiuHunVo>=new Vector.<QiuHunVo>();
		/**
		 * 获取当前的战斗力
		 * */
		public function get Power():int
		{
			return _marriageInfo.fihtPower;
		}
		
		/**
		 * 获取戒子等阶
		 * */
		public function get JieZiLv():int
		{
			if(_marriageInfo==null) return 1;
			return _marriageInfo.levelnum;
		}
		
		/**
		 * 获取婚姻数据
		 * */
		public function get marriageInfos():MarriageInfo
		{
			return _marriageInfo;
		}
		
		/**
		 * 获取夫妻日志
		 * */
		public function get marriageLoggerInfos():Vector.<MarriageLoggerInfo>
		{
			return _marriageInfo.marriageLoggerInfos;
		}
		
		/**获取互动次数*/
		public function gethudongNumByType(type:int):int
		{
			for(var i:int=0;i<_marriageInfo.interactionInfos.length;i++)
			{
				if(_marriageInfo.interactionInfos[i].type==type)
					return _marriageInfo.interactionInfos[i].subNumber;
			}
			return 0;
		}
		
		/**
		 * type(1:求婚 2:被求婚 3:求婚被拒绝 4:被离婚提示 5:离婚 6:求婚反馈 7:拒绝副本邀请 8:离婚反馈)
		 * */
		public function showQiuHunTiShiPanel(type:int,msg:*,name:String):void
		{
			if(_qiuhuntishiPanel==null||_qiuhuntishiPanel.stage==null) 
				_qiuhuntishiPanel=QiuHunTiShiPanelExt.showJieHunPanel(type,msg,name);
			else 
			{
				if(type==2)
				{
					var vo:QiuHunVo=new QiuHunVo();
					vo.setdata(type,msg,name);
					_qiuhunListVo.push(vo);
					return;
				}
				_qiuhuntishiPanel.updateShow(type,msg,name);
			}
		}
		
		/**检测下一个求婚请求*/
		public function chakeNextQiuHunMsg():void
		{
			if(_qiuhunListVo==null||_qiuhunListVo.length==0) return;
			var vo:QiuHunVo=_qiuhunListVo.shift();
			showQiuHunTiShiPanel(vo.qiuhunType,vo.msg,vo.qiuhunName);
		}
		
		/**拒绝所有的求婚*/
		public function RefusedAllQiuHun():void
		{
			if(_qiuhunListVo==null||_qiuhunListVo.length==0) return;
			while(_qiuhunListVo.length>0)
			{
				var vo:QiuHunVo=_qiuhunListVo.shift();
				var msg:SCTargetProposalMessage= vo.msg as SCTargetProposalMessage;
				HunYinSender.upCSTargetProposalResultMessage(0,msg.targetId);
			}
		}
		
		/**是否可进阶（仅判断亲密度）*/
		public function isCanJinJie():Boolean
		{
			if(JieHunJieZiData.isMax(_marriageInfo.levelnum)) return false;
			var info:Q_advance_wedding=JieHunJieZiData.getModByLv(JieZiLv);
			if(_marriageInfo.intimacyValue>=info.q_max_intimacy)
			{
				return true;
			}
			return false;
		}
		
		/**是否需要进阶突破*/
		public function isNeedTuPo():Boolean
		{
			if(JieHunJieZiData.isMax(JieZiLv)) return false;
			var info:Q_advance_wedding=JieHunJieZiData.getModByLv(JieZiLv);
			if(info.q_item!=null&&info.q_item!="")
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 离婚结果反馈
		 * */
		public function onSCDivorceMessage(msg:SCDivorceMessage):void
		{
			showQiuHunTiShiPanel(8,msg,null);
			var role:SceneRole=MainRoleManager.actor;
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateFuQiTitle(_marriageInfo.marriagePlayerName);
		}
		
		/**
		 * 被离婚反馈
		 * */
		public function onSCNoticeByDivorceMessage(msg:SCNoticeByDivorceMessage):void
		{
			showQiuHunTiShiPanel(4,msg,null);
		}
		
		/**
		 * 夫妻互动结果
		 * */
		public function onSCInteractionMessage(msg:SCInteractionMessage):void
		{
			if(msg.result==1)
			{
				_marriageInfo.intimacyValue=msg.intimacyValue;
				var length:int = _marriageInfo.interactionInfos.length;
				for(var i:int = 0;i<length;i++)
				{
					if(_marriageInfo.interactionInfos[i].type == msg.interactionInfo.type)
					{
						_marriageInfo.interactionInfos[i].subNumber = msg.interactionInfo.subNumber;
						break;
					}
				}
				EventManager.dispatchEvent(HunYinEvent.HUNYIN_HUDONG,msg);
			}
		}
		
		/**
		 * 婚姻数据
		 * */
		public function onSCMarriageInfoMessage(msg:SCMarriageInfoMessage):void
		{
			_marriageInfo=msg.marriageInfo;
			var role:SceneRole=MainRoleManager.actor;
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateFuQiTitle(_marriageInfo.marriagePlayerName);
		}
		
		/**
		 * 夫妻日志
		 * */
		public function onSCMarriageLogMessage(msg:SCMarriageLogMessage):void
		{
			_marriageInfo.marriageLoggerInfos.push(msg.marriageLoggerInfo);
		}
		
		/**
		 * 副本邀请提示
		 * */
		public function onSCNoticeZoneMessage(msg:SCNoticeZoneMessage):void
		{
			AppManager.showApp(AppConstant.HUNYIN_FUBENYAOQING,msg);
		}
		
		/**
		 * 拒绝提示
		 * */
		public function onSCRefuseNtoiceMessage(msg:SCRefuseNtoiceMessage):void
		{
			showQiuHunTiShiPanel(7,msg,null);
		}
		
		/**
		 * 求婚反馈
		 * */
		public function onSCProposalResultMessage(msg:SCProposalResultMessage):void
		{
			showQiuHunTiShiPanel(6,msg,msg.targetName);
		}
		
		/**
		 * 被求婚提示
		 * */
		public function onSCTargetProposalMessage(msg:SCTargetProposalMessage):void
		{
			showQiuHunTiShiPanel(2,msg,msg.targetName);
		}
		
		/**
		 * 副本次数刷新
		 * */
		public function onSCUpdateZoneSubNumMessage(msg:SCUpdateZoneSubNumMessage):void
		{
			_marriageInfo.zoneSubNum=msg.zoneSubNum;
			EventManager.dispatchEvent(HunYinEvent.HUNYIN_FUBENCISHU);
		}
		
		/**
		 * 结婚戒子进阶结果
		 * */
		public function onSCUpGradeMessage(msg:SCUpGradeMessage):void
		{
			if(msg.result==1)
			{
				_marriageInfo.intimacyValue=msg.intimacyValue;
				_marriageInfo.buffs=msg.buffs;
				_marriageInfo.fihtPower=msg.fihtPower;
				_marriageInfo.wishValue=msg.wishValue;
				if(_marriageInfo.levelnum!=msg.levelnum)
				{
					_marriageInfo.levelnum=msg.levelnum;
					EventManager.dispatchEvent(HunYinEvent.HUNYIN_JINJIE_CHENGGONG);
				}
				else
				{
					if(msg.type==1)
						EventManager.dispatchEvent(HunYinEvent.HUNYIN_JINJIE);
					else
						EventManager.dispatchEvent(HunYinEvent.HUNYIN_TUPO);
				}
			}
		}
		
		/**
		 * 获取按钮TIPS内容
		 * */
		public function getBtnTip(type:int,num:int):String
		{
			var text:String="";
			var q_interaction:Q_interaction=HunYinHuDongData.getModById(type,num);
			var title:String="";
			switch(type)
			{
				case HunYinEnum.HD_SONGHUA:
					title="送花";
					break;
				case HunYinEnum.HD_YONGBAO:
					title="拥抱";
					break;
				case HunYinEnum.HD_QINWEN:
					title="亲吻";
					break;
				case HunYinEnum.HD_DONGFANG:
					title="洞房";
					break;		
			}
			
			text=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,title)+"\n";
			if(!q_interaction) 
			{
				text+=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,"今日已达上限")+"\n";
				return text;
			}
			var arr:Array=JSONUtil.decode(q_interaction.q_money);
			var money:String=ItemConfig.getItemName(arr[0].mod);
			text+=title+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"需要消耗")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,arr[0].num)+
				HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,money)+"\n";
			text+=title+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"可增加夫妻双方")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,q_interaction.q_intimacy_value.toString())+
				HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"点亲密度")+"\n";
			
			return text;
		}
		
		public function onSCRoundChangeMarriageHandler(msg:SCRoundChangeMarriageMessage):void
		{
			// TODO Auto Generated method stub
			var role:SceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if (role&&role.headFace) 
			{
				(role.headFace as HeadFace).updateFuQiTitle(msg.marriageName);
			}
		}
		
		
		public function getAttId(qdata:Q_advance_wedding):int
		{
			var attTypes:Array = JSONUtil.decode(qdata.q_att_type);
			var id:int ;
			var length:int = attTypes.length;
			var job:int = MainRoleManager.actorInfo.job;
			if(job == 3)
				job = 2;
			for(var i:int=0;i<length;i++)
			{
				if(attTypes[i][0]==job)
				{
					id = attTypes[i][1];
					break;
				}
			}
			return id;
		}
	}
}