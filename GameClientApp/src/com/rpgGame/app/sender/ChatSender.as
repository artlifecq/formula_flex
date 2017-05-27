package com.rpgGame.app.sender
{
	import com.rpgGame.netData.chat.bean.ExtraReqInfo;
	import com.rpgGame.netData.chat.bean.HyperInfo;
	import com.rpgGame.netData.chat.message.ReqChatMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	
	/**
	 * 聊天发送
	 * @author dik
	 * 
	 */
	public class ChatSender extends BaseSender
	{
		
		public static function cs_sendChat(chatText:String,type:int,targetName:String = null,hyperInfos:Vector.<HyperInfo>=null):void
		{
			var msg:ReqChatMessage=new ReqChatMessage();
			msg.chatText=chatText;
			msg.type=type;
			var extraReqInfo:ExtraReqInfo=new ExtraReqInfo();
			extraReqInfo.targetPlayerName=targetName;
			extraReqInfo.hyperInfos=hyperInfos;
			msg.extraReqInfo=extraReqInfo;
			
			SocketConnection.send(msg);
		}
	}
}
