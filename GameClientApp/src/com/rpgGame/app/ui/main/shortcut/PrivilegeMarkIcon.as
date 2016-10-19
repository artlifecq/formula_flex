package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;

	import org.mokylin.skin.mainui.shortcut.MessagePrivilegeMarkIconSkin;

	/**
	 *
	 * 权利印记消息图标
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-21 上午10:05:12
	 *
	 */
	public class PrivilegeMarkIcon extends MessageIconBase
	{
		private var _skin : MessagePrivilegeMarkIconSkin;

		public function PrivilegeMarkIcon()
		{
			_skin = new MessagePrivilegeMarkIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}

		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.PRIVILEGE_MARK_PANEL);
		}
	}
}
