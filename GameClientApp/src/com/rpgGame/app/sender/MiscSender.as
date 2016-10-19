package com.rpgGame.app.sender
{
	import flash.utils.ByteArray;
	
	import app.cmd.MiscModuleMessages;

	/**
	 *
	 * 杂项发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class MiscSender extends BaseSender
	{
		public function MiscSender()
		{
		}

		/**
		 * 请求服务器时间
		 *
		 */
		public static function reqServerTime() : void
		{
			_bytes.clear();
			send(MiscModuleMessages.C2S_GET_SERVER_TIME, _bytes);
		}

		/**
		 * 设置客户端的数据
		 *
		 * varint32 标识
		 * bytes 数据
		 */
		public static function reqSetClientOnlyIntConfig(index:int,data : ByteArray) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeBytes(data);
			send(MiscModuleMessages.C2S_SET_CLIENT_CONFIGS, _bytes);
		}
	}
}
