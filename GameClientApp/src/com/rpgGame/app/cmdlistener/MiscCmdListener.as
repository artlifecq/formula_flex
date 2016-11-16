package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	
	import app.cmd.MiscModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 杂项命令侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class MiscCmdListener extends BaseBean
	{
		public function MiscCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(MiscModuleMessages.S2C_REPLY_SERVER_TIME, onRecServerTime);
			
			finish();
		}

		private function onRecServerTime(buffer : ByteBuffer) : void
		{
			var serverTime : Number = buffer.readLong();
			SystemTimeManager.setServerTime(serverTime);
		}
	}
}
