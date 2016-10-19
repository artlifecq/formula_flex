package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageRequestJoinYourGuildSkin;
	
	public class ReqJoinYourGuildIcon extends MessageIconBase
	{
		private var _skin : MessageRequestJoinYourGuildSkin;
		public function ReqJoinYourGuildIcon()
		{
			_skin = new MessageRequestJoinYourGuildSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
			AppManager.showApp(AppConstant.GUILD_REQ_JOIN_YOUR_GUILD_PANEL);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
				EnumFunctionMessageBarIcoType.REQ_JOIN_GUILD);
		}
	}
}