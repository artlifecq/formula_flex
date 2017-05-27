package com.rpgGame.app.sender
{
	import com.rpgGame.netData.lunjian.message.CSLunJianPanelInfosMessage;
	import com.rpgGame.netData.zone.message.CSClientTriggerValiedMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonEnterMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonQuitMessage;
	import com.rpgGame.netData.zone.message.ReqZoneOutToGameMessage;
	
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
		 *请求进入副本 
		 * 
		 */
		public static function reqEnterDungeon(dungeonid:int,data:int=0):void
		{
			var msg:ReqZoneCommonEnterMessage=new ReqZoneCommonEnterMessage();
			msg.zoneModelid=dungeonid;
			msg.extradata=data;
			SocketConnection.send(msg);
		}
		
		/**
		 *请求退出副本 
		 * 
		 */
		public static function reqQuitDungeon():void
		{
			var msg:ReqZoneCommonQuitMessage=new ReqZoneCommonQuitMessage();
			SocketConnection.send(msg);
		}
		/**
		 *请求退出副本 
		 * 
		 */
		public static function zoneOutToGame():void
		{
			var msg:ReqZoneOutToGameMessage=new ReqZoneOutToGameMessage();
			SocketConnection.send(msg);
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
		
		
		/**
		 *发送触发信息
		 * 
		 */
		public static function reqTrigger(trid:int):void
		{
			var msg:CSClientTriggerValiedMessage=new CSClientTriggerValiedMessage();
			msg.triggerId=trid;
			SocketConnection.send(msg);
		}
		
	}
}