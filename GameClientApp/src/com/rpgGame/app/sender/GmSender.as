package com.rpgGame.app.sender
{
	import app.cmd.GMModuleMessages;
	
	import org.game.netCore.connection.SocketConnection_protoBuffer;

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

			_bytes.clear();
			_bytes.writeUTF(pm);

			SocketConnection_protoBuffer.send(GMModuleMessages.C2S_GM_QUERY, _bytes);
		}
	}
}
