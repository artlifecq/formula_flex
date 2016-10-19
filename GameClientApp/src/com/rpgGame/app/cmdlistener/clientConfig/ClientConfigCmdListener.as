package com.rpgGame.app.cmdlistener.clientConfig
{
	import com.rpgGame.app.data.ConfigManager;
	import com.rpgGame.core.events.MiscEvent;
	
	import flash.utils.ByteArray;
	
	import app.cmd.MiscModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 客户端配置命令侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class ClientConfigCmdListener extends BaseBean
	{
		private var _tempBytes : ByteBuffer;

		public function ClientConfigCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(MiscModuleMessages.S2C_REPLY_CONFIG4, onRecConfig4);
			finish();
		}

		private function onRecConfig4(buffer : ByteBuffer) : void
		{
			var isComplete : Boolean = buffer.readBoolean();
			if (_tempBytes == null)
			{
				_tempBytes = new ByteBuffer();
			}
			buffer.readBytes(_tempBytes, _tempBytes.length, buffer.bytesAvailable);
			if (isComplete)
			{
				var position : int = _tempBytes.position;
				var tempByteArray : ByteArray = new ByteArray();
				_tempBytes.readBytes(tempByteArray, 0, _tempBytes.bytesAvailable);
				_tempBytes.position = position;

				//var result : ByteBuffer = SocketConnection.messsageUnCompress(_tempBytes, ClientConfigCmd.S2C_REPLY_CONFIG4);
				ConfigManager.recServerConfig(_tempBytes);
				EventManager.dispatchEvent(MiscEvent.CONGFIG_ALL_CMP);
			}
		}
	}
}
