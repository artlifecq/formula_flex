package com.rpgGame.app.sender
{
	import com.rpgGame.netData.zhengba.message.CSBuyTimeOrPowerMessage;
	import com.rpgGame.netData.zhengba.message.CSChallengeDataMessage;
	import com.rpgGame.netData.zhengba.message.CSDrawAwardMessage;
	import com.rpgGame.netData.zhengba.message.CSOpenArardPanelMessage;
	import com.rpgGame.netData.zhengba.message.CSStartChallengeMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	public class JJBattleSender extends BaseSender
	{
		public function JJBattleSender()
		{
			super();
		}
		public static function reqBuyTimeOrPower(type:int):void
		{
			var msg:CSBuyTimeOrPowerMessage=new CSBuyTimeOrPowerMessage();
			msg.type=type;
			SocketConnection.send(msg);
		}
		public static function reqChallegeRankData(type:int):void
		{
			var msg:CSChallengeDataMessage=new CSChallengeDataMessage();
			msg.type=type;
			SocketConnection.send(msg);
		}
		public static function reqGetReward():void
		{
			var msg:CSDrawAwardMessage=new CSDrawAwardMessage();
		
			SocketConnection.send(msg);
		}
		public static function reqStartFight(player:long,type:int):void
		{
			var msg:CSStartChallengeMessage=new CSStartChallengeMessage();
			msg.targetId=player;
			msg.type=type;
			SocketConnection.send(msg);
		}
		public static function reqRewardPanelData():void
		{
			var msg:CSOpenArardPanelMessage=new CSOpenArardPanelMessage();
			SocketConnection.send(msg);
		}
	}
}