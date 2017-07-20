package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.RankListManager;
	import com.rpgGame.netData.top.message.ResListLeaderToClientMessage;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	public class RankCmdListener extends BaseBean
	{
		public function RankCmdListener()
		{
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(141101, getResToplistToClientMessage);
			SocketConnection.addCmdListener(141102, getResListLeaderToClient);
			finish();
		}
		
		private function getResToplistToClientMessage(msg:ResToplistToClientMessage):void
		{
			RankListManager.instance.updataToplistMessage(msg);
		}
		private function getResListLeaderToClient(msg:ResListLeaderToClientMessage):void
		{
			RankListManager.instance.updataListAndType(msg.topInfolist,msg.toptype);
		}
	}
}