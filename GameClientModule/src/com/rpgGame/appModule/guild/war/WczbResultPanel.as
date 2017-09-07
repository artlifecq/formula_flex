package com.rpgGame.appModule.guild.war
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
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
		private var showTime:int=15;
		
		private var _skin:WangChengJieSuan;
		private var _rankDatas:ListCollection;

		private var rankList:WangChengPaiHangList;
		private var timer:GameTimer;
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
			rewardGrp.tweeRewardInBag();
			super.hide();
			timer.stop();
			(MainRoleManager.actor.headFace as HeadFace).updateGuildWarInfoBar(null);
			rewardGrp.clear();
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
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
//			_skin.skinBar.maximum=cfg.q_integral_victory;
//			_skin.skinBar.value=msg.myCampScore;
//			_skin.lbBar.text=_skin.skinBar.value+"/"+_skin.skinBar.maximum;
			
			_skin.numPaiming.label=msg.myRank.toString(); 
			_skin.numJisha.label=msg.myKillCnt.toString(); 
			_skin.numJifen.label=msg.mySource.toString(); 
			
			
			//参与奖励+进攻奖励+积分折算奖励
			var myRe:int=MainRoleManager.actorInfo.faction;
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
			timer=new GameTimer("WczbResultPanel",1000,0,updateTime);
		}
		
		private function updateResultResult(listA:Array,listB:Array):Array
		{
			var len:int=listB.length;
			var item:Object;
			var num:int=listA.length;
			for(var i:int=0;i<len;i++){
				item=listB[i];
				for(var j:int=0;j<num;j++){
					if(listA[j].mod==item.mod){//在A里面找到一样的了,累加数量
						listA[j].num+=item.num;
//						listB.splice(j,1);
						break;
					}
				}
				if(j==num){//没找到
					listA.push(item);
				}
			}
			return listA;
		}
		
		private function updateTime():void
		{
			showTime--;
			_skin.lbTime.text=showTime+"秒后自动退出";
			if(showTime<=0){
				timer.stop();
				AppManager.hideApp(AppConstant.GUILD_WCZB_RESULT);
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnLingQu){
				this.hide();
				DungeonSender.reqQuitDungeon();
			}
		}
	}
}