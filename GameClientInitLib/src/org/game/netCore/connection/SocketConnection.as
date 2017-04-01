package org.game.netCore.connection
{
	import flash.events.Event;
	
	import org.game.netCore.net.GameSocketDispatcher;
	import org.game.netCore.net.Message;
	import org.game.netCore.net.MessageMgr;

	public class SocketConnection
	{
		private static var _messageMgr:MessageMgr;
		public function SocketConnection()
		{
		}
		
		public static function get messageMgr():MessageMgr
		{
			_messageMgr = MessageMgr.Ins;
			return _messageMgr;
		}
		
		public static function addCmdListener(id:int, listener:Function):void
		{
			GameSocketDispatcher.addListener(id, listener);
		}
		
		public static function removeCmdListener(id:int, listener:Function):void
		{
			GameSocketDispatcher.removeListener(id, listener);
		}
		
		public static function dispatchCmd(type:int, event:Event):void
		{
			GameSocketDispatcher.excute(type, event);
		}
		
		public static function hasCmdListener(id:int):Boolean
		{
			return GameSocketDispatcher.hasListener(id);
		}
		
		public static function willTriggerCmd(id:int, listener:Function):Boolean
		{
			return GameSocketDispatcher.willTrigger(id, listener);
		}
		
		private static function getCmdID(id:uint):String
		{
			return id.toString();
		}
		
		public static function addGapSendMsg(msg:String, gapTm:int, ... arg):void
		{
//			mainSocket.addLockUnlockMsg(msg, arg, gapTm);
		}
		
		public static function send(message:Message):void
		{
			if(!_messageMgr)_messageMgr=MessageMgr.Ins;
			_messageMgr.send(message);
		}
		
		/*public static function messsageUnCompress(orgBytes:ByteBuffer, msgIDs:String):ByteBuffer
		{
			var buffer:ByteBuffer = new ByteBuffer();
			try
			{
				orgBytes.readBytes(buffer, 0, (orgBytes.length - orgBytes.position));
				buffer.uncompress();
			}
			catch(e:Error)
			{
				trace(msgIDs + "解压字节流出错了", e.toString(), e.getStackTrace());
				throw e;
			}
			return buffer;
		}*/
		
		public static function excuteAll():void
		{
			trace("///////////////////////////////////////执行所有协议///////////////////////////////////////");
		}
	}
}