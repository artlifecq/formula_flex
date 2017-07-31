package com.rpgGame.app.manager.chat
{
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.shell.ShellManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextConfig;
	import com.rpgGame.app.richText.component.RichTextUnitData;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ChatSender;
	import com.rpgGame.app.sender.GmSender;
	import com.rpgGame.app.ui.main.chat.ChatUtil;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.chat.bean.HyperInfo;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
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
		
		
		public static const MSG_GOODS_CODE : String = "{goods}";
		public static const MSG_POSITION_CODE : String = "{pos}";
		
		
		private static var _chatItemHash : HashMap = new HashMap();
		
		public static var MAX_CHATSHOWITEMCACEHE : int = 300;
		
		
		
		private static var _systemHearsayMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		private static var _systemMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		private static var _hearsayMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		public  static var sysHearsayMsgChange:Function;
		
		private static var _currentShowItemInsertIndex : int = 99;
		
		//当前选择的聊天频道
		private static var _curSendChannel:int;
		
		/**
		 * 综合频道里，设置各个频道是否显示
		 */
		private static var _allChannelShowSetting : Dictionary;
		/**
		 * 社会频道里，设置各个频道是否显示
		 */
		private static var _sheJiaoChannelShowSetting : Dictionary;
		/**
		 * 个人频道里，设置各个频道是否显示
		 */
		private static var _geRenChannelShowSetting : Dictionary;
		
		private static var _freeHockUsedTimes : int = 0;
		
		
		/**
		 *传闻消息缓存 
		 */
		public static function get hearsayMsg():Vector.<ResChatMessage>
		{
			return _hearsayMsg;
		}
		
		/**
		 *系统消息缓存 
		 */
		public static function get systemMsg():Vector.<ResChatMessage>
		{
			return _systemMsg;
		}
		
		/**
		 *系统和传闻消息缓存 
		 */
		public static function get systemHearsayMsg():Vector.<ResChatMessage>
		{
			return _systemHearsayMsg;
		}
		
		/**
		 * 记录系统消息 
		 * @param msg
		 * 
		 */
		public static function recordSystemHearsayMsg(msg:ResChatMessage):void
		{
			if(_systemHearsayMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_systemHearsayMsg.shift();
			}
			_systemHearsayMsg.push(msg);
			if(msg.type==EnumChatChannelType.CHAT_CHANNEL_SYSTEM){
				recordSystemMsg(msg);
			}else if(msg.type==EnumChatChannelType.CHAT_CHANNEL_HEARSAY){
				recordHearsayMsg(msg);
			}
			
			if(sysHearsayMsgChange){
				sysHearsayMsgChange(msg);
			}
		}
		
		/**
		 * 记录传闻消息 
		 * @param msg
		 * 
		 */
		private static function recordHearsayMsg(msg:ResChatMessage):void
		{
			if(_hearsayMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_hearsayMsg.shift();
			}
			_hearsayMsg.push(msg);
		}
		
		/**
		 * 记录系统消息 
		 * @param msg
		 * 
		 */
		private static function recordSystemMsg(msg:ResChatMessage):void
		{
			if(_systemMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_systemMsg.shift();
			}
			_systemMsg.push(msg);
		}
		
		
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
			if (_sheJiaoChannelShowSetting == null)
			{
				initSheHuiChannelShowDic();
			}
			if (_sheJiaoChannelShowSetting.hasOwnProperty(channel))
			{
				return _sheJiaoChannelShowSetting[channel];
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
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_PARTY] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_WORLD] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_LABA] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SYSTEM] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_NOTICE] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_HEARSAY] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_KUA_FU] = true;
			_allChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SILIAO] = true;
		}
		private static function initSheHuiChannelShowDic() : void
		{
			_sheJiaoChannelShowSetting = new Dictionary();
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_WORLD] = true;
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_NORMAL] = true;
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_TEAM] = true;
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_PARTY] = true;
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SILIAO] = true;
			_sheJiaoChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_LABA] = true;
			
		}
		private static function initGeRenChannelShowDic() : void
		{
			_geRenChannelShowSetting = new Dictionary();
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_NORMAL] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_SILIAO] = true;
			_geRenChannelShowSetting[EnumChatChannelType.CHAT_CHANNEL_TEAM] = true;
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
				default:
					chatInfo.realShowName = countryName + senderNameStr + ":";
			}
			var realShowMsg : String = chatInfo.speech;
			
			if (chatInfo.chatGoods != null)
			{
				var itemArr : Array = [];
				var len : int = chatInfo.chatGoods.length;
				var chatGoods : ItemInfo;
				var itemCode : String;
				for (var i : int = 0; i < len; i++)
				{
					chatGoods = chatInfo.chatGoods[i];
					var itemInfo:ClientItemInfo = ItemUtil.convertClientItemInfo(chatGoods);
					var key:String = ChatGoodsManager.addItemInfo(itemInfo);
					itemCode = RichTextCustomUtil.getItemCode(key, ItemConfig.getItemName(chatGoods.itemModelId), ItemConfig.getItemQuality(chatGoods.itemModelId));
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
		private static var _positionList:Array=[];
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
		public static function reqSendChat(content : String, channel : int, targetName:String = null,hyperInfos:Vector.<HyperInfo>=null) : void
		{
			if (content == "") //空白不发送
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(22010));
				//	NoticeManager.mouseFollowNotify("无法发送空消息");
				return;
			}
			
			if (channel == EnumChatChannelType.CHAT_CHANNEL_LABA)
			{
				var itemInfo : ClientItemInfo = BackPackManager.instance.getFirstCanUseItemByCfgId(ChatCfgData.paidChatGoodsID);
				if (itemInfo == null)
				{
					//	ShopManager.ins.  //弹出后买面板
					NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(22003));
					return;
				}
			}
			
			if(channel == EnumChatChannelType.CHAT_CHANNEL_SILIAO)
			{
				content=parsingRrivateText(content);
				targetName=ChatManager.currentSiLiaoTargetName;
			}
			
			if (!checkChatLevelEnable(channel))
				return;
			if (!checkChatCDEnd(channel))
				return;
			
			var newContent : String = setShowGoodFormat(content,channel); //解析里面所有的物品
			hyperInfos=assemblyHyperInfo();
			var sendMsgStr : String = newContent;
			sendMsgStr = StringFilter.match(sendMsgStr, "*"); //发送前就把敏感字去掉
			ChatSender.cs_sendChat(sendMsgStr, channel, targetName, hyperInfos);	
		}
		
		/**
		 * 解析私聊消息
		 * */
		public static function parsingRrivateText(content : String):String
		{
			if(content==null||content=="") return "";
			var name:String;
			var cont:String;
			var starIndex:int=content.indexOf("你");
			var endIndex:int=content.indexOf(":");
			var stars:String;
			var ends:String;
			stars=content.substring(starIndex,2);
			ends=content.substring(endIndex-2,endIndex+1);
			if(stars=="你对"&&ends=="说 :")
			{
				name=content.substring(starIndex+2,endIndex-2);
				cont=content.substring(endIndex+1);
				ChatManager.currentSiLiaoTargetName=name;
			}
			else
			{
				if(ChatManager.currentSiLiaoTargetName!=null) return content;
			}
			return cont;
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
				/*if (ShellManager.parse(msg)) {
				//                    return true;
				}*/
			}
				//验证gm命令
				
				var isGm : Boolean = isGmMsg(msg);
			if (isGm)
			{
				ShellManager.parse(msg)
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
			_positionList.length=0;
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
					_showGoodsList.push(getShowItemInfo(unitData));
				}
				
			/*	if (unitData.linkType == RichTextCustomLinkType.POSITION_FLY_TYPE)
				{
					data[i] = MSG_POSITION_CODE;
					updatePositonInfo(unitData);
				}*/
				if(unitData.linkType == RichTextCustomLinkType.POSITION_TYPE)//给文本位置数据加上频道颜色
				{
					data[i]=MSG_POSITION_CODE;
//					data[i] = addColorToPositionData(unitData,channel);
					_positionList.push(unitData);
				}
				if(unitData.linkType == RichTextCustomLinkType.QIUHUN)//如果是求婚直接返回源数据
				{
					return msgStr;
				}
			}
			
			var newStr : String = "";
			for (i = 0; i < len; i++)
			{
				newStr += data[i];
			}
			return newStr;
		}
		
		/**
		 * 组装额外信息
		 * */
		private static function assemblyHyperInfo():Vector.<HyperInfo>
		{
			var hypList:Vector.<HyperInfo>=new Vector.<HyperInfo>();
			var hyp:HyperInfo;
			var index:int=0;
			for(var i:int=0;i<_showGoodsList.length;i++)
			{
				var itemInfo:ClientItemInfo=_showGoodsList[i] as ClientItemInfo;
				hyp=new HyperInfo();
				hyp.hyperType=3;//物品类型必须发3
				hyp.index=index;
				hyp.params=itemInfo.itemInfo.itemId.ToString();
				hypList.push(hyp);
				index++;
			}
			for(i=0;i<_positionList.length;i++){
				var data:RichTextUnitData=_positionList[i];
				hyp=new HyperInfo();
//				hyp.hyperType=3;
				hyp.index=index;
				hyp.params=data.linkData;
				hypList.push(hyp);
				index++;
			}
			return hypList;
		}
		
		private static function addColorToPositionData(specialMsg:RichTextUnitData, channel:int):String
		{
			var labelColor:uint = 0x55bb17;//ChatUtil.getChannelColor(channel);
			var linkStr:String= RichTextCustomUtil.getTextLinkCode(specialMsg.label,labelColor,specialMsg.linkType,specialMsg.linkData);
//			var btnStr:String=RichTextCustomUtil.getButtonLinkCode("org.mokylin.skin.component.button.ButtonSkin_send",RichTextCustomLinkType.FLY_TO_SCENE_POS_TYPE,specialMsg.linkData);
			return linkStr;
		}
		
		/**
		 * 得到要发给服务器的物品数据
		 * @param itemid
		 * @return
		 *
		 */
		public static function getShowItemInfo(specialMsg:RichTextUnitData) : ClientItemInfo
		{
			var arr:Array = specialMsg.linkData.split(",");
			var key:String = arr[0];
			var itemInfo:ClientItemInfo  = ChatGoodsManager.getItemInfo(key);
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
		
		private static var _zongheHearsayMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		private static var _shejiaoHearsayMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		private static var _gerenHearsayMsg:Vector.<ResChatMessage>=new Vector.<ResChatMessage>;
		
		public static function get zongheHearsayMsg():Vector.<ResChatMessage>
		{
			return _zongheHearsayMsg;
		}
		
		public static function get shejiaoHearsayMsg():Vector.<ResChatMessage>
		{
			return _shejiaoHearsayMsg;
		}
		
		public static function get gerenHearsayMsg():Vector.<ResChatMessage>
		{
			return _gerenHearsayMsg;
		}
		
		/**
		 * 记录综合消息 
		 * @param msg
		 * 
		 */
		private static function recordZongHeMsg(msg:ResChatMessage):void
		{
			if(_zongheHearsayMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_zongheHearsayMsg.shift();
			}
			_zongheHearsayMsg.push(msg);
		}
		
		/**
		 * 记录社交消息 
		 * @param msg
		 * 
		 */
		private static function recordSheJiaoMsg(msg:ResChatMessage):void
		{
			if(_shejiaoHearsayMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_shejiaoHearsayMsg.shift();
			}
			_shejiaoHearsayMsg.push(msg);
		}
		
		/**
		 * 记录个人消息 
		 * @param msg
		 * 
		 */
		private static function recordGeRenMsg(msg:ResChatMessage):void
		{
			if(_gerenHearsayMsg.length>=MAX_CHATSHOWITEMCACEHE){
				_gerenHearsayMsg.shift();
			}
			_gerenHearsayMsg.push(msg);
		}
		
		/**
		 * 添加一条消息显示
		 * */
		public static function onShowChatInChatBar(text : String, channel : int):void
		{
			var msg:ResChatMessage=new ResChatMessage();
			msg.type=channel;
			msg.chatText=text;
			onResChatMessage(msg);
		}
		
		/**
		 * 收到服务端信息
		 * */
		public static function onResChatMessage(msg:ResChatMessage):void
		{
			if(isShowInAll(msg.type)) recordZongHeMsg(msg);
			if(isShowInSheHui(msg.type)) recordSheJiaoMsg(msg);
			if(isShowInGeRen(msg.type)) recordGeRenMsg(msg);		
			EventManager.dispatchEvent(ChatEvent.SEND_SUCCESS,msg);
			if((msg.type==EnumChatChannelType.CHAT_CHANNEL_NORMAL||
				msg.type==EnumChatChannelType.CHAT_CHANNEL_TEAM||msg.type==EnumChatChannelType.CHAT_CHANNEL_WORLD)){
				playDialog(msg);
			}
		}	
		
		private static function playDialog(msg:ResChatMessage):void
		{
			var str:String=ChatUtil.replaceHyperShow(msg);
			if(msg.playerId.ToGID()==MainRoleManager.actorID)
				var sceneRole:SceneRole=MainRoleManager.actor;
			else sceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID())as SceneRole;
			if(sceneRole)
				sceneRole.dialogFace.addWordFrame(RenderUnitType.BODY, RenderUnitID.BODY,str, 12000);
		}
	}
}
