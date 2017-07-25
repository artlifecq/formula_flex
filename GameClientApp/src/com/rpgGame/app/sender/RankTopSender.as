package com.rpgGame.app.sender
{
	import com.rpgGame.netData.top.message.CSTopLeaderMessage;
	import com.rpgGame.netData.top.message.ReqTopWorshipToGameMessage;
	import com.rpgGame.netData.top.message.ReqToplistToGameMessage;
	
	import org.game.netCore.data.long;

	public class RankTopSender extends BaseSender
	{
		public function RankTopSender()
		{
		}
		
		public static function reqRankList(topType:int,starIndex:int,length:int):void
		{
			var msg:ReqToplistToGameMessage = new ReqToplistToGameMessage();
			msg.toptype = topType;
			msg.start = starIndex;
			msg.length = length;
			sendMsg(msg);
		}
		
		public static function reqRankListTopInfo(topType:int):void
		{
			var msg:CSTopLeaderMessage = new CSTopLeaderMessage();
			msg.topType = topType;
			sendMsg(msg);
		}
		
		public static function reqWorship(playerId:long,type:int):void
		{
			var msg:ReqTopWorshipToGameMessage = new ReqTopWorshipToGameMessage();
			msg.playerid = playerId;
			msg.type = type;
			sendMsg(msg);
		}
	}
}