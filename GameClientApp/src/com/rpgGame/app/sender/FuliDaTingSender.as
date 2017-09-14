package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.netData.gameactivities.message.CSGetSevenDayRewardMessage;
	import com.rpgGame.netData.gameactivities.message.ReqGotGrownGiftMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	public class FuliDaTingSender extends BaseSender
	{
		/**
		 * 兑换码请求
		 * */
		public static function reqCardToServerMessage(text:String):void
		{
			
		}
		
		/**
		 * 等级礼包领取请求
		 * */
		public static function reqGotGrownGiftMessage(lv:int):void
		{
			var msg:ReqGotGrownGiftMessage=new ReqGotGrownGiftMessage();
			msg.level=lv;
			SocketConnection.send(msg);
		}
		
		
		/**
		 * 7日豪礼领取请求
		 * */
		public static function reqSevenDayRewardMessage(day:int):void
		{
			if (ReqLockUtil.isReqLocked(410201))
				return;
			ReqLockUtil.lockReq(410201,2000);
			var msg:CSGetSevenDayRewardMessage = new CSGetSevenDayRewardMessage();
			msg.activeId = day;
			SocketConnection.send(msg);
		}
		
	}
}