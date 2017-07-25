package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.RankListManager;
	import com.rpgGame.netData.top.message.ResListLeaderToClientMessage;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	import com.rpgGame.netData.top.message.ResWorshipCountMessage;
	import com.rpgGame.netData.top.message.SCTopLeaderMessage;
	
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
			SocketConnection.addCmdListener(141105, getResWorshipCount);
			SocketConnection.addCmdListener(141107, getSCTopLeader);
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
		private function getSCTopLeader(msg:SCTopLeaderMessage):void
		{
			RankListManager.instance.refeashWorshipInfo(msg.topInfo);
		}
		
		private function getResWorshipCount(msg:ResWorshipCountMessage):void
		{
			RankListManager.instance.refeashWorshipCount(msg.count,msg.goldCount,msg.percentage);
		}
	}
}