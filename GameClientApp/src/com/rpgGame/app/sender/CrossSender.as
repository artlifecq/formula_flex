package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.scene.FirstEnterSceneManager;
	import com.rpgGame.netData.cross.message.ReqEnterCrossClientToGameMessage;
	import com.rpgGame.netData.cross.message.ReqLoginFightServerClientToFightMessage;
	import com.rpgGame.netData.cross.message.ReqQuitClientToFightMessage;
	import com.rpgGame.netData.cross.message.ResChangeServerGameToClientMessage;
	
	import flash.events.Event;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.MessageMgr;

	/**
	 *跨服请求器
	 *@author dik
	 *2017-5-24下午3:27:51
	 */
	public class CrossSender extends BaseSender
	{
		private static var crossMsgInfo:ResChangeServerGameToClientMessage;
		public function CrossSender()
		{
		}
		
		/**
		 *请求进入跨服 
		 * 
		 */
		public static function reqEnterCrossInfo(type:int):void
		{
			var msg:ReqEnterCrossClientToGameMessage=new ReqEnterCrossClientToGameMessage();
			msg.type=type;
			sendMsg(msg);
		}
		
		/**
		 *请求进入跨服战斗 
		 * 
		 */
		public static function reqEnterCrossFight(msgInfo:ResChangeServerGameToClientMessage):void
		{
			crossMsgInfo=msgInfo;
			SocketConnection.messageMgr.addEventListener(MessageMgr.CROSS_CONNECT_OK,onCrossOk);
			SocketConnection.messageMgr.connectCrossServer(msgInfo.serverIp,msgInfo.serverPort,msgInfo.serverSSLPort);
		}
		
		private static function onCrossOk(event:Event):void
		{
			SocketConnection.messageMgr.removeEventListener(MessageMgr.CROSS_CONNECT_OK,onCrossOk);
			var msg:ReqLoginFightServerClientToFightMessage=new ReqLoginFightServerClientToFightMessage();
			msg.fightServerKey=crossMsgInfo.fightServerKey;
			msg.oldserverKey=crossMsgInfo.oldserverKey;
			msg.playerId=crossMsgInfo.playerId;
			msg.userId=crossMsgInfo.userId;
			sendMsg(msg);
			FirstEnterSceneManager.isEnterScene=false;
		}
		
		/**
		 *请求退出跨服 
		 * 
		 */
		public static function reqQuitCrossFight():void
		{
			var msg:ReqQuitClientToFightMessage=new ReqQuitClientToFightMessage();
			sendMsg(msg);
			FirstEnterSceneManager.isEnterScene=true;
		}
	}
}