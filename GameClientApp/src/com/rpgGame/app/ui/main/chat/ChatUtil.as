package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.lang.LangChat;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.utils.ByteArray;

	public class ChatUtil
	{

		/**
		 * 在聊天框里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function getChatMessageByChannel(channel : int,message:String) : String
		{
			return HtmlTextUtil.getTextColor(getChannelColor(channel), "【" + ChatUtil.getChannelTitle(channel) + "】" + message);
		}
		
		/**
		 *获取HTML聊天消息 
		 * @param msgInfo
		 * @return 
		 * 
		 */
		public static function getHTMLChatMessage(msgInfo:ResChatMessage):String
		{
			var chatHtml:String="【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+HtmlTextUtil.underLine(msgInfo.name)+": "+msgInfo.chatText;
			chatHtml=HtmlTextUtil.getTextColor(getChannelColor(msgInfo.type),chatHtml);
			return chatHtml;
		}
		
		public static function getHTMLSystemMsg(msgInfo:ResChatMessage):String
		{
			var chatHtml:String="【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+msgInfo.chatText;
			chatHtml=HtmlTextUtil.getTextColor(getChannelColor(msgInfo.type),chatHtml);
			return chatHtml;
		}

		public static function getChannelColor(channelType : int) : uint
		{
			switch (channelType)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:
					return StaticValue.CHAT_SYSTEM_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
					return StaticValue.CHAT_SHI_JIE_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
					return StaticValue.CHAT_PU_TONG_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					return StaticValue.CHAT_BANG_PAI_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					return StaticValue.CHAT_DUI_WU_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					return StaticValue.CHAT_LA_BA_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					return StaticValue.CHAT_KUA_FU_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					return StaticValue.CHAT_SI_LIAO_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_NOTICE:
					return StaticValue.CHAT_NOTICE_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_HEARSAY:
					return StaticValue.CHAT_HEARSAY_COLOR;
			}
			return StaticValue.COLOR_CODE_1;
		}

		/**
		 * 根据聊天页签类型获得页签名称
		 * @param channelType
		 * @return 
		 * 
		 */
		public static function getTabsName(channelType:int):String
		{
			var info : String;
			switch (channelType)
			{
				case EnumChatTabsType.TABS_ALL:
					info = "综合";
					break;
				case EnumChatTabsType.TABS_LABA:
					info = "喇叭";
					break;
				case EnumChatTabsType.TABS_SHEHUI:
					info = "社会";
					break;
				case EnumChatTabsType.TABS_GEREN:
					info = "个人";
					break;
			}
			return info;
		}
		
		/**
		 * 根据聊天频道类型获得频道名称
		 * @param channelType
		 * @return
		 *
		 */
		public static function getChannelTitle(channelType : int) : String
		{
			var info : String;
			switch (channelType)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_SYSTEM);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_WORLD);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_NORMAL);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_PARTY);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_TEAM);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_LABA);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_NOTICE:
					info = "公告";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					info = "私聊";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					info = "跨服";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_HEARSAY:
					info = "传闻";
					break;
			}
			return info;
		}

		public static function getCheckTitle(channelType : int):String
		{
			var info : String = "接收" + getChannelTitle(channelType) + "频道信息";
			return info;
		}

		//---------------------------------------------------------------
		/**
		 * 去除头尾空白
		 * @param str
		 * @return
		 *
		 */
		public static function trim(str : String) : String
		{
			var r1 : RegExp = /^\s*/g;
			var r2 : RegExp = /\s*$/g;
			return str.replace(r1, "").replace(r2, "");
		}

		/**
		 * 搜索中不能有空格，最大14个字节
		 * @param str
		 * @param maxLen
		 * @return
		 *
		 */
		public static function deleteStringblankSpace(str : String, maxLen : int = 14, isBytes : Boolean = true) : String
		{
			var info : String = "";
			var s : String = "";
			var len : int = str.length;
			for (var i : int = 0; i < len; i++)
			{
				s = str.substring(i, i + 1);
				if (s != " ")
				{
					info += s;
					if (isBytes)
					{
						if (getTextByteLen(info) >= maxLen)
						{
							return info;
						}
					}
					else
					{
						if (info.length >= maxLen)
						{
							return info;
						}
					}
				}
			}
			return info;
		}

		/**
		 * 得到限定字符长度的字符
		 * @param _info
		 * @param maxlen
		 * @return
		 *
		 */
		public static function getStrByByteLen(_info : String, maxlen : int = 96) : String
		{
			_info = trim(_info);

			var info : String = "";
			var len : int = _info.length;
			for (var i : int = 0; i < len; i++)
			{
				info = _info.substring(0, i + 1);
				if (getTextByteLen(info) >= maxlen)
				{
					break;
				}
			}
			return info;
		}

		/**
		 * 得到字符串的字节长度
		 * @param	info
		 * @return
		 */
		public static function getTextByteLen(info : String) : int
		{
			return toByteArray(info).length;
		}

		/**
		 * 将字符串长度
		 * @param	info
		 * @return
		 */
		private static function toByteArray(info : String) : ByteArray
		{
			var bay : ByteArray = new ByteArray();
			bay.writeMultiByte(info, "utf8");
			bay.position = 0;
			return bay;
		}
		
	}
}
