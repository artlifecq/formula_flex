package com.rpgGame.app.sender
{
	import com.rpgGame.netData.player.message.ReqOthersPlayerInfoMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
	
	/**
	 *查看信息发送器 
	 * @author dik
	 * 
	 */
	public class LookSender extends BaseSender
	{
		/**
		 *查看其它玩家信息 
		 * @param id 玩家id
		 * 
		 */
		public static function lookOtherPlayer(id:long):void
		{
			var msg:ReqOthersPlayerInfoMessage=new ReqOthersPlayerInfoMessage();
			msg.personId=id;
			SocketConnection.send(msg);
		}
	}
}