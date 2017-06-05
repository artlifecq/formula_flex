package com.client.sender
{
	import com.game.engine3D.vo.SenderReferenceSet;
	import com.rpgGame.core.events.SystemTimeEvent;
	import com.rpgGame.netData.login.message.ReqHeartMessage;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
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
		
		public static var serverTimeCheck:int = 0;
		public static var clientTimeCheck:int = 0;
		
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
			/*_bytes.clear();
			var millisecond : Number = getTimer();
			_bytes.writeVarint64(millisecond);
			SocketConnection_protoBuffer.send(ClientCmdID.C2S_HEART_BEAT, _bytes);*/
			var msg:ReqHeartMessage = new ReqHeartMessage();
			msg.time = getTimer();
			SocketConnection.send(msg);
		}
	}
}
