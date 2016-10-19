package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 快捷消息栏
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-12 上午10:05:12
	 *
	 */
	public class ShortcutMessageBar extends SkinUI
	{
		/** 消息通知栏，图片类型 dic **/
		private var _btnRet : Dictionary;
		private var _showingArr : Array;

		public function ShortcutMessageBar()
		{
			super();
			init();
			addEvent();
		}

		private function init() : void
		{
			_showingArr = [];
			_btnRet = new Dictionary();
			_btnRet[EnumFunctionMessageBarIcoType.FRIEND_TYPE] = new FriendMessageIcon(); // 好友 1 
			_btnRet[EnumFunctionMessageBarIcoType.MAIL_TYPE] = new MailMessageIcon(); // mail 6
			_btnRet[EnumFunctionMessageBarIcoType.PRIVILEGE_MARK_TYPE] = new PrivilegeMarkIcon(); // 权利印记 
			_btnRet[EnumFunctionMessageBarIcoType.JIN_WEI_APPLICANT_TYPE] = new JinWeiApplicantIcon(); // 禁卫军申请
			_btnRet[EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE] = new SocietyJoinInviteIcon(); // 入帮邀请 
			_btnRet[EnumFunctionMessageBarIcoType.TEAM_INVITE_WAITE_TYPE] = new TeamInviteWaiteIcon(); // 组队邀请 
			_btnRet[EnumFunctionMessageBarIcoType.TEAM_APPLY_JOIN_TYPE] = new TeamApplyJoinWaiteIcon(); // 入队申请 
			_btnRet[EnumFunctionMessageBarIcoType.TRADE_TYPE] = new TradeBeenInviteIcon();
			_btnRet[EnumFunctionMessageBarIcoType.CHAT_TYPE] = new ChatMsgIcon();//私聊
			_btnRet[EnumFunctionMessageBarIcoType.RELIVE_TYPE] = new ReliveIcon();//复活
			_btnRet[EnumFunctionMessageBarIcoType.INVITE_JOIN_GUILD] = new InviteYouJoinGuild();//邀请我加入帮派
			_btnRet[EnumFunctionMessageBarIcoType.REQ_JOIN_GUILD] = new ReqJoinYourGuildIcon();//申请加入我的帮派
			_btnRet[EnumFunctionMessageBarIcoType.GUILD_BEEN_SET_POS] = new BeenSetGuildPos();//帮派 被设置成副帮主了
			_btnRet[EnumFunctionMessageBarIcoType.GUILD_BEEN_REMOVE_POS] = new BeenRemoveGuildPos();//帮派 被卸任副帮主了
			_btnRet[EnumFunctionMessageBarIcoType.GUILD_BEEN_KICK_GUILD] = new BeenKickGuildIcon();//帮派 被提出了帮派
			_btnRet[EnumFunctionMessageBarIcoType.GUILD_JION_COMPLETE] = new JoinGuildIcon();//帮派 被提出了帮派
			_btnRet[EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE] = new MessageMountBreadInviteWaiteIcon();//坐骑繁育邀请

			StarlingLayerManager.hintUILayer.addChild(this);
//			onShowIcon(EnumFunctionMessageBarIcoType.FRIEND_TYPE, 1);
//			onShowIcon(EnumFunctionMessageBarIcoType.MAIL_TYPE, 0);
		}
		private static var ins : ShortcutMessageBar;
		/**这个条变成单例**/
		public static function get instence():ShortcutMessageBar
		{
			if(!ins)ins = new ShortcutMessageBar();
			return ins;
		}
		
		public function resize(sw:int,sh:int):void
		{
			this.x = sw * 0.5 + 100;
			this.y = sh - 200;
		}

		private function addEvent() : void
		{
			EventManager.addEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, onShowIcon);
			EventManager.addEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, onHideIcon);
		}
		

		/**
		 * 显示消息icon
		 * @param showType  类型
		 * @param showNumber 消息条数
		 *
		 */
		private function onShowIcon(showType : int, showNumber : int = 0) : void
		{
			showBtnByType(showType, showNumber);
		}

		/**
		 * 移除消息icon
		 * @param showType 类型
		 *
		 */
		private function onHideIcon(showType : int) : void
		{
			hideBtnByType(showType, 0);
		}

		/**
		 * 显示某个按扭
		 * @param type 类型
		 * @param num 消息条数
		 *
		 */
		private function showBtnByType(type : int, num : int = 0) : void
		{
			var itemBtn : MessageIconBase = _btnRet[type];
			if (itemBtn)
			{
				addChild(itemBtn);
				itemBtn.show();
				itemBtn.setOtherTxt( type, itemBtn );
				switch( type )//邮件、私聊、组队邀请、入队申请不需要显示条数（策划需求的）
				{
					case EnumFunctionMessageBarIcoType.CHAT_TYPE:
						itemBtn.setNum(-1);
						itemBtn.showOrHideRedPoint(ChatWindowManager.checkHasMessageWait());
						break;
					case EnumFunctionMessageBarIcoType.TEAM_INVITE_WAITE_TYPE:
					case EnumFunctionMessageBarIcoType.TEAM_APPLY_JOIN_TYPE:
					case EnumFunctionMessageBarIcoType.MAIL_TYPE:
						itemBtn.setNum(-1);
						break;
					default:
						itemBtn.setNum(num);
						break;
				}
				if (_showingArr.indexOf(itemBtn) == -1)
				{
					_showingArr.push(itemBtn);
				}
				reLayout();
			}
		}

		/**
		 * 刷新按钮坐标布局
		 *
		 */
		public function reLayout() : void
		{
			var len : int = _showingArr.length;
			for (var i : int = 0; i < len; i++)
			{
				var itemBtn : MessageIconBase = _showingArr[i];
				var toX : int = i * 45;
				itemBtn.x = toX;
				itemBtn.y = 0;
			}
		}

		/**
		 * 移除某个按扭
		 * @param type 类型
		 * @param num 消息条数
		 *
		 */
		private function hideBtnByType(type : int, num : int = 0) : void
		{
			var itemBtn : MessageIconBase = _btnRet[type];
			if (itemBtn)
			{
				if (itemBtn.parent)
					itemBtn.parent.removeChild(itemBtn);
				itemBtn.hide();
				itemBtn.setNum(num);
				itemBtn.removeOtherTxt( type, itemBtn );
				var iconIndex : int = _showingArr.indexOf(itemBtn);
				if (iconIndex != -1)
				{
					_showingArr.splice(iconIndex, 1);
				}
				reLayout();
			}
		}

		public function get barWidth() : int
		{
			return 200;
		}

		public function get barHeight() : int
		{
			return 40;
		}
	}
}
