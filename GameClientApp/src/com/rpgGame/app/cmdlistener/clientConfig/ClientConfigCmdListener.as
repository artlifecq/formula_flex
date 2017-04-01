package com.rpgGame.app.cmdlistener.clientConfig
{
	import com.rpgGame.app.data.ConfigManager;
	import com.rpgGame.core.events.MiscEvent;
	
	import flash.utils.ByteArray;
	
	import app.cmd.MiscModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 客户端配置命令侦听器
	 * --这个协议，目前可能没有用了，因为现在的配置都是客户端自己都。
	 * @author NEIL
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
			SocketConnection_protoBuffer.addCmdListener(MiscModuleMessages.S2C_REPLY_CONFIG4, onRecConfig4);
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
