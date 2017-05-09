package com.rpgGame.app.sender
{
	import com.rpgGame.netData.lunjian.message.CSLunJianPanelInfosMessage;
	
	import org.game.netCore.connection.SocketConnection;

	/**
	 *副本请求器
	 *@author dik
	 *2017-5-8下午1:39:20
	 */
	public class DungeonSender extends BaseSender
	{
		public function DungeonSender()
		{
			super();
		}
		
		/**
		 *请求论剑信息 
		 * 
		 */
		public static function reqLunJianPanelInfos():void
		{
			var msg:CSLunJianPanelInfosMessage=new CSLunJianPanelInfosMessage();
			SocketConnection.send(msg);
		}
	}
}