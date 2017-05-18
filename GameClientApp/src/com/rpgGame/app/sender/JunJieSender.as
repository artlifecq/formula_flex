package com.rpgGame.app.sender
{
	import com.rpgGame.netData.junjie.message.CSJunJieActivateMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	public class JunJieSender extends BaseSender
	{
		public function JunJieSender()
		{
			super();
		}
		
		/**
		 * 军阶激活请求
		 * */
		public static function upCSJunJieActivateMessage(id:int):void
		{
			var msg:CSJunJieActivateMessage=new CSJunJieActivateMessage();
			msg.modelId=id;
			SocketConnection.send(msg);
		}
	}
}