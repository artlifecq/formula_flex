package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;

	import org.mokylin.skin.mainui.shortcut.MessageSocietyJoinInviteIconSkin;

	/**
	 *
	 * 入帮邀请消息图标
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-24 下午6:50:25
	 *
	 */
	public class SocietyJoinInviteIcon extends MessageIconBase
	{
		private var _skin : MessageSocietyJoinInviteIconSkin;

		public function SocietyJoinInviteIcon()
		{
			_skin = new MessageSocietyJoinInviteIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}

		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.SOCIETY_JOIN_INVITE_PANEL);
		}
	}
}
