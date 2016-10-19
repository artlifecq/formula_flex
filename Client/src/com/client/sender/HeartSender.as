package com.client.sender
{
	import com.client.ClientCmdID;
	import com.game.engine3D.vo.SenderReferenceSet;

	import flash.utils.getTimer;

	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 心跳包发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午6:05:12
	 *
	 */
	public class HeartSender
	{
		private static const REQ_HEART_DELAY_TIME : int = 10000;
		private static var _reqReferenceSet : SenderReferenceSet = new SenderReferenceSet("HeartSender", onSendHeart, REQ_HEART_DELAY_TIME);
		private static var _bytes : ByteBuffer = new ByteBuffer();

		public function HeartSender()
		{
		}

		/**
		 * 开始
		 */
		public static function start() : void
		{
			_reqReferenceSet.addRef("HeartSender");
		}

		/**
		 * 发送心跳包
		 */
		private static function onSendHeart() : void
		{
			_bytes.clear();
			var millisecond : Number = getTimer();
			_bytes.writeVarint64(millisecond);
			SocketConnection.send(ClientCmdID.C2S_HEART_BEAT, _bytes);
		}
	}
}
