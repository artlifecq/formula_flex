package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class JJBattleCmdListener extends BaseBean
	{
		public function JJBattleCmdListener()
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(127102,Mgr.jjBattleMgr.SCChallengeDataHandler);
			SocketConnection.addCmdListener(127104, Mgr.jjBattleMgr.SCChallengeResultHandler);
			SocketConnection.addCmdListener(127106,Mgr.jjBattleMgr.SCDrawAwardResultHandler);
			SocketConnection.addCmdListener(127107,  Mgr.jjBattleMgr.SCUpdateZhengBaDataHandler);
			SocketConnection.addCmdListener(127109, Mgr.jjBattleMgr.SCOpenArardPanelHandler);
			finish();
		}	
	}
}