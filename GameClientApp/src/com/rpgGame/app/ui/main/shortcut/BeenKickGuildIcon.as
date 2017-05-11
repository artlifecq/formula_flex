package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageRequestJoinYourGuildSkin;
	
	public class BeenKickGuildIcon extends MessageIconBase
	{
		private var _skin : MessageRequestJoinYourGuildSkin;
		public function BeenKickGuildIcon()
		{
			_skin = new MessageRequestJoinYourGuildSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
//			GameAlert.showAlertUtil(LangAlertInfo.BEEN_KICK_GUILD,null,GuildManager.beenKickGuildName);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
				EnumFunctionMessageBarIcoType.GUILD_BEEN_KICK_GUILD);
		}
	}
}