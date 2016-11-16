package com.rpgGame.app.sender
{
	import app.cmd.CountryModuleMessages;
	import app.cmd.TaskModuleMessages;
	
	import org.game.netCore.connection.SocketConnection_protoBuffer;

	/**
	 * 发送消息 
	 * @author 陈鹉光
	 * 
	 */	
	public class TouJingSender extends BaseSender
	{
		/**
		 * 读条完毕，偷经，不需要附带任何参数
		 */
		public static function reqDoTouJing():void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send( TaskModuleMessages.C2S_DO_TOU_JING, _bytes );
		}
		
		/**
		 * 开启国家夺经
		 */
		public static function reqStartDuoJing():void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send( CountryModuleMessages.C2S_START_DUO_JING, _bytes );
		}
	}
}