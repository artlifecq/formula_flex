package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import org.mokylin.skin.mainui.shortcut.MessageInviteYouJoinGuildSkin;
	
	public class InviteYouJoinGuild extends MessageIconBase
	{
		private var _skin : MessageInviteYouJoinGuildSkin;
		public function InviteYouJoinGuild()
		{
			_skin = new MessageInviteYouJoinGuildSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
//			AppManager.showApp(AppConstant.
		}
	}
}