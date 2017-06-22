package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.netData.daysdowngold.message.SCActivityTimeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCCashGiftChangeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCCashGiftClientMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRankInfoMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRemainRefreshTimeMessage;
	import com.rpgGame.netData.daysdowngold.message.SCRewardInfoMessage;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossKillerNameMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
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
			
			/*----------------天降元宝   yt---------------------------------------------*/
			SocketConnection.addCmdListener(130101,onSCRankInfoMessage);
			SocketConnection.addCmdListener(130102,onSCCashGiftClientMessage);
			SocketConnection.addCmdListener(130103,onSCActivityTimeMessage);
			SocketConnection.addCmdListener(130104,onSCRemainRefreshTimeMessage);
			SocketConnection.addCmdListener(130105,onSCRewardInfoMessage);
			SocketConnection.addCmdListener(130106,onSCCashGiftChangeMessage);
			
			
			finish();
		}
		
		private function onSCWorldBossResultMessage(msg:SCWorldBossResultMessage):void
		{
			AppManager.showApp(AppConstant.ACTIVETY_BOSS_RESULT,msg);
		}
		
		private function onResBossDamageInfosToClientMessage(msg:ResBossDamageInfosToClientMessage):void
		{
			EventManager.dispatchEvent(ActivityEvent.UPDATE_BOSS_HURT_RANK,msg);
		}
		
		private function onSCEnterActivityMessage(msg:SCEnterActivityMessage):void
		{
			EventManager.dispatchEvent(ActivityEvent.ENTER_ACTIVITY,msg.activity);
		}
		
		private function onSCWorldBossKillerNameMessage(msg:SCWorldBossKillerNameMessage):void
		{
			ActivetyDataManager.updateBossKiller(msg.activityId,msg.killerName);
		}
		
		/**
		 *活动预告信息 
		 * @param msg
		 * 
		 */
		private function onSCActivitiesNotifyListMessage(msg:SCActivitiesNotifyListMessage):void
		{
			//通过活动id去找该活动id对应的新功能id，然后看该新功能是够开启，然后再在活动按钮里面设置倒计时；
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
		}
		
		private function onSCSpecialActivityCloseMessage(msg:SCSpecialActivityCloseMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.CLOSE);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.OPEN);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
			var info:ActivetyInfo=ActivetyDataManager.getActInfoById(msg.activityId); 
			AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
		}
		
		
		
		/*----------------天降元宝   yt---------------------------------------------*/
		/**排名消息*/
		private function onSCRankInfoMessage(msg:SCRankInfoMessage):void
		{//L.l("排名消息:"+msg.playerCashGiftNum+"+"+msg.playerRankLevel);
			AppManager.showApp(AppConstant.ACTIVETY_LIJIN_SCORES,msg);
			
		}
		/**抢夺怪物*/
		private function onSCCashGiftClientMessage(msg:SCCashGiftClientMessage):void
		{//L.l("抢夺怪物:"+msg.monsterNum+"+"+msg.refresh);
			EventManager.dispatchEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,msg.monsterNum,msg.refresh);
		}
		/**剩余时间*/
		private function onSCActivityTimeMessage(msg:SCActivityTimeMessage):void
		{//L.l("剩余时间:"+msg.remainingTime);
			EventManager.dispatchEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,msg.remainingTime);
		}
		/**刷新时间*/
		private function onSCRemainRefreshTimeMessage(msg:SCRemainRefreshTimeMessage):void
		{//L.l("刷新时间:"+msg.remainRefreshTime);
			AppManager.showApp(AppConstant.ACTIVETY_LIJIN_TIMER,msg.remainRefreshTime);
		}
		/**奖励信息*/
		private function onSCRewardInfoMessage(msg:SCRewardInfoMessage):void
		{//L.l("奖励信息:"+msg.reward.length);
			AppManager.showApp(AppConstant.ACTIVETY_LIJIN_RESULT,msg.reward);
		}
		/**元宝变化*/
		private function onSCCashGiftChangeMessage(msg:SCCashGiftChangeMessage):void
		{//L.l("元宝变化:"+msg.cashGiftNum);
			EventManager.dispatchEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,msg.cashGiftNum);
		}
		
	}
}