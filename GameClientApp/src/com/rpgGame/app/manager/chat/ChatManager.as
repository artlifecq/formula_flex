package com.rpgGame.app.manager.chat
{
    import com.rpgGame.app.manager.shell.ShellManager;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.shell.ShellManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextConfig;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.app.sender.GmSender;
	import com.rpgGame.app.ui.main.chat.ChatUtil;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.item.GetShowItemVo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	
	import flash.utils.Dictionary;
	
	import app.client_proto.ChatSetTabProtoC;
	import app.message.GoodsProto;
	import app.message.ChatContentProto.PosInfoProto;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 * 聊天数据管理
	 * @author zgd
	 *
	 */
	public class ChatManager
	{
		/** 聊天频道最大输入50汉字100字符 */
		public static const MAX_INPUT_SIZE : int = 100;
		/** 聊天频道最大输入100汉字200字符 */
		public static const WINDOW_MAX_INPUT_SIZE : int = 200;
		public static const GOOD_REGEXP : RegExp = /\[[^\]]*\]/g;
		public static const SYSTEM_GOOD_REGEXP : RegExp = /<a.*?<\/a>/ig;
		public static const GET_GOOD_INFO_REGEXP : RegExp = /[\w\dΑ-￥·*+°\/]+/g;


		private static const MSG_GOODS_CODE : String = "{goods}";
		private static const MSG_POSITION_CODE : String = "{pos}";


		private static var _chatItemHash : HashMap = new HashMap();

		private static var MAX_CHATSHOWITEMCACEHE : int = 500;
		private static var _chatShowItemVec : Vector.<GetShowItemVo> = new Vector.<GetShowItemVo>(MAX_CHATSHOWITEMCACEHE);

		private static var _currentShowItemInsertIndex : int = 99;

		/**
		 * 综合频道里，设置各个频道是否显示
		 */
		private static var _allChannelShowSetting : Dictionary;
		/**
		 * 社会频道里，设置各个频道是否显示
		 */
		private static var _sheHuiChannelShowSetting : Dictionary;
		/**
		 * 个人频道里，设置各个频道是否显示
		 */
		private static var _geRenChannelShowSetting : Dictionary;
		/**
		 * 喇叭频道里，设置各个频道是否显示
		 */
		private static var _labaChannelShowSetting : Dictionary;

		private static var _freeHockUsedTimes : int = 0;
		
		public function ChatManager()
		{
		}

		public static function addChatLaBaUse(usedTimes : int) : void
		{
			_freeHockUsedTimes++;
		}

		public static function checkChannelShowInTab(channel:int,tab:int):Boolean
		{
			switch(tab)
			{
				case EnumChatTabsType.TABS_ALL:
					return isShowInAll(channel);
				case EnumChatTabsType.TABS_SHEHUI:
					return isShowInSheHui(channel);
				case EnumChatTabsType.TABS_GEREN:
					return isShowInGeRen(channel);
				case EnumChatTabsType.TABS_LABA:
					return isShowInLaba(channel);
				case EnumChatTabsType.TABS_ZIDINGYIONE:
					return isShowInZiDingYiOne(channel);
				case EnumChatTabsType.TABS_ZIDINGYITWO:
					return isShowInZiDingYiTwo(channel);
			}
			return false;
		}
		
		/**
		 * 判断此频道信息是否在全部里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInAll(channel : int) : Boolean
		{
			if (_allChannelShowSetting == null)
			{
				initAllChannelShowDic();
			}
			if (_allChannelShowSetting.hasOwnProperty(channel))
			{
				return _allChannelShowSetting[channel];
			}
			return false;
		}

		/**
		 * 判断此频道信息是否在社会里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInSheHui(channel : int) : Boolean
		{
			if (_sheHuiChannelShowSetting == null)
			{
				initSheHuiChannelShowDic();
			}
			if (_sheHuiChannelShowSetting.hasOwnProperty(channel))
			{
				return _sheHuiChannelShowSetting[channel];
			}
			return false;
		}
		/**
		 * 判断此频道信息是否在个人里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInGeRen(channel : int) : Boolean
		{
			if (_geRenChannelShowSetting == null)
			{
				initGeRenChannelShowDic();
			}
			if (_geRenChannelShowSetting.hasOwnProperty(channel))
			{
				return _geRenChannelShowSetting[channel];
			}
			return false;
		}
		/**
		 * 判断此频道信息是否在喇叭里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInLaba(channel : int) : Boolean
		{
			if (_labaChannelShowSetting == null)
			{
				initLabaChannelShowDic();
			}
			if (_labaChannelShowSetting.hasOwnProperty(channel))
			{
				return _labaChannelShowSetting[channel];
			}
			return false;
		}
		/**
		 * 判断此频道信息是否在自定义1里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInZiDingYiOne(channel : int) : Boolean
		{
			var tabArr:Array = ClientSettingChatManager.getCustomTabList();
			if(tabArr && tabArr.length)
			{
				var tabProto:ChatSetTabProtoC = tabArr[0];
				if(tabProto.selectedChannelArr && tabProto.selectedChannelArr.indexOf(channel) >= 0)
				{
					return true;
				}
			}
			return false;
		}
		/**
		 * 判断此频道信息是否在自定义2里显示
		 * @param channel
		 * @return
		 *
		 */
		public static function isShowInZiDingYiTwo(channel : int) : Boolean
		{
			var tabArr:Array = ClientSettingChatManager.getCustomTabList();
			if(tabArr && tabArr.length > 1)
			{
				var tabProto:ChatSetTabProtoC = tabArr[1];
				if(tabProto.selectedChannelArr && tabProto.selectedChannelArr.indexOf(channel) >= 0)
				{
					return true;
				}
			}
			return false;
		}
		/**
		 * 设置频道信息是否在全部里显示
		 * @param channel
		 * @param isShow
		 *
		 */
		public static function setIsShowInAll(channel : int, isShow : Boolean) : void
		{
			if (_allChannelShowSetting == null)
			{
				initAllChannelShowDic();
			}
			_allChannelShowSetting[channel] = isShow;
		}

		private static function initAllChannelShowDic() : void
		{
			_allChannelShowSetting = new Dictionary();
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_NORMAL] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_TEAM] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_COUNTRY] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_PARTY] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_WORLD] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_LABA] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SYSTEM] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_FAMILY] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_MENG_GUO] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_KUA_FU] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SILIAO] = true;
		}
		private static function initSheHuiChannelShowDic() : void
		{
			_sheHuiChannelShowSetting = new Dictionary();
			_sheHuiChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_COUNTRY] = true;
			_sheHuiChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SYSTEM] = true;
			_sheHuiChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_WORLD] = true;
			_sheHuiChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_MENG_GUO] = true;
		}
		private static function initGeRenChannelShowDic() : void
		{
			_geRenChannelShowSetting = new Dictionary();
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_NORMAL] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SILIAO] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_TEAM] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SYSTEM] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_PARTY] = true;
		}
		private static function initLabaChannelShowDic() : void
		{
			_labaChannelShowSetting = new Dictionary();
			_labaChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_LABA] = true;
		}
		
		//发送一句错误提示
		public static function showWrongHint(wronginfo : String, isWrong : Boolean = true, replaceArr : Array = null) : void
		{
			var chatInfo : ChatInfo = new ChatInfo();
			chatInfo.channel = EnumChatChannelType.CHAT_CHANNEL_SYSTEM;
			chatInfo.speech = LanguageConfig.getText(wronginfo, replaceArr);
			EventManager.dispatchEvent(ChatEvent.GET_NEW_NORMAL_DATA, chatInfo);
			NoticeManager.mouseFollowNotify(chatInfo.speech);
		}

		//-----------------------------------------
		/**
		 * 聊天消息发送成功, 解析本地的聊天输入信息,显示在聊天框
		 * @param chatMsg
		 * @param chatType
		 * @param goodList
		 * @return
		 *
		 */
		public static function parseReceivedChatMsg(chatInfo : ChatInfo) : void
		{
			if (chatInfo == null)
				return;
			var countryName : String = "[" + CountryNameCfgData.getCountryNameById(chatInfo.countryId) + "]";
			var channelColor:uint = ChatUtil.getChannelColor(chatInfo.channel);
			var senderNameStr : String = RichTextCustomUtil.getTextLinkCode(chatInfo.name,channelColor,RichTextCustomLinkType.ROLE_NAME_TYPE,chatInfo.id.toString());
			switch(chatInfo.channel)
			{
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO:
					if(chatInfo.id == MainRoleManager.actorID)//自己给别人发的
					{
						var targetNameStr:String = RichTextCustomUtil.getTextLinkCode(chatInfo.targetName,channelColor,chatInfo.targetID.toString());
						chatInfo.realShowName = "你悄悄对" + targetNameStr + "说:";
					}
					else//别人给自己发的
					{
						chatInfo.realShowName = senderNameStr + "悄悄对你说:";
					}
					break;
				case EnumChatChannelType.CHAT_CHANNEL_FAMILY:
				case EnumChatChannelType.CHAT_CHANNEL_PARTY:
				case EnumChatChannelType.CHAT_CHANNEL_COUNTRY:
					chatInfo.realShowName = senderNameStr + ":";
					break;
				default:
					chatInfo.realShowName = countryName + senderNameStr + ":";
			}
			var realShowMsg : String = chatInfo.speech;

			if (chatInfo.chatGoods != null)
			{
				var itemArr : Array = [];
				var len : int = chatInfo.chatGoods.length;
				var chatGoods : GoodsProto;
				var itemVo : GetShowItemVo;
				var itemCode : String;
				for (var i : int = 0; i < len; i++)
				{
					chatGoods = chatInfo.chatGoods[i];
					itemVo = new GetShowItemVo();
					itemVo.decode(chatGoods);
					var itemInfo:ItemInfo = ItemUtil.convertGoodsProtoToItemInfo(chatGoods);
					var key:String = ChatGoodsManager.addItemInfo(itemInfo);
					itemCode = RichTextCustomUtil.getItemCode(key, ItemCfgData.getItemName(chatGoods.id), ItemCfgData.getItemQuality(chatGoods.id));
					itemArr.push(itemCode);
				}

				realShowMsg = replaceStr(chatInfo.speech, itemArr, MSG_GOODS_CODE);
			}

			if (chatInfo.posInfo != null)
			{
				var positionCode : String = RichTextCustomUtil.getPositionCode(chatInfo.posInfo.sceneId, chatInfo.posInfo.sceneX, chatInfo.posInfo.sceneY, chatInfo.posInfo.sceneLine, chatInfo.posInfo.sceneCountry);
				realShowMsg = replaceStr(realShowMsg, [positionCode], MSG_POSITION_CODE);
			}
			chatInfo.realShowMsg = realShowMsg;
		}

		private static function replaceStr(str : String, args : Array, replaseSye : String) : String
		{
			if (args == null)
				return str;

			if (str == null)
				return str;

			var i : int;
			var len : int = args.length;
			for (i = 0; i < len; i++)
			{
				str = str.replace(replaseSye, args[i]);
			}

			return str;
		}

		//--------------------------------------------------
		private static var _chatCoolDown : Vector.<Number> = new Vector.<Number>(20);
		private static var _chatTimeMap:HashMap = new HashMap();

		/**
		 * 判断是否可以聊天，不能发送太频繁
		 * @param	type
		 * @return
		 */
		public static function checkChatCDEnd(channel:int) : Boolean
		{
			var ctime : Number = SystemTimeManager.curtTm;
			var chatTimeVec:Vector.<Number> = _chatTimeMap.getValue(channel);
			if(chatTimeVec && chatTimeVec.length >= ChatCfgData.maxChatTimesPerCD)
			{
				var cd:int = ChatCfgData.getChatCDTime(channel);
				if (ctime - chatTimeVec[0] < cd)
				{
					NoticeManager.showHint("发送太频繁");
					return false;
				}
			}
			return true;
		}

		public static function saveCDInfo(channel:int):void
		{
			var ctime : Number = SystemTimeManager.curtTm;
			var chatTimeVec:Vector.<Number> = _chatTimeMap.getValue(channel);
			if(chatTimeVec == null)
			{
				chatTimeVec = new Vector.<Number>();
				_chatTimeMap.add(channel,chatTimeVec);
			}
			chatTimeVec.push(ctime);
			if(chatTimeVec.length > ChatCfgData.maxChatTimesPerCD)
			{
				chatTimeVec.shift();
			}
		}
		
		//---------------------消息相关
		public static var mySendChatInfo : ChatInfo = new ChatInfo();
		public static var isSnedSuccess : Boolean = false;
		/**当前私聊对象的ID*/
		public static var currentSiLiaoTargetID:Number = 0;
		/**当前私聊对象名称*/
		public static var currentSiLiaoTargetName:String;
		private static var _showGoodsList : Array = [];
		private static var _posInfoProto : PosInfoProto;

		/**
		 *
		 * @param content
		 * @param channel
		 * @param itemList
		 * @param targetChaterID
		 * @param isSendPos
		 *
		 */
		public static function reqSendChat(content : String, channel : int, targetChaterID : Number = 0, targetName:String = null) : void
		{
			if (content == "") //空白不发送
			{
				NoticeManager.mouseFollowNotify("请先输入你想说的话再发送");
				return;
			}
//			if (CrownManager.getDontTalk() && channel == EnumChatChannelType.CHAT_CHANNEL_COUNTRY)
//			{
//				NoticeManager.showNotify("禁言中");
//				return;
//			}

			if (channel == EnumChatChannelType.CHAT_CHANNEL_LABA)
			{
				var itemInfo : ItemInfo = BackPackManager.instance.getFirstCanUseItemByCfgId(ChatCfgData.paidChatGoodsID);
				if (itemInfo == null)
				{
					NoticeManager.showHint(EnumHintInfo.CHAT_CHANNEL_NO_LABA_ITEM, [ItemCfgData.getItemName(ChatCfgData.paidChatGoodsID)]);
					return;
				}
			}
			if (!checkChatLevelEnable(channel))
				return;
			if (!checkChatCDEnd(channel))
				return;

			var newContent : String = setShowGoodFormat(content,channel); //解析里面所有的物品
			var sendMsgStr : String = newContent;
			sendMsgStr = StringFilter.match(sendMsgStr, "*"); //发送前就把敏感字去掉
			ChatSender.cs_sendChat(sendMsgStr, channel, _showGoodsList, targetChaterID, _posInfoProto);

			mySendChatInfo = new ChatInfo();
			mySendChatInfo.id = MainRoleManager.actorID;
			mySendChatInfo.name = MainRoleManager.actorInfo.name;
			mySendChatInfo.targetID = targetChaterID;
			mySendChatInfo.targetName = targetName;
			mySendChatInfo.channel = channel;
			mySendChatInfo.countryId = MainRoleManager.actorInfo.countryId;
			mySendChatInfo.chatGoods = _showGoodsList;
			mySendChatInfo.posInfo = _posInfoProto
			mySendChatInfo.speech = sendMsgStr;
			//			addChatLog( content );

		}

		/**
		 * 发送GM命令
		 * @param msg
		 * @return
		 *
		 */
		public static function sendGMMsg(msg : String) : Boolean
		{
            CONFIG::Debug {
                if (ShellManager.parse(msg)) {
//                    return true;
                }
            }
			//验证gm命令
			var isGm : Boolean = isGmMsg(msg);
			if (isGm)
			{
				GmSender.sendMsg(getGmContent(msg));
				return true;
			}
			return false;
		}

		private static function isGmMsg(msg : String) : Boolean
		{
			if (msg.indexOf("&") != -1)
				return true;
			return false;
		}

		private static function getGmContent(msg : String) : String
		{
			if (isGmMsg(msg))
				return msg.substring(msg.indexOf("/") + 1, msg.length);
			return msg;
		}

		/**
		 * 解析文本中的物品
		 * 要修改
		 *
		 */
		private static function setShowGoodFormat(msgStr : String, channel : int) : String
		{
			_showGoodsList.length = 0;
			_posInfoProto = null;

			var separator : String = RichTextConfig.SEPARATOR;
			var info : String;
			var data : Array = msgStr.split(separator);
			var len : int = data.length;
			if (len <= 0)
				return msgStr;

			var unitData:RichTextUnitData;
			for (var i : int = 1; i < len; i += 2)
			{
				info = data[i];

				unitData = RichTextConfig.getUnitData(RichTextConfig.SEPARATOR + info + RichTextConfig.SEPARATOR);

				if (unitData.linkType == RichTextCustomLinkType.ITEM_SHOW_TYPE)
				{
					data[i] = MSG_GOODS_CODE;
					_showGoodsList.push(getShowItemProto(unitData));
				}

				if (unitData.linkType == RichTextCustomLinkType.POSITION_FLY_TYPE)
				{
					data[i] = MSG_POSITION_CODE;
					updatePositonInfo(unitData);
				}
				if(unitData.linkType == RichTextCustomLinkType.POSITION_TYPE)//给文本位置数据加上频道颜色
				{
					data[i] = addColorToPositionData(unitData,channel);
				}
			}

			var newStr : String = "";
			for (i = 0; i < len; i++)
			{
				newStr += data[i];
			}
			return newStr;
		}

		private static function updatePositonInfo(specialMsg:RichTextUnitData) : void
		{
			var pos : Array = specialMsg.linkData.split(",");
			_posInfoProto = new PosInfoProto();
			_posInfoProto.sceneId = pos[0];
			_posInfoProto.sceneX = pos[1];
			_posInfoProto.sceneY = pos[2];
			_posInfoProto.sceneLine = pos[3];
			_posInfoProto.sceneCountry = pos[4];
		}

		private static function addColorToPositionData(specialMsg:RichTextUnitData, channel:int):String
		{
			var labelColor:uint = ChatUtil.getChannelColor(channel);
			return RichTextCustomUtil.getTextLinkCode(specialMsg.label,labelColor,specialMsg.linkType,specialMsg.linkData);
		}
		
		/**
		 * 得到要发给服务器的物品数据
		 * @param itemid
		 * @return
		 *
		 */
		public static function getShowItemInfo(specialMsg:RichTextUnitData) : ItemInfo
		{
			var arr:Array = specialMsg.linkData.split(",");
			var key:String = arr[0];
			var itemInfo:ItemInfo  = ChatGoodsManager.getItemInfo(key);
			return itemInfo;
		}
		/**
		 * 得到要发给服务器的物品数据
		 * @param itemid
		 * @return
		 *
		 */
		private static function getShowItemProto(specialMsg:RichTextUnitData) : GoodsProto
		{
//			var itemInfo:ItemInfo  = getShowItemInfo(specialMsg);
//			return itemInfo.proto;
			return null;
		}


		/**
		 * 是否能发送
		 * @param $sendMsgStr
		 * @return
		 *
		 */
		private static function checkChatLevelEnable(channel : int) : Boolean
		{
			var minLevel:int = ChatCfgData.getChatLevel(channel);
			if (MainRoleManager.actorInfo.totalStat.level < minLevel)
			{
				NoticeManager.showHint(EnumHintInfo.CHAT_CHANNEL_LEVEL_FAIL, [minLevel]);
				return false;
			}
			return true;
		}


		//-----------------------------------------------------------

		/**
		 * 显示一条消息在指定频道
		 * @param msg
		 * @param channel
		 *
		 */
		public static function addMsgInChat(msg : String, channel : int) : void
		{
			var info : ChatInfo = new ChatInfo();
			info.realShowMsg = msg;
			info.channel = channel;

			ChatDataManager.GetInstance().putChatData(info);

			EventManager.dispatchEvent(ChatEvent.GET_NEW_NORMAL_DATA, info);
		}




		//-----------------------------------------------------------

		/**
		 * 聊天应该显示的页签
		 * @return
		 *
		 */
		public static function getChatAllTab() : ListCollection
		{
			var showType : Array = [EnumChatTabsType.TABS_ALL, EnumChatTabsType.TABS_SHEHUI, EnumChatTabsType.TABS_GEREN,EnumChatTabsType.TABS_LABA];
			var customTabArr:Array = ClientSettingChatManager.getCustomTabList();
			if(customTabArr)
			{
				var length:int = customTabArr.length;
				for(var j:int=0;j<length;j++)
				{
					if(j == 0)
					{
						showType.push(EnumChatTabsType.TABS_ZIDINGYIONE);
					}
					else
					{
						showType.push(EnumChatTabsType.TABS_ZIDINGYITWO);
					}
				}
			}
			
			var tabTitle : Array = [];
			var len : int = showType.length;
			var channelProtoC:ChatSetTabProtoC;
			for (var i : int = 0; i < len; i++)
			{
				if(showType[i] == EnumChatTabsType.TABS_ZIDINGYIONE)
				{
					channelProtoC = customTabArr[0];
					tabTitle.push(channelProtoC.name);
				}
				else if(showType[i] == EnumChatTabsType.TABS_ZIDINGYITWO)
				{
					channelProtoC = customTabArr[1];
					tabTitle.push(channelProtoC.name);
				}
				else
				{
					tabTitle.push(ChatUtil.getTabsName(showType[i]));
				}
				
			}
			var tabBarData : ListCollection = new ListCollection();
			tabBarData.data = tabTitle;
			return tabBarData;
		}


	}
}
