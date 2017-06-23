package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class NineTowerCmdListener extends BaseBean
	{
		public function NineTowerCmdListener()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(129101, Mgr.nineTowerMgr.SCEnterYaoTaResultHandler);
			SocketConnection.addCmdListener(129103, Mgr.nineTowerMgr.SCYaoTaLogHandler);
			SocketConnection.addCmdListener(129104, Mgr.nineTowerMgr.SCUpdateYaoTaHandler);
			SocketConnection.addCmdListener(129106, Mgr.nineTowerMgr.SCYaoTaIntegralHandler);
			SocketConnection.addCmdListener(129108,Mgr.nineTowerMgr.SCQuitYaoTaHandler);
			SocketConnection.addCmdListener(129109, Mgr.nineTowerMgr.SCYaoTaAwardHandler);
			SocketConnection.addCmdListener(129110, Mgr.nineTowerMgr.SCWarChessHandler);
			SocketConnection.addCmdListener(129112, Mgr.nineTowerMgr.SCOpenYaoTaPanelHandler);
			SocketConnection.addCmdListener(129114, Mgr.nineTowerMgr.SCDrawYaoTaAwardHandler);
			finish();
		}	
		
	
	}
}