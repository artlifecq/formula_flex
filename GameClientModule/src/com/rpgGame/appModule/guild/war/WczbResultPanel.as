package com.rpgGame.appModule.guild.war
{
	import com.game.mainCore.core.manager.TimerManager;
	import com.game.mainCore.libCore.timer.TimerData;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.QBattleRewardCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.guildWar.message.ResGuildWarResultMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengJieSuan;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiHangList;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 王城争霸结果
	 *@author dik
	 *2017-7-3
	 **/
	public class WczbResultPanel extends SkinUIPanel
	{
		private var showTime:int=10;
		
		private var _skin:WangChengJieSuan;
		private var _rankDatas:ListCollection;

		private var rankList:WangChengPaiHangList;
		private var timer:TimerData;
		private var rewardGrp:RewardGroup;
		
		public function WczbResultPanel()
		{
			_skin=new WangChengJieSuan();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			rankList=_skin.skinList.skin as WangChengPaiHangList;
			rankList.List.itemRendererType=WczbResultItemRender;
			rankList.List.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_rankDatas=new ListCollection();
			rankList.List.dataProvider=_rankDatas;
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid3_1);
		}
		
		override public function hide():void
		{
			super.hide();
			TimerManager.deleteTimer(timer);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			showResultByData(data);
		}
		
		private function showResultByData(datas:Array):void
		{
			var msg:ResGuildWarResultMessage=datas[0];
			var cfg:Q_singlecitybase=datas[1]
			var defId:int=datas[2];
			_skin.lbBang1.text=msg.winCampName;
			_skin.lbBang2.text=msg.lostCampName;
			_skin.skinBar.maximum=cfg.q_integral_victory;
			_skin.skinBar.value=msg.myCampScore;
			_skin.lbBar.text=_skin.skinBar.value+"/"+_skin.skinBar.maximum;
			
			_skin.numPaiming.label=msg.myRank.toString(); 
			_skin.numJisha.label=msg.myKillCnt.toString(); 
			_skin.numJifen.label=msg.mySource.toString(); 
			
			
			//参与奖励+进攻奖励+积分折算奖励
			var myRe:int=MainRoleManager.actorInfo.relation;
			var isAttack:Boolean=myRe!=defId;//不是防守方
			var jifen:int;
			var canyuRewards:Array=JSONUtil.decode(cfg.q_reward3);
			var jifenRewards:Array=JSONUtil.decode(QBattleRewardCfgData.getInfoByIntegral(msg.mySource).q_reward_item);
			var all:Array=updateResultResult(canyuRewards,jifenRewards);
			if(isAttack){
				var attackRe:Array=JSONUtil.decode(cfg.q_reward4);
				all=updateResultResult(attackRe,all);
			}
			rewardGrp.setRewardByArray(all);
			timer=TimerManager.createTimer(1000,showTime,updateTime);
		}
		
		private function updateResultResult(listA:Array,listB:Array):Array
		{
			var result:Array=listA;
			var num:int=listB.length;
			for(var i:int=0;i<num;i++){
				var itemB:Object=listB[i];
				for(var j:int=0;j<listA.length;j++){
					var itemA:Object=listA[j];
					if(itemA.mod==itemB.mod){
						itemA.num+=itemB.num;
					}else{
						listA.push(itemB);
					}
				}
			}
			
			return result;
		}
		
		
		private function updateTime():void
		{
			showTime--;
			_skin.lbTime.text=showTime+"秒后自动退出";
			if(showTime<=0){
				this.hide();
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnLingQu){
				this.hide();
			}
		}
	}
}