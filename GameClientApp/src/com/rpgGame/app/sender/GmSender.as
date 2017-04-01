package com.rpgGame.app.sender
{
	import com.rpgGame.netData.gm.message.ReqGmCommandMessage;
	
	import org.game.netCore.connection.SocketConnection;

	/**
	 * GM命令面板
	 * @author Carver
	 * ModuleID==9
	 */
	public class GmSender extends BaseSender
	{
		/**
		 *发消息
		 *
		 */
		public static function sendMsg(pmStr : String) : void
		{
			trace("发送ＧＭ命令：", pmStr);
			var pm : String = pmStr.toLowerCase();
			
			var msg:ReqGmCommandMessage = new ReqGmCommandMessage();
			msg.command = pm;
			SocketConnection.send(msg);
		}
	}
}
