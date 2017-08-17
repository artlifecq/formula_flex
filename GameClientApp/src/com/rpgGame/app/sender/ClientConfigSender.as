package com.rpgGame.app.sender
{
	

	/**
	 *
	 * 客户端配置发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class ClientConfigSender extends BaseSender
	{
		public function ClientConfigSender()
		{
		}

		/**
		 * 请求配置文件数据
		 *
		 */
		public static function reqConfig() : void
		{
			_bytes.clear();
			_bytes.writeVarint64(0);
//			send(MiscModuleMessages.C2S_REPLY_CONFIG4, _bytes);
		}
	}
}
