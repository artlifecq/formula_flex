package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
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
			finish();
		}
		
		private function onSCWorldBossResultMessage(msg:SCWorldBossResultMessage):void
		{
			
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
			}
			ActivetyDataManager.sortAllDatas();
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY);
		}
		
		private function onSCSpecialActivityCloseMessage(msg:SCSpecialActivityCloseMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.CLOSE);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY);
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.OPEN);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY);
			var info:ActivetyInfo=ActivetyDataManager.getActInfoById(msg.activityId); 
			AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
		}
	}
}