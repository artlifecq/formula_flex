package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.MessageRequestJoinYourGuildSkin;
	
	public class JoinGuildIcon extends MessageIconBase
	{
		private var _skin : MessageRequestJoinYourGuildSkin;
		public function JoinGuildIcon()
		{
			_skin = new MessageRequestJoinYourGuildSkin();
			super(_skin, _skin.numTxt, _skin.btn);
		}
		
		override protected function onTouchIcon() : void
		{
			if(GuildManager.haveGuild)
				GameAlert.showAlertUtil(LangAlertInfo.JOIN_GUILD_COMPLETE,null,GuildManager.guildData.name);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
				EnumFunctionMessageBarIcoType.GUILD_JION_COMPLETE);
		}
	}
}