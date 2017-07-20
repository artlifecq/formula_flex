package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.manager.chat.ChatGoodsManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
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
		public static function getChatMessageByChannel(channel : int,name:String,message:String) : String
		{
			var chanelImageName:String = "pu_tong";
			switch(channel)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:
					chanelImageName = "xi_tong";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
					chanelImageName = "shi_jie";
					break;
				/*case EnumChatChannelType.CHAT_CHANNEL_COUNTRY:
				chanelImageName = "guo_jia";
				break;*/
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
					chanelImageName = "pu_tong";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					chanelImageName = "bang_pai";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					chanelImageName = "dui_wu";
					break;
				/*	case EnumChatChannelType.CHAT_CHANNEL_FAMILY:
				chanelImageName = "jia_zhu";
				break;*/
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					chanelImageName = "la_ba";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					chanelImageName = "kua_fu";
					break;
				/*	case EnumChatChannelType.CHAT_CHANNEL_MENG_GUO:
				chanelImageName = "meng_guo";
				break;*/
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					chanelImageName = "si_liao";
					break;
			}
			var channelImageUrl:String = "ui/mainui/chat/chanel/" + chanelImageName + ".png";
			var channelImageCode:String = RichTextCustomUtil.getImageLinkCode(channelImageUrl,null,null,2);
			//			return HtmlTextUtil.getTextColor(getChannelColor(channel), "【" + ChatUtil.getChannelTitle(channel) + "】" + message);
			return HtmlTextUtil.getTextColor(0xf7ff15,"【" + ChatUtil.getChannelTitle(channel) + "】"+HtmlTextUtil.underLine(name)+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,message);
			//			return channelImageCode + HtmlTextUtil.getTextColor(getChannelColor(channel), message);
		}
		
		public static function getHTMLSystemMsg(msgInfo:ResChatMessage):String
		{
			var str:String=replaceItemShow(msgInfo);
			var chatHtml:String="【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+str;
			chatHtml=HtmlTextUtil.getTextColor(getChannelColor(msgInfo.type),chatHtml);
			return chatHtml;
		}
		
		public static function getChannelColor(channelType : int) : uint
		{
			switch (channelType)
			{
				/*case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:
				return StaticValue.CHAT_XI_TONG_COLOR;*/
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
					return StaticValue.CHAT_SHI_JIE_COLOR;
					/*case EnumChatChannelType.CHAT_CHANNEL_COUNTRY:
					return StaticValue.CHAT_GUO_JIA_COLOR;*/
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
					return StaticValue.CHAT_PU_TONG_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					return StaticValue.CHAT_BANG_PAI_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					return StaticValue.CHAT_DUI_WU_COLOR;
					/*	case EnumChatChannelType.CHAT_CHANNEL_FAMILY:
					return StaticValue.CHAT_JIA_ZU_COLOR;*/
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					return StaticValue.CHAT_LA_BA_COLOR;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					return StaticValue.CHAT_KUA_FU_COLOR;
					/*case EnumChatChannelType.CHAT_CHANNEL_MENG_GUO:
					return StaticValue.CHAT_MENG_GUO_COLOR;*/
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					return StaticValue.CHAT_SI_LIAO_COLOR;
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
					info = "当前";//LanguageConfig.getText(LangChat.CHAT_CHANNEL_NORMAL);
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
				/*	case EnumChatChannelType.CHAT_CHANNEL_FAMILY:
				info = "家族";
				break;*/
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					info = "私聊";
					break;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					info = "跨服";
					break;
				/*	case EnumChatChannelType.CHAT_CHANNEL_MENG_GUO:
				info = "盟国";
				break;
				case EnumChatChannelType.CHAT_CHANNEL_WINDOW:
				info = LanguageConfig.getText(LangChat.CHAT_CHANNEL_WINDOW);
				break;*/
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
		
		public static function replaceItemShow(info:ResChatMessage):String
		{
			var str:String=info.chatText;
			if(info.extraResInfo.itemInfos!=null){
				for(var i:int=0;i<info.extraResInfo.itemInfos.length;i++)
				{
					var cinfo:ClientItemInfo=  ItemUtil.convertClientItemInfo(info.extraResInfo.itemInfos[i].itemInfos);
					if(cinfo)
					{
						var key:String = ChatGoodsManager.addItemInfo(cinfo);
						var goodsCode:String = RichTextCustomUtil.getItemCode(key,cinfo.name,cinfo.quality);
						str=str.replace(ChatManager.MSG_GOODS_CODE,goodsCode);
					}
				}
				str=str.replace(ChatManager.MSG_GOODS_CODE,"道具数据异常: 包含的道具_"+info.extraResInfo.itemInfos.length);
			}
			str=str.replace(ChatManager.MSG_GOODS_CODE,"后台数据异常");
			return str;
		}
		
		public static function replacePlayerShow(name:String,color:*,uiseId:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.ROLE_NAME_TYPE,uiseId);
			return str;
		}
		public static function getPlayerVipShow(vipLv:int):String
		{
			if (vipLv>0) 
			{
				return RichTextCustomUtil.getImageLinkCode("ui/common/tubiao/vips"+vipLv+".png");
			}
			return "";
		}
		/**
		 *获取HTML聊天消息 
		 * @param msgInfo
		 * @return 
		 * 
		 */
		public static function getHTMLChatMessage(msgInfo:ResChatMessage):String
		{
			var str:String=replaceItemShow(msgInfo);
			var vip:int=msgInfo.extraResInfo.viplevel;
			switch(msgInfo.type)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:				
					return HtmlTextUtil.getTextColor(0xFFFFFF,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xFFFFFF,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:				
					return HtmlTextUtil.getTextColor(0xdfb612,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
					return HtmlTextUtil.getTextColor(0xcdcb9d,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
					return HtmlTextUtil.getTextColor(0x18b2cf,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
					return HtmlTextUtil.getTextColor(0x2dcfab,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
					return HtmlTextUtil.getTextColor(0xf7ff15,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU:
					return HtmlTextUtil.getTextColor(0xFFFFFF,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
				{
					if(msgInfo.playerId.ToGID()==MainRoleManager.actorID)
					{
						return HtmlTextUtil.getTextColor(0xe58bff,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】")+HtmlTextUtil.getTextColor(0xFFFFFF,"你对")+getPlayerVipShow(vip)+HtmlTextUtil.getTextColor(0xe58bff,(replacePlayerShow(ChatManager.currentSiLiaoTargetName,0xFFFFFF,msgInfo.playerId.hexValue)))+HtmlTextUtil.getTextColor(0xFFFFFF,"说 : ")+HtmlTextUtil.getTextColor(0xe58bff,str);
					}
					else
						return HtmlTextUtil.getTextColor(0xe58bff,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue)))+HtmlTextUtil.getTextColor(0xFFFFFF,"对你说 : ")+HtmlTextUtil.getTextColor(0xe58bff,str);
				}
					
				case EnumChatChannelType.CHAT_CHANNEL_NOTICE:
					return HtmlTextUtil.getTextColor(0xFFFFFF,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_HEARSAY:
					return HtmlTextUtil.getTextColor(0xFFFFFF,"【" + ChatUtil.getChannelTitle(msgInfo.type) + "】"+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
			}
			return "";
		}
		
	}
}
