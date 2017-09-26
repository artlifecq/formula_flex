package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.player.handler.SCSuperVipHandler;
	import com.rpgGame.netData.player.message.SCSuperVipMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class OpenActivityCmdListener extends BaseBean
	{
		public function OpenActivityCmdListener()
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(181101,  Mgr.activityPanelMgr.onResActivitiesInfoMessage);
			SocketConnection.addCmdListener(181102, Mgr.activityPanelMgr.resActivitiesGetRewardInfoMsg);
			SocketConnection.addCmdListener(181103, Mgr.activityPanelMgr.resActivitiesRefreshMsg);
			SocketConnection.addCmdListener(181104,Mgr.activityPanelMgr.recActivityInfoChange);
			SocketConnection.addCmdListener(103133,Mgr.activityPanelMgr.onSCSuperVipHandler);
			SocketConnection.addCmdListener(103134,ActivetyDataManager.onSCLimitChallengePKStateChangeHandler);
			finish();
		}
		
	}
}