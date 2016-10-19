package com.rpgGame.app.sender
{
	import com.gameClient.log.GameLog;
	
	import flash.utils.ByteArray;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 所有发向服务端的数据和方法都只能通过 在BaseSender的子类sender类里定义，方法参数必须明确，
	 * 可以考略按功能将此类分割，比如按照操作物品，和操作任务的划分
	 * 但需要保持的一个规则也就是要确保同一条命令（CmdId）向服务端发送的地方只能有一个，
	 * 
	 *  @author fly.liuyang
	 * 创建时间：2014-2-25 下午6:21:10
	 * 
	 */	
	public class BaseSender
	{
		private static var _emptyBy:ByteArray = new ByteArray();
		protected static var _bytes:ByteBuffer = new ByteBuffer();
		
		public function BaseSender()
		{
			GameLog.throwError(new Error("BaseSender 不可实例化"))
		}
		
		/**
		 * 向服务端发送数据 
		 * 任何时候都请不要修改此函数的访问限制符号（protected），必须保持其私有性
		 * 用以确保同一条命令（CmdId）向服务端发送的地方只有一个
		 * 
		 * @param cmdID		命令号
		 * @param args		需要发送的数据
		 * 
		 */		
		protected static function send(cmdID:String,data:ByteArray=null):void
		{
			_emptyBy.clear();
			data = data || _emptyBy;
			//此处写ByteArray的代码为临时代码，需要根据服务端的规则修改写的规则 
//			if(args && args.length > 0)
//			{
//				data = new ByteArray();
//				for each(var i:* in args)
//				{
//					if(i is String)
//					{
//						data.writeUTFBytes(i);
//					}
//					else if(i is ByteArray)
//					{
//						data.writeBytes(i);
//					}
//					else
//					{
//						data.writeUnsignedInt(i);
//					}
//				}
//			}
			
			SocketConnection.send(cmdID,data);
		}
		
	}
}