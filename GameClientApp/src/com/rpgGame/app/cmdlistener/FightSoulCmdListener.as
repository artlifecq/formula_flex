package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulDatasMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	public class FightSoulCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(223004, getFightSoulDatasMessage);
			finish();
		}
		
		private function getFightSoulDatasMessage(datas:SCFightSoulDatasMessage):void
		{
			FightSoulManager.instance().fightSoulInfo = datas.fightSoulInfo;
		}
	}
}