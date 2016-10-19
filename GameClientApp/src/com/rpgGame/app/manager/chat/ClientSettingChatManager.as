package com.rpgGame.app.manager.chat
{
	import com.rpgGame.app.sender.MiscSender;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.coreData.enum.EnumClientSettingIndex;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import flash.utils.ByteArray;
	
	import app.client_proto.ChatSetProtoC;
	import app.client_proto.ChatSetTabProtoC;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 客户端聊天设置存储管理
	 * @author Guodong.Zhang
	 * 
	 */
	public class ClientSettingChatManager
	{
		private static var _byteArray:ByteArray;
		private static var _chatSetProto:ChatSetProtoC = new ChatSetProtoC();
		
		public static function initData(byteArray:ByteArray):void
		{
			if(byteArray != null)
			{
				_byteArray = byteArray;
				_byteArray.uncompress();
				if(_byteArray.bytesAvailable)
				{
					_chatSetProto.mergeFrom(byteArray);
				}
			}
			if(_chatSetProto.tabArr == null)
			{
				_chatSetProto.tabArr = [];
			}
			if(isDefault)
			{
				var channelProto:ChatSetTabProtoC = getNewCustomTabProto();
				_chatSetProto.tabArr.push(channelProto);
			}
		}
		
		public static function saveToServer():void
		{
			if(_byteArray == null)
			{
				_byteArray = new ByteArray();
			}
			else
			{
				_byteArray.clear();
			}
			_chatSetProto.nonDefault = true;
			_chatSetProto.writeTo(_byteArray);
			_byteArray.compress();
			MiscSender.reqSetClientOnlyIntConfig(EnumClientSettingIndex.INDEX_CHAT,_byteArray);
			EventManager.dispatchEvent(ChatEvent.CHAT_TABS_SETING);
		}
		
		public static function get isDefault():Boolean
		{
			return !_chatSetProto.nonDefault;
		}
		
		public static function addTab(tabProtoC:ChatSetTabProtoC):void
		{
			_chatSetProto.tabArr.push(tabProtoC);
			saveToServer();
		}
		
		public static function removeTab(tabProtoC:ChatSetTabProtoC):void
		{
			var index:int = _chatSetProto.tabArr.indexOf(tabProtoC);
			if(index >= 0)
			{
				_chatSetProto.tabArr.splice(index,1);
				saveToServer();
			}
		}
		
		public static function getCustomTabList():Array
		{
			return _chatSetProto.tabArr.concat();
		}
		
		public static function getNewCustomTabProto():ChatSetTabProtoC
		{
			var channelProto:ChatSetTabProtoC = new ChatSetTabProtoC();
			channelProto.name = getNewTabName(1);
			channelProto.selectedChannelArr = [EnumChatChannelType.CHAT_CHANNEL_SILIAO,EnumChatChannelType.CHAT_CHANNEL_COUNTRY,EnumChatChannelType.CHAT_CHANNEL_FAMILY];
			return channelProto;
		}
		
		private static function getNewTabName(startOrder:int):String
		{
			var tabName:String = "自定义" + startOrder;
			if(_chatSetProto.tabArr != null)
			{
				var len:int = _chatSetProto.tabArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var tabProtoC:ChatSetTabProtoC = _chatSetProto.tabArr[0];
					if(tabName == tabProtoC.name)
					{
						startOrder++;
						return getNewTabName(startOrder);
					}
				}
			}
			return tabName;
		}
	}
}