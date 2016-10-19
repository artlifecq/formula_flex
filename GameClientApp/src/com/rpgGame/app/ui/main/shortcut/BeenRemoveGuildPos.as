package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageRequestJoinYourGuildSkin;
	
	public class BeenRemoveGuildPos extends MessageIconBase
	{
		private var _skin : MessageRequestJoinYourGuildSkin;
		public function BeenRemoveGuildPos()
		{
			_skin = new MessageRequestJoinYourGuildSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
			GameAlert.showAlertUtil(LangAlertInfo.guildBeenRemovePos);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
				EnumFunctionMessageBarIcoType.GUILD_BEEN_REMOVE_POS);
		}
	}
}