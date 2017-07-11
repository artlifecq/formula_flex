package com.rpgGame.app.sender
{
	import com.rpgGame.netData.vip.message.ReqGetVipAwardMessage;
	
	import org.game.netCore.connection.SocketConnection;
	

	/**
	 * vip sender
	 * @author EC
	 * ModuleID==15
	 */
	public class VipSender extends BaseSender
	{
		//====================== 请求消息 =============================
		
	
		public static function ReqGetVipWard(vipLv:int):void
		{
			var msg:ReqGetVipAwardMessage = new ReqGetVipAwardMessage();
			msg.vipId=vipLv;
			SocketConnection.send(msg);
		}
		
	}
}