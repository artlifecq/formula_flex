package com.rpgGame.app.ui.main.chat
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.ChatGoodsManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LinkCfg;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.clientConfig.Q_hyperlinksMenu;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangChat;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.chat.bean.HyperInfo;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	import com.rpgGame.netData.player.bean.HyperlinkInfo;
	
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
			var str:String=replaceHyperShow(msgInfo);
			var chatHtml:String=str;
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
			return StaticValue.YELLOW_TEXT;
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
		
		public static function replaceHyperShow(info:ResChatMessage):String
		{
			var str:String=info.chatText;
			if(info.extraResInfo!=null&&info.extraResInfo.itemInfos!=null){
				var newCode:String;
				for(var i:int=0;i<info.extraResInfo.itemInfos.length;i++)
				{
					var cinfo:ClientItemInfo=  ItemUtil.convertClientItemInfo(info.extraResInfo.itemInfos[i].itemInfos);
					if(cinfo)
					{
						var key:String = ChatGoodsManager.addItemInfo(cinfo);
						newCode = RichTextCustomUtil.getItemCode(key,cinfo.name,cinfo.quality);
						str=str.replace(ChatManager.MSG_GOODS_CODE,newCode);
					}
				}
				
				var list:Vector.<HyperInfo>=info.extraResInfo.hyperInfos;
				for(i=0;i<list.length;i++){
					var hyperInfo:HyperInfo=list[i];
					var listD:Array=hyperInfo.params.split(",");
					var mapCfg:Q_map=MapDataManager.getMapInfo(int(listD[0])).getData();
					var mapName:String=mapCfg.q_map_name+"("+listD[1]+","+listD[2]+")";
					var linkStr:String= RichTextCustomUtil.getTextLinkCode(mapName,StaticValue.GREEN_TEXT,RichTextCustomLinkType.WALK_TO_SCENE_POS_TYPE,hyperInfo.params);
					newCode=linkStr+RichTextCustomUtil.getButtonLinkCode("org.mokylin.skin.component.button.ButtonSkin_send",RichTextCustomLinkType.FLY_TO_SCENE_POS_TYPE,hyperInfo.params);
					str=str.replace(ChatManager.MSG_POSITION_CODE,newCode);
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
		
		public static function replaceTeamShow(name:String,color:*,team:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.TEAM_APPLY,team);
			return str;
		}
		
		public static function replaceGuildShow(name:String,color:*,guild:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.GUILD_APPLY,guild);
			return str;
		}
		
		public static function replaceRallyShow(name:String,color:*,content:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.RALLY,content);
			return str;
		}
		
		public static function replaceHuBaoShow(name:String,color:*,content:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.HUBAO,content);
			return str;
		}
		
		public static function replaceShowByType(name:String,color:*,tragetName:String):String
		{
			var str:String=name;
			str = RichTextCustomUtil.getTextLinkCode(name,color,RichTextCustomLinkType.QIUHUN,tragetName);
			return str;
		}
		
		/**通过MODid得到一个物品*/
		public static function replaceItemShowByMod(id:int):String
		{
			var cinfo:ClientItemInfo=  ItemUtil.convertClientItemInfoById(id);
			var key:String = ChatGoodsManager.addItemInfo(cinfo);
			var goodsCode:String = RichTextCustomUtil.getItemCode(key,cinfo.name,cinfo.quality);
			return goodsCode;
		}
		
		public static function getPinDaoShow(typ:int):String
		{
			switch(typ)
			{
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/banghui.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_HEARSAY:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/chuanwen.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/dangqian.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_TEAM:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/duiwu.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_LABA:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/laba.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/shijie.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/siliao.png");
					break;
				}
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM:
				{
					return RichTextCustomUtil.getImageLinkCode("ui/mainui/chat/xitong.png");
					break;
				}
			}
			return "";
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
			var str:String=replaceHyperShow(msgInfo);
			if(msgInfo.extraResInfo!=null)
				var vip:int=msgInfo.extraResInfo.viplevel;
			//			var maohao:String=HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ");
			switch(msgInfo.type)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SYSTEM://系统				
					return getPinDaoShow(msgInfo.type)+" "+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_WORLD:	//世界
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.GREEN_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ")+HtmlTextUtil.getTextColor(StaticValue.OEANGE_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL://当前	
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.YELLOW_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ")+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_PARTY://帮会	
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.GREEN_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ")+HtmlTextUtil.getTextColor(StaticValue.SKYBLUE_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_TEAM://队伍		
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.GREEN_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ")+HtmlTextUtil.getTextColor(StaticValue.LIGHTBLUE_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_LABA://喇叭		
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.GREEN_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,": ")+HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU://跨服		
					return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+HtmlTextUtil.getTextColor(0xFFFFFF,(replacePlayerShow(msgInfo.name,0xFFFFFF,msgInfo.playerId.hexValue))+": ")+HtmlTextUtil.getTextColor(0xd7d7d7,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO://私聊	
				{
					if(msgInfo.playerId.ToGID()==MainRoleManager.actorID)
					{
						return getPinDaoShow(msgInfo.type)+" "+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,"你对")+getPlayerVipShow(vip)+
							(replacePlayerShow(ChatManager.currentSiLiaoTargetName,StaticValue.ROSEPOWDER_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,"说 : ")+
							HtmlTextUtil.getTextColor(StaticValue.ROSEPOWDER_TEXT,str);
					}
					else
						return getPinDaoShow(msgInfo.type)+" "+getPlayerVipShow(vip)+(replacePlayerShow(msgInfo.name,StaticValue.ROSEPOWDER_TEXT,msgInfo.playerId.hexValue))+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,"对你说 : ")+HtmlTextUtil.getTextColor(StaticValue.ROSEPOWDER_TEXT,str);
				}
					
				case EnumChatChannelType.CHAT_CHANNEL_NOTICE://公告	
					return getPinDaoShow(msgInfo.type)+" "+HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,str);
					
				case EnumChatChannelType.CHAT_CHANNEL_HEARSAY://传闻	
					return getPinDaoShow(msgInfo.type)+" "+HtmlTextUtil.getTextColor(StaticValue.WHITE_TEXT,str);
			}
			return "";
		}
		
		/**
		 * 替换超链接
		 * */
		public static function replaceStr2(str : String,islink:Boolean=false):String
		{
			var arr:Array=LinkCfg.keys;//LanguageConfig.menus;
			for(var i:int=0;i<arr.length;i++)
			{
				var cfg:Q_hyperlinksMenu=LinkCfg.getCfgByType(arr[i]);
				if(cfg){
					var name:String=cfg.q_show_title;
					if(islink){
						var linkname:String=RichTextCustomUtil.getTextLinkCode(name,StaticValue.GREEN_TEXT,RichTextCustomLinkType.SHOW_PANEL_TYPE,cfg.q_showPanelId.toString());
						str = str.replace("{"+arr[i]+"}",linkname);
					}else{
						str = str.replace("{"+arr[i]+"}",name);
					}
				}
			}
			return str;
		}
		
		/**
		 * 组装通知消息富文本
		 * */
		public static function getNoticeMessageHtml(text:String,infos:Vector.<HyperlinkInfo>,arrq:Array):String
		{
			var txt:String;
			var arr:Array;
			arr=arrq;
			if(infos==null||infos.length==0)
			{
				txt = LanguageConfig.replaceStr1(text,arr);
				txt = replaceStr2(txt,true);
			}
			else{
				for(var i:int=0;i<infos.length;i++)
				{
					var str:String=arr[infos[i].i];
					switch(infos[i].t)
					{
						case 1: //人物
							arr[infos[i].i]=replacePlayerShow(str,0xFFFFFF,infos[i].parameterInfos[0].id.hexValue);
							break;
						case 2: //物品
							arr[infos[i].i]=replaceItemShowByMod(infos[i].parameterInfos[0].mod);
							break;
						case 3: //组队
							var id:String=infos[i].parameterInfos[0].id.hexValue;
							arr[infos[i].i]=replaceTeamShow(str,0xFFFFFF,id);
							break;
						case 4: //入帮
							id=infos[i].parameterInfos[0].id.hexValue;
							arr[infos[i].i]=replaceGuildShow(str,0xFFFFFF,id);
							break;
						case 5: //集结
							var content:String=infos[i].parameterInfos[0].mod+","+infos[i].parameterInfos[0].x+","+infos[i].parameterInfos[0].y;
							arr[infos[i].i]=replaceRallyShow(str,0xBC5AF4,content);
							break;
						case 6: //护宝
							content=infos[i].parameterInfos[0].mod+","+infos[i].parameterInfos[0].x+","+infos[i].parameterInfos[0].y;
							arr[infos[i].i]=replaceHuBaoShow(str,0xBC5AF4,content);
							break;
						case 7: //洗炼
							arr[infos[i].i]=getAttById(infos[i].parameterInfos[0].mod);
							break;
						case 8: //求婚
							var jobType:int=arr[2];
							arr[2]=ItemUtil.getJobName(jobType);
							id=infos[i].parameterInfos[0].id.hexValue;
							var name:String=MainRoleManager.getPlayerName(infos[i].parameterInfos[0].name);
							arr[infos[i].i]=replaceShowByType(str,StaticValue.GREEN_TEXT,name+","+id);
							break;
					}
				}
				txt = LanguageConfig.replaceStr1(text,arr);
				txt = replaceStr2(txt,true);
			}
			return txt;
		}
		
		private static function getAttById(id:int):String
		{
			var str:String="";
			str=CharAttributeType.getWashAttDes(id);
			return str;
		}
	}
}
