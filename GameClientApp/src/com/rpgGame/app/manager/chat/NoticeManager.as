package com.rpgGame.app.manager.chat
{
	import com.rpgGame.app.manager.hint.TopTipManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.HintEvent;
	import com.rpgGame.coreData.rEnum;
	import com.rpgGame.coreData.cfg.HintConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.HintInfo;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *提示消息管理器
	 * @author carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class NoticeManager
	{
		/** 1系统公告(滚动) */
		public static const SYSTEM_ROLL : int = 1;
		/** 2个人重要提示 快捷栏上方一点切出文字提示  */
		public static const CENTER_BOTTOM : int = 2;
		/** 3右下方 战斗区域提示，如经验增加 **/
		public static const BATTLE_HINT : int = 3;
		/** 4中央大字 (切出) */
		public static const SYSTEM_SWITCH : int = 4;
		/** 5聊天框 它还有子类型，哪个频道的 */
		public static const CHAT_SYSTEM : int = 5;
		/** 6跟随鼠标的提示 */
		public static const MOUSE_FOLLOW_TIP : int = 6;
		/** 7屏幕中间的 */
		public static const WINDOW_CENTER : int = 7;
		/** 8服务器提示，暂无不做  */
		public static const SERVER : int = 8;
		/** 9弹窗提示 这个类型暂时不用了，都走langAlertInfo  */
		public static const ALERT : int = 9;
		/** 10聊天框 子类型,综合全部频道 */
		public static const CHAT_CHANNEL_ALL : int = 10;
		/** 11聊天框 子类型,世界频道 */
		public static const CHAT_CHANNEL_WORLD : int = 11;
		/** 12聊天框 子类型,国家频道 */
		public static const CHAT_CHANNEL_ALLY : int = 12;
		/** 13聊天框 子类型,普通频道\场景 */
		public static const CHAT_CHANNEL_NORMAL : int = 13;
		/** 14聊天框 子类型,帮会 */
		public static const CHAT_CHANNEL_PARTY : int = 14;
		/** 15聊天框 子类型,队伍 */
		public static const CHAT_CHANNEL_TEAM : int = 15;
		/** 16聊天框 子类型,喇叭频道 */
		public static const CHAT_CHANNEL_LABA : int = 16;
		/** 17聊天框 子类型,家族频道 */
		public static const CHAT_CHANNEL_FAMILY : int = 17;
		/** 18聊天框 子类型,窗口私聊 */
		public static const CHAT_CHANNEL_WINDOW : int = 18;
		/** 19聊天框 子类型,系统频道 */
		public static const CHAT_CHANAEL_SYSTEM : int = 19;

		/**红 错误**/
		public static const ERROR_RED : uint = rEnum.ENUM_START();
		/**黄 警告**/
		public static const ERROR_YELLOW : uint = rEnum.next;
		/**绿 普通**/
		public static const ERROR_GREEN : uint = rEnum.next;
		/**白 普通**/
		public static const ERROR_WHITE : uint = rEnum.next;

		public static function initChatInfo() : void
		{
			var msgStr : String = "\n抵制不良游戏,拒绝盗版游戏,\n注意自我保护,谨防受骗上当,\n适度游戏益脑,沉迷游戏伤身,\n合理安排时间,享受健康生活。"
			chatSystemNotify(msgStr);
		}

		/**
		 * 显示要提示信息
		 * @param hintKey		配置KEY
		 * @param textArgs		参数
		 *
		 */
		public static function showHint(hintKey : String, textArgs : Array = null) : void
		{
			var hintInfo : HintInfo = HintConfig.getHintInfo(hintKey);
			if (hintInfo == null)
			{
				TopTipManager.getInstance().addMouseFollowTip(MOUSE_FOLLOW_TIP, hintKey + ":没有配置");
				return;
			}

			var msg : String;
			switch (hintInfo.error)
			{
				case ERROR_RED:
					msg = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_13, hintInfo.info);
					break;
				case ERROR_YELLOW:
					msg = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_4, hintInfo.info);
					break;
				case ERROR_GREEN:
					msg = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_16, hintInfo.info);
					break;
				case ERROR_WHITE:
					msg = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_1, hintInfo.info);
					break;
				default:
					msg = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_1, hintInfo.info);
					break;
			}

			notify(hintInfo.type, msg, textArgs);
		}

		/**
		 * 显示一个提示，强烈推荐统一用这个方法！！！
		 * @param langType
		 * @param textArgs
		 * @author L.L.M.Sunny
		 *
		 */
		public static function showNotify(langType : String, ... textArgs) : void
		{
			var language : Object = LanguageConfig.getLanguage(langType, textArgs);
			var msg : String = language.value;
			trace(msg);
			
			if(msg.indexOf("未知原因0") != -1)
			{
				trace(1);
			}
				
			var type : String = language.type;
			var showTimes : int = language.showTimes;
			if (type == "" || type == null)
			{
				notify(int(type), msg, textArgs, showTimes);
			}
			else
			{
				var typeArr : Array = type.split(";");
				if (typeArr != null)
				{
					for (var i : int = 0; i < typeArr.length; i++)
					{
						if(int(type) == ALERT)
						{
							GameAlert.showAlertUtil(langType,null,textArgs);
						}else
						{
							notify(typeArr[i], msg, textArgs, showTimes);
						}
					}
				}
			}
		}

		/**
		 * 快捷的 鼠标跟踪提示
		 * @param $msg
		 * @param textArgs
		 *
		 */
		public static function mouseFollowNotify($msg : String, textArgs : Array = null) : void
		{
			notify(MOUSE_FOLLOW_TIP, $msg, textArgs);
		}

		public static function systemSwitchNotify($msg : String, textArgs : Array = null) : void
		{
			notify(SYSTEM_SWITCH, $msg, textArgs);
		}

		public static function chatSystemNotify($msg : String, textArgs : Array = null) : void
		{
			notify(CHAT_SYSTEM, $msg, textArgs);
		}

		/**
		 * 测试用的，别拿去用。
		 * @param type
		 * @param msg
		 *
		 */
		public static function textNotify(type : int, msg : String) : void
		{
			notify(type, msg);
		}

		/**
		 * 提示消息
		 * @param $type			类型
		 * @param $msg			揭示内内容要加上参数才是完整
		 * @param textArgs		参数
		 * @param channel		频道，只有聊天才须要频道		ChatChannelType
		 *
		 */
		private static function notify($type : int, $msg : String, textArgs : Array = null, showTimes : int = 0) : void
		{
			if ($msg == null || $msg == "")
				return;

			if (textArgs != null)
			{
				$msg = LanguageConfig.replaceStr($msg, textArgs);
			}

			if (showTimes <= 0)
			{
				showTimes = 1;
			}

			for (var i : int = 0; i < showTimes; i++)
			{
				switch ($type)
				{
					case SYSTEM_ROLL: //公告要同时在聊天面板显示
					case CENTER_BOTTOM:
					case SYSTEM_SWITCH:
					case WINDOW_CENTER:
						TopTipManager.getInstance().addHintByType($type, $msg);
						break;
					case BATTLE_HINT:
						EventManager.dispatchEvent(HintEvent.BATTLE_HINT, $msg);
						break;
					case CHAT_SYSTEM:
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_SYSTEM);
						break;
					case MOUSE_FOLLOW_TIP:
						TopTipManager.getInstance().addMouseFollowTip($type, $msg);
						break;
					case SERVER:
						//服务器
						break;
//				case SYSTEM_SWITCH_CENTER:
//					TopTipManager.getInstance().addSystemSwitchCenterTip( $msg );
//					break;
//				case CENTER:
//					TopTipManager.getInstance().addCenterTip( $msg );
//					break;
//				case SYSTEM_TOP:
//					TopTipManager.getInstance().addTopTip( $msg );
//					break;
//				case ALERT:
//					GameAlert.show($msg);
//					break;
					case CHAT_CHANNEL_ALL: //10聊天框 子类型,综合全部频道
						ChatManager.addMsgInChat($msg, EnumChatTabsType.TABS_ALL);
						break;
					case CHAT_CHANNEL_WORLD: //11聊天框 子类型,世界频道
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_WORLD);
						break;
					case CHAT_CHANNEL_ALLY: //12聊天框 子类型,国家频道
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_COUNTRY);
						break;
					case CHAT_CHANNEL_NORMAL: //13聊天框 子类型,普通频道\场景
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_NORMAL);
						break;
					case CHAT_CHANNEL_PARTY: //14聊天框 子类型,帮会
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_PARTY);
						break;
					case CHAT_CHANNEL_TEAM: //15聊天框 子类型,队伍
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_TEAM);
						break;
					case CHAT_CHANNEL_LABA: //16聊天框 子类型,喇叭频道
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_LABA);
						break;
					case CHAT_CHANNEL_FAMILY: //17聊天框 子类型,家族频道
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_FAMILY);
						break;
					case CHAT_CHANNEL_WINDOW: //18聊天框 子类型,窗口私聊
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_WINDOW);
						break;
					case CHAT_CHANAEL_SYSTEM: //19聊天框 子类型,系统频道
						ChatManager.addMsgInChat($msg, EnumChatChannelType.CHAT_CHANNEL_SYSTEM);
						break;
					default:
						TopTipManager.getInstance().addHintByType($type, $msg);
				}
			}
		}
	}
}
