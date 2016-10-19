package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.events.GMEvent;
	
	import app.cmd.GMModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	public class GMCmdListener extends BaseBean
	{
		public function GMCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(GMModuleMessages.S2C_GM_REPLY, onRecGmReply);

			finish();
		}

		/**
		 * 显示在gm面板上的话
		 *
		 * 附带个utf. 需支持html格式符
		 */
		private static function onRecGmReply(buffer : ByteBuffer) : void
		{
			var str : String = buffer.readUTF();
			str = str.replace(/<br>/g, "\n")
			EventManager.dispatchEvent(GMEvent.GM_INFO_RET, str);
		}
	}
}
