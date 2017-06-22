package com.rpgGame.app.sender
{
	import com.rpgGame.netData.convoy.message.CSClientDataMessage;
	import com.rpgGame.netData.convoy.message.CSConvoyGirlMessage;
	import com.rpgGame.netData.convoy.message.CSGoConvoyMessage;
	import com.rpgGame.netData.convoy.message.CSRefreshGirlMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	public class HuBaoSender extends BaseSender
	{
		public function HuBaoSender()
		{
			super();
		}
		
		/**
		 * 护送请求
		 * */
		public static function upCSConvoyGirlMessage(isnotice:int=1):void
		{
			var msg:CSConvoyGirlMessage=new CSConvoyGirlMessage();
			msg.isnotice=isnotice;
			SocketConnection.send(msg);
		}
		
		/**
		 * 前往护送请求
		 * */
		public static function upCSGoConvoyMessage():void
		{
			var msg:CSGoConvoyMessage=new CSGoConvoyMessage();
			SocketConnection.send(msg);
		}
		
		/**
		 * 更新品质请求
		 * */
		public static function upCSRefreshGirlMessage(iszidong:int):void
		{
			var msg:CSRefreshGirlMessage = new CSRefreshGirlMessage();
			msg.isUse = iszidong;
			SocketConnection.send(msg);
		}
		
		/**
		 * 发送任务请求
		 * */
		public static function upCSClientDataMessage(id:int):void
		{
			var msg:CSClientDataMessage=new CSClientDataMessage();
			msg.monsterId=id;
			SocketConnection.send(msg);
		}
	}
}