package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.netData.card.message.ReqCardToServerMessage;
	import com.rpgGame.netData.gameactivities.message.CSGetOnlineRewardMessage;
	import com.rpgGame.netData.gameactivities.message.CSGetSevenDayRewardMessage;
	import com.rpgGame.netData.gameactivities.message.CSRefreshPanelMessage;
	import com.rpgGame.netData.gameactivities.message.ReqGotGrownGiftMessage;
	import com.rpgGame.netData.sign.message.ReqSignAddToGameMessage;
	import com.rpgGame.netData.sign.message.ReqSignInfoToGameMessage;
	import com.rpgGame.netData.sign.message.ReqSignObtainAwardMessage;
	import com.rpgGame.netData.sign.message.ReqSignStrikeMessage;
	import com.rpgGame.netData.sign.message.ReqSignSumAwardToGameMessage;
	import com.rpgGame.netData.sign.message.ReqSignToGameMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	public class FuliDaTingSender extends BaseSender
	{
		/**
		 * 兑换码请求
		 * */
		public static function reqCardToServerMessage(text:String):void
		{
			var msg:ReqCardToServerMessage=new ReqCardToServerMessage();
			msg.card=text;
			SocketConnection.send(msg);
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
		 * 请求在线时间
		 * */
		public static function onCSRefreshPanelMessage():void
		{
			var msg:CSRefreshPanelMessage=new CSRefreshPanelMessage();
			SocketConnection.send(msg);
		}
		
		/**
		 * 请求领取在线奖励
		 * */
		public static function onCSGetOnlineRewardMessage(time:int):void
		{
			var msg:CSGetOnlineRewardMessage=new CSGetOnlineRewardMessage();
			msg.time	=time;
			SocketConnection.send(msg);
		}
		
		
		/**
		 * 7日豪礼领取请求
		 * */
		public static function reqSevenDayRewardMessage(day:int):void
		{
			if (ReqLockUtil.isReqLocked(410201))
				return;
			ReqLockUtil.lockReq(410201,1000);
			var msg:CSGetSevenDayRewardMessage = new CSGetSevenDayRewardMessage();
			msg.activeId = day;
			SocketConnection.send(msg);
		}
		
		
		/**
		 * 请求补签
		 * */
		public static function reqSignAddToGameMessage(day:int):void
		{
			var msg:ReqSignAddToGameMessage = new ReqSignAddToGameMessage();
			msg.day = day;
			SocketConnection.send(msg);
		}
		
		/**
		 * Vip领取额外奖励
		 * */
		public static function reqSignObtainAwardMessage():void
		{
			var msg:ReqSignObtainAwardMessage = new ReqSignObtainAwardMessage();
			SocketConnection.send(msg);
		}
		
		/**
		 * 提前签到
		 * */
		public static function reqSignStrikeMessage(day:int,month:int):void
		{
			var msg:ReqSignStrikeMessage = new ReqSignStrikeMessage();
			msg.strikeDday = day;
			msg.strikeMonth=month;
			SocketConnection.send(msg);
		}
		/**
		 * 请求领取累计签到奖励
		 * */
		public static function reqSignSumAwardToGameMessage(day:int):void
		{
			var msg:ReqSignSumAwardToGameMessage = new ReqSignSumAwardToGameMessage();
			msg.day = day;
			SocketConnection.send(msg);
		}
		/**
		 * 请求签到
		 * */
		public static function reqSignToGameMessage(day:int):void
		{
			var msg:ReqSignToGameMessage = new ReqSignToGameMessage();
			SocketConnection.send(msg);
		}
		
	}
}