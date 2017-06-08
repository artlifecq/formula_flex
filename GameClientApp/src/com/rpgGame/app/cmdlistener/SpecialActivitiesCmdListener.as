package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;
	import com.rpgGame.netData.specialactivities.message.SCActivitiesNotifyListMessage;
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
			finish();
		}
		
		private function onSCActivitiesNotifyListMessage(msg:SCActivitiesNotifyListMessage):void
		{
			
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
			ActivetyDataManager.setActState(msg.activityId,0);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY);
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,1);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY);
			var info:ActivetyInfo=ActivetyDataManager.getActInfoById(msg.activityId); 
			AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
		}
	}
}