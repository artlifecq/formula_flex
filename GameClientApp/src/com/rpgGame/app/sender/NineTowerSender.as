package com.rpgGame.app.sender
{
	import com.rpgGame.netData.yaota.message.CSOpenYaoTaPanelMessage;
	import com.rpgGame.netData.yaota.message.CSQuitYaoTaMessage;
	import com.rpgGame.netData.yaota.message.CSYaoTaIntegralMessage;
	import com.rpgGame.netData.yaota.message.CSYaoTaLogMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import com.rpgGame.netData.yaota.message.CSGetPlayerPostionMessage;

	public class NineTowerSender extends BaseSender
	{
		public static function reqTrackFlagPlayer():void
		{
			var msg:CSGetPlayerPostionMessage=new CSGetPlayerPostionMessage();
			SocketConnection.send(msg);
		}
		public static function reqPanelData():void
		{
			var msg:CSOpenYaoTaPanelMessage=new CSOpenYaoTaPanelMessage();
			SocketConnection.send(msg);
		}
		public static function reqEnterTower(act:int):void
		{
			SpecialActivitySender.reqJoinAct(act);
			//var msg:CSEnterYaoTaMessage=new CSEnterYaoTaMessage();
			//SocketConnection.send(msg);
		}
		public static function reqQuitTower():void
		{
			var msg:CSQuitYaoTaMessage=new CSQuitYaoTaMessage();
			SocketConnection.send(msg);
		}
		public static function reqTowerScore():void
		{
			SocketConnection.send(new CSYaoTaIntegralMessage());
		}
		public static function reqTowerLog():void
		{
			SocketConnection.send(new CSYaoTaLogMessage());
		}
	}
}