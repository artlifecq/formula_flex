package com.rpgGame.app.sender
{
	import com.rpgGame.netData.top.message.ReqToplistToGameMessage;

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
	}
}