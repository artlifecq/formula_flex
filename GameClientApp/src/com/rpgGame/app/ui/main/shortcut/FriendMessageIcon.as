package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.sender.FriendSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.info.friend.FriendAddedMeInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageFriendIconSkin;

	/**
	 *
	 * 好友消息图标
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-12 上午10:05:12
	 *
	 */
	public class FriendMessageIcon extends MessageIconBase
	{
		private var _skin : MessageFriendIconSkin;
		private var _friendAddedMeInfo : FriendAddedMeInfo;

		public function FriendMessageIcon()
		{
			_skin = new MessageFriendIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}

		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			var list : Vector.<FriendAddedMeInfo> = FriendManager.getTargetAddedMeAsFriendVec();
			if (list && list.length > 0)
			{
				AppManager.showAppNoHide(AppConstant.TARGET_ADD_ME_TO_FRIEND);
			}
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.FRIEND_TYPE);
		}
	}
}
