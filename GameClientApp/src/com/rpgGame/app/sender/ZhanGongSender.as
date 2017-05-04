package com.rpgGame.app.sender
{
	import com.rpgGame.netData.zhangong.message.CSMeritoriousUpgradeMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	public class ZhanGongSender extends BaseSender
	{
		public function ZhanGongSender()
		{
			super();
		}
		
		/**战功升级请求*/
		public static function upZhanGongMessage(type:int,num:int=1):void
		{
			var msg:CSMeritoriousUpgradeMessage=new CSMeritoriousUpgradeMessage();
			msg.type=type;
			msg.number=num;
			SocketConnection.send(msg);
		}
	}
}