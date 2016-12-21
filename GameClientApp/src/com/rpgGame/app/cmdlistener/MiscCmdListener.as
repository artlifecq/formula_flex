package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.netData.login.message.ResHeartMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

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
			SocketConnection.addCmdListener(100106,RecvResHeartMessage);
			finish();
		}
		
		private function RecvResHeartMessage(msg:ResHeartMessage):void
		{
			SystemTimeManager.RecvHeartMessage(msg);
		}
		
//		private function onRecServerTime(buffer : ByteBuffer) : void
//		{
//			var serverTime : Number = buffer.readLong();
//			SystemTimeManager.setServerTime(serverTime);
//		}
	}
}
