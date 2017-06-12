package com.rpgGame.app.cmdlistener
{

	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.pvp.message.SCMatchingResultMessage;
	import com.rpgGame.netData.pvp.message.SCDrawDianFengAwardMessage;
	import com.rpgGame.netData.pvp.message.SCOpenDianFengPanelMessage;
	import com.rpgGame.netData.pvp.message.SCOpenDianFengRankMessage;
	import com.rpgGame.netData.pvp.message.SCQuitRaceResultMessage;
	import com.rpgGame.netData.pvp.message.SCRaceResultMessage;
	import com.rpgGame.netData.pvp.message.SCReadyToLoadMessage;
	import com.rpgGame.netData.pvp.message.SCReadyToStartMessage;
	import com.rpgGame.netData.pvp.message.SCStartRaceMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *巅峰对决 
	 * @author yfl
	 * 
	 */	
	public class DFBattleCmdListener extends BaseBean
	{
		public function DFBattleCmdListener()
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(128101, Mgr.d1v1Mgr.CSMatchingResultHandler);
			SocketConnection.addCmdListener(128102, Mgr.d1v1Mgr.SCReadyToLoadHandler);
			SocketConnection.addCmdListener(128103, Mgr.d1v1Mgr.SCReadyToStartHandler);
			SocketConnection.addCmdListener(128104, Mgr.d1v1Mgr.SCStartRaceHandler);
			SocketConnection.addCmdListener(128105, Mgr.d1v1Mgr.SCRaceResultHandler);
			SocketConnection.addCmdListener(128107, Mgr.d1v1Mgr.SCQuitRaceResultHandler);
			SocketConnection.addCmdListener(128109, Mgr.d1v1Mgr.SCOpenDianFengPanelHandler);
			SocketConnection.addCmdListener(128111, Mgr.d1v1Mgr.SCOpenDianFengRankHandler);
			SocketConnection.addCmdListener(128113, Mgr.d1v1Mgr.SCDrawDianFengAwardHandler);
			SocketConnection.addCmdListener(128115, Mgr.d1v1Mgr.SCQuitZoneResultHandler);
			finish();
		}
		

	}
}