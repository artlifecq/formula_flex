package com.rpgGame.app.sender
{

	
	import com.rpgGame.netData.pvp.message.CSDFMatchingMessage;
	import com.rpgGame.netData.pvp.message.CSDrawDianFengAwardMessage;
	import com.rpgGame.netData.pvp.message.CSOpenDianFengPanelMessage;
	import com.rpgGame.netData.pvp.message.CSOpenDianFengRankMessage;
	import com.rpgGame.netData.pvp.message.CSQuitRaceMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import com.rpgGame.netData.pvp.message.CSQuitZoneMessage;


	public class D1v1BattleSender extends BaseSender
	{
		public function D1v1BattleSender()
		{
			super();
		}
		public static function reqQuitFB():void
		{
			var msg:CSQuitZoneMessage=new CSQuitZoneMessage();
			
			SocketConnection.send(msg);
		}
		public static function reqDFMatch():void
		{
			var msg:CSDFMatchingMessage=new CSDFMatchingMessage();
			
			SocketConnection.send(msg);
		}
		public static function reqGetReward():void
		{
			SocketConnection.send(new CSDrawDianFengAwardMessage());
		}
		public static function reqPanelData():void
		{
			SocketConnection.send(new CSOpenDianFengPanelMessage());
		}
		public static function reqDFRankData(page:int):void
		{
			var msg:CSOpenDianFengRankMessage=new CSOpenDianFengRankMessage();
			msg.page=page;
			SocketConnection.send(msg);
		}
		public static function reqQuitRaceGame():void
		{
			SocketConnection.send(new CSQuitRaceMessage());
		}
	}
}