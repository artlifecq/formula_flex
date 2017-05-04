package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.cheats.message.SCCheatsInfoMessage;
	import com.rpgGame.netData.cheats.message.SCCheatsListMessage;
	import com.rpgGame.netData.cheats.message.SCNodeInfoMessage;
	import com.rpgGame.netData.meridian.message.SCMeridianInfoMessage;
	import com.rpgGame.netData.meridian.message.SCMeridianListMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *心法的 
	 * @author Administrator
	 * 
	 */	
	public class CheatsCmdListerner extends BaseBean
	{
		public function CheatsCmdListerner()
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(226101,recCheatsList);
			SocketConnection.addCmdListener(226102,recSingleCheatsInfo);
			SocketConnection.addCmdListener(226103,recSingleNodeInfo);
			finish();
		}
		
		private function recSingleNodeInfo(msg:SCNodeInfoMessage):void
		{
			// TODO Auto Generated method stub
			Mgr.cheatsMgr.recCheatsNodeChange(msg.info);
		}
		private function recSingleCheatsInfo(msg:SCCheatsInfoMessage):void
		{
			Mgr.cheatsMgr.recCheatsChange(msg.info);
		}
		private function recCheatsList(msg:SCCheatsListMessage):void
		{
			Mgr.cheatsMgr.recCheatsList(msg.infos);
			
		}
	}
}