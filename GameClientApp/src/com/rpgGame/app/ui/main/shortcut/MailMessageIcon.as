package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import org.mokylin.skin.mainui.shortcut.MessageMailIconSkin;

	/**
	 *
	 * 邮件消息图标
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-12 上午10:05:12
	 *
	 */
	public class MailMessageIcon extends MessageIconBase
	{
		private var _skin : MessageMailIconSkin;

		public function MailMessageIcon()
		{
			_skin = new MessageMailIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}

		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.MAIL_PANEL);
		}
	}
}
