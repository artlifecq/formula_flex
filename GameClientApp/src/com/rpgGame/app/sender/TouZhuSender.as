package com.rpgGame.app.sender
{
	import org.game.netCore.connection.SocketConnection_protoBuffer;

	public class TouZhuSender extends BaseSender
	{
		
		/**
		 * 接受偷猪任务
		 */
		public static function reqAcceptTouZhuTask():void
		{
			_bytes.clear();
//			SocketConnection.send(TaskModuleMessages.C2S_ACCEPT_TOU_ZHU_TASK ,_bytes);
		}
		
		/**
		 * 申请开始偷猪
		 * varint64 猪在场景中的id
		 */
		public static function reqStratTouZhu( monsterId:Number ):void
		{
			_bytes.clear();
			_bytes.writeVarint64( monsterId );
//			SocketConnection_protoBuffer.send(TaskModuleMessages.C2S_STRAT_TOU_ZHU ,_bytes);
		}
		
		/**
		 * 进度条走完了，偷猪
		 * varint64 猪在场景中的id
		 */
		public static function reqDoTouZhuTask( monsterId:Number ):void
		{
			_bytes.clear();
			_bytes.writeVarint64( monsterId );
//			SocketConnection.send( TaskModuleMessages.C2S_DO_TOU_ZHU, _bytes);
		}
		
		/**
		 * 完成偷猪任务
		 */
		public static function reqCompleteTouZhuTask():void
		{
			_bytes.clear();
//			SocketConnection_protoBuffer.send( TaskModuleMessages.C2S_COMPLETE_TOU_ZHU_TASK ,_bytes);
		}
	}
}