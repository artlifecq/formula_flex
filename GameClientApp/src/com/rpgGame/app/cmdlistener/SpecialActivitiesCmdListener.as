package com.rpgGame.app.cmdlistener
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.MibaoManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.netData.daysdowngold.message.SCActivityTimeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCCashGiftChangeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCCashGiftClientMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRankInfoMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRemainRefreshTimeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRewardInfoMessage;
	import com.rpgGame.netData.mibao.message.SCJiFenChangeMessage;
	import com.rpgGame.netData.mibao.message.SCMiBaoActivityTimeMessage;
	import com.rpgGame.netData.mibao.message.SCMiBaoRewardInfoMessage;
	import com.rpgGame.netData.mibao.message.SCMosterNumChangeMessage;
	import com.rpgGame.netData.mibao.message.SCRemainMosterNumMessage;
	import com.rpgGame.netData.monster.bean.HateInfo;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	import com.rpgGame.netData.monster.message.ResBossHateInfosToClientMessage;
	import com.rpgGame.netData.monster.message.SCLimitChallengeBossResultMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossKillerNameMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
	import com.rpgGame.netData.specialactivities.bean.ActivityNotifyInfo;
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;
	import com.rpgGame.netData.specialactivities.message.SCActivitiesNotifyListMessage;
	import com.rpgGame.netData.specialactivities.message.SCEnterActivityMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivitiesListMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityCloseMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityOpenMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	public class SpecialActivitiesCmdListener extends BaseBean
	{
		public function SpecialActivitiesCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(162101,onSCSpecialActivitiesListMessage);
			SocketConnection.addCmdListener(162102,onSCSpecialActivityOpenMessage);
			SocketConnection.addCmdListener(162103,onSCSpecialActivityCloseMessage);
			SocketConnection.addCmdListener(162104,onSCActivitiesNotifyListMessage);
			SocketConnection.addCmdListener(162105,onSCEnterActivityMessage);
			
			SocketConnection.addCmdListener(114118,onSCWorldBossResultMessage);
			SocketConnection.addCmdListener(114119,onSCWorldBossKillerNameMessage);
			SocketConnection.addCmdListener(114115,onResBossDamageInfosToClientMessage);
			SocketConnection.addCmdListener(114120,onSCLimitChallengeBossResultMessage);
			SocketConnection.addCmdListener(114121,onResBossHateInfosToClientMessage);
			
			/*----------------天降元宝   yt---------------------------------------------*/
			SocketConnection.addCmdListener(130101,onSCRankInfoMessage);
			SocketConnection.addCmdListener(130102,onSCCashGiftClientMessage);
			SocketConnection.addCmdListener(130103,onSCActivityTimeMessage);
			SocketConnection.addCmdListener(130104,onSCRemainRefreshTimeMessage);
			SocketConnection.addCmdListener(130105,onSCRewardInfoMessage);
			SocketConnection.addCmdListener(130106,onSCCashGiftChangeMessage);
			/*----------------秦陵秘宝   yt---------------------------------------------*/
			SocketConnection.addCmdListener(131101,onSCMiBaoActivityTimeMessage);
			SocketConnection.addCmdListener(131102,onSCRemainMosterNumMessage);
			SocketConnection.addCmdListener(131103,onSCMosterNumChangeMessage);
			SocketConnection.addCmdListener(131104,onSCJiFenChangeMessage);
			SocketConnection.addCmdListener(131105,onSCMiBaoRewardInfoMessage);
			
			
			

			finish();
		}
		
		private function onSCWorldBossResultMessage(msg:SCWorldBossResultMessage):void
		{
			AppManager.showApp(AppConstant.ACTIVETY_BOSS_RESULT,msg);
		}
		
		private function onResBossDamageInfosToClientMessage(msg:ResBossDamageInfosToClientMessage):void
		{
			if(msg.rankType==1)
			{
				EventManager.dispatchEvent(ActivityEvent.UPDATE_BOSS_HURT_RANK,msg);
			}
			else if(msg.rankType==5)
			{
				EventManager.dispatchEvent(ActivityEvent.UPDATE_JIXIANBOSS_HURT_RANK,msg);
			}
			else if(msg.rankType==6)
			{Lyt.a("伤害排行:rank="+msg.rank+"damage="+msg.damage);
				EventManager.dispatchEvent(ActivityEvent.MIBAO__HURT_RANK,msg);
			}
			else
			{
				ActivetyDataManager.jixianVo.setdate(msg);
			}
			
		}
		
		private function onSCEnterActivityMessage(msg:SCEnterActivityMessage):void
		{
			EventManager.dispatchEvent(ActivityEvent.ENTER_ACTIVITY,msg.activity);
		}
		
		private function onSCWorldBossKillerNameMessage(msg:SCWorldBossKillerNameMessage):void
		{
			ActivetyDataManager.updateBossKiller(msg.activityId,msg.killerName,msg.killerId);
		}
		
		/**
		 *活动预告信息 
		 * @param msg
		 * 
		 */
		private function onSCActivitiesNotifyListMessage(msg:SCActivitiesNotifyListMessage):void
		{
			var list:Vector.<ActivityNotifyInfo>=msg.activityNotifyInfolist;
			var num:int=list.length;
			var info:ActivetyInfo;
			for (var i:int = 0; i <num; i++) 
			{
				info=ActivetyCfgData.getActInfoById(list[i].activityId);
				if(info&&info.info){
					info.info.notifyTime=list[i].notifyTime;
				}
			}
			ActivetyDataManager.checkOpenAct();
		}
		
		private function onSCSpecialActivitiesListMessage(msg:SCSpecialActivitiesListMessage):void
		{
			var list:Vector.<SpecialActivityInfo>=msg.activityInfolist;
			var num:int=list.length;
			
			for (var i:int = 0; i <num; i++) 
			{
				ActivetyDataManager.updateInfo(list[i]);
				EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,list[i].activityId);
			}
			ActivetyDataManager.sortAllDatas();
			
			ActivetyDataManager.checkOpenAct();
		}
		
		private function onSCSpecialActivityCloseMessage(msg:SCSpecialActivityCloseMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.OVER);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
			EventManager.dispatchEvent(ActivityEvent.CLOSE_ACTIVITY_NOTICE,msg.activityId);
			var info:ActivetyInfo=ActivetyCfgData.getActInfoById(msg.activityId);
			if(info.actCfg.q_icon_id!=0){//有独立的功能icon
				MainButtonManager.closeActivityButton(info.actCfg.q_icon_id);
			}
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.JOINING,msg.remainTime);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
			var info:ActivetyInfo=ActivetyCfgData.getActInfoById(msg.activityId); 
			if(info.actCfg.q_show_notice==1){
				if(info.actCfg.q_notice_trans){
					var list:Array=JSONUtil.decode(info.actCfg.q_notice_trans);
					if(FunctionOpenManager.checkOpenBuyFunId(list[1]))
					{
						AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
					}
				}else{
					AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
				}
				
			}
		}
		
		private function onSCLimitChallengeBossResultMessage(msg:SCLimitChallengeBossResultMessage):void
		{
			AppManager.showApp(AppConstant.ACTIVETY_JIXIAN_RESULT,msg);
//			if(msg.success==1)
//			{
//				UIPopManager.showAlonePopUI(JiXianTiaoZhanExtPop);
//			}
		}
		/**boss伤害排行*/
		private function onResBossHateInfosToClientMessage(msg:ResBossHateInfosToClientMessage):void
		{
			var hstr:String="";
			for each(var hate:HateInfo in msg.hateInfos)
			{
				hstr+=hate.playerName+"=伤害："+hate.hate+"\n";
			}
			
			AppManager.showAppNoHide(AppConstant.ALERT_TEXT_PANEL,hstr);
			
			
		}
		
		
		
		/*----------------天降元宝   yt---------------------------------------------*/
		/**排名消息*/
		private function onSCRankInfoMessage(msg:SCRankInfoMessage):void
		{//Lyt.a("排名消息:"+msg.playerCashGiftNum+"+"+msg.playerRankLevel);
			AppManager.showApp(AppConstant.ACTIVETY_LIJIN_SCORES,msg);
			
		}
		/**抢夺怪物*/
		private function onSCCashGiftClientMessage(msg:SCCashGiftClientMessage):void
		{Lyt.a("抢夺怪物:"+msg.monsterNum+"+"+msg.refresh+"死亡："+msg.dieList.toString());
			EventManager.dispatchEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,msg.monsterNum,msg.refresh,msg.dieList);
		}
		/**剩余时间*/
		private function onSCActivityTimeMessage(msg:SCActivityTimeMessage):void
		{Lyt.a("剩余时间:"+msg.remainingTime);
			EventManager.dispatchEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,msg.remainingTime);
		}
		/**刷新时间*/
		private function onSCRemainRefreshTimeMessage(msg:SCRemainRefreshTimeMessage):void
		{Lyt.a("刷新时间:"+msg.remainRefreshTime);
			if(msg.remainRefreshTime>0)
			{
				AppManager.showAppNoHide(AppConstant.ACTIVETY_LIJIN_TIMER,msg.remainRefreshTime);
			}
			else
			{
				AppManager.hideApp(AppConstant.ACTIVETY_LIJIN_TIMER);
				AppManager.showAppNoHide(AppConstant.ACTIVETY_LIJIN_REFRESH);
			}
		}
		/**奖励信息*/
		private function onSCRewardInfoMessage(msg:SCRewardInfoMessage):void
		{Lyt.a("奖励信息:"+msg.reward.length);
			AppManager.showApp(AppConstant.ACTIVETY_LIJIN_RESULT,msg.reward);
		}
		/**元宝变化*/
		private function onSCCashGiftChangeMessage(msg:SCCashGiftChangeMessage):void
		{Lyt.a("元宝变化:"+msg.cashGiftNum);
			EventManager.dispatchEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,msg.cashGiftNum);
		}
		/*----------------秦陵秘宝   yt---------------------------------------------*/
		/**活动剩余时间*/
		private function onSCMiBaoActivityTimeMessage(msg:SCMiBaoActivityTimeMessage):void
		{Lyt.a("活动剩余时间:"+msg.zoneId+"=="+msg.remainingTime);
			MibaoManager.zoneid=msg.zoneId;
			EventManager.dispatchEvent(ActivityEvent.MIBAO_ACTIVITY_TIME,msg.remainingTime);
			EventManager.dispatchEvent(DungeonEvent.ZONE_CLEAR_TRIGGER,msg.zoneId);
		}
		/**剩余怪物列表*/
		private function onSCRemainMosterNumMessage(msg:SCRemainMosterNumMessage):void
		{Lyt.a("剩余怪物列表:"+msg.RemainMosterList.length);
			MibaoManager.monsterListInit(msg.RemainMosterList);
			EventManager.dispatchEvent(ActivityEvent.MIBAO_MONSTER_LIST);
		}
		/**剩余怪物变化*/
		private function onSCMosterNumChangeMessage(msg:SCMosterNumChangeMessage):void
		{Lyt.a("剩余怪物变化:"+msg.MosterNumChange.monsterId+"=="+msg.MosterNumChange.remainingNum);
			MibaoManager.monsterChange(msg.MosterNumChange);
			EventManager.dispatchEvent(ActivityEvent.MIBAO_MONSTER_CHANGE);
		}
		/**积分变化*/
		private function onSCJiFenChangeMessage(msg:SCJiFenChangeMessage):void
		{Lyt.a("积分变化:"+msg.jifenNum);
			EventManager.dispatchEvent(ActivityEvent.MIBAO_JIFEN_CHANGE,msg.jifenNum);
		}
		/**奖励信息*/
		private function onSCMiBaoRewardInfoMessage(msg:SCMiBaoRewardInfoMessage):void
		{Lyt.a("奖励信息:"+msg.reward.length);
			AppManager.showApp(AppConstant.ACTIVETY_MIBAO_RESULT,msg);
		}
	}
}