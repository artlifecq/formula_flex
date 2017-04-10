package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulChangeCountMessage;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulChangeModelResultMessage;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulDatasMessage;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulExpChangeMessage;
	import com.rpgGame.netData.fightsoul.message.SCFightSoulLevelUpMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	public class FightSoulCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(223004, getFightSoulDatasMessage);
			SocketConnection.addCmdListener(223002, getFightSoulUpLevelMessage);
			SocketConnection.addCmdListener(223001, getFightSoulExpChangeMessage);
			SocketConnection.addCmdListener(223003, getSCFightSoulChangeCountMessage);
			SocketConnection.addCmdListener(223005, getSCFightSoulChangeModelResultMessage);
			finish();
		}
		
		private function getSCFightSoulChangeModelResultMessage(msg:SCFightSoulChangeModelResultMessage):void
		{
			FightSoulManager.instance().updateMode(msg.changeModelLv);
		}
		
		private function getSCFightSoulChangeCountMessage(msg:SCFightSoulChangeCountMessage):void
		{
			FightSoulManager.instance().updataCount(msg.type,msg.count);
		}
		private function getFightSoulExpChangeMessage(msg:SCFightSoulExpChangeMessage):void
		{
			FightSoulManager.instance().updataExp(msg.curExp,msg.vitality);
		}
		private function getFightSoulUpLevelMessage(msg:SCFightSoulLevelUpMessage):void
		{
			FightSoulManager.instance().updata(msg.level,msg.curExp);
		}
		
		private function getFightSoulDatasMessage(datas:SCFightSoulDatasMessage):void
		{
			FightSoulManager.instance().fightSoulInfo = datas.fightSoulInfo;
		}
	}
}