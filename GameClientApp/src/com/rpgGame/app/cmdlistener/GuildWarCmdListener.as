package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.cmdlistener.enum.OpaqueEnum;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCampOreMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCampScoreMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarChangeMaxPriceMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityApplyInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityBriefnessInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarLeaderSkillUseMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarOperateResultMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarOreInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarOrePositionMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarPersionInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarPersonRankMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarResultMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *帮派战消息处理
	 *@author dik
	 *2017-7-4
	 **/
	public class GuildWarCmdListener extends BaseBean
	{
		public function GuildWarCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(253101, getResGuildWarCityInfoMessage);
			SocketConnection.addCmdListener(253102, getResGuildWarCityApplyInfoMessage);
			SocketConnection.addCmdListener(253104, getResGuildWarChangeMaxPriceMessage);
			SocketConnection.addCmdListener(253199, getResGuildWarOperateResultMessage);
			SocketConnection.addCmdListener(253105, getResGuildWarOreInfoMessage);
			SocketConnection.addCmdListener(253106, getResGuildWarCampScoreMessage);
			SocketConnection.addCmdListener(253107, getResGuildWarCampOreMessage);
			SocketConnection.addCmdListener(253108, getResGuildWarPersonRankMessage);
			SocketConnection.addCmdListener(253109, getResGuildWarPersionInfoMessage);
			SocketConnection.addCmdListener(253110, getResGuildWarCityBriefnessInfoMessage);
			SocketConnection.addCmdListener(253111, getResGuildWarOrePositionMessage);
			SocketConnection.addCmdListener(253112, getResGuildWarResultMessage);
			SocketConnection.addCmdListener(253113, getResGuildWarLeaderSkillUseMessage);
			
			finish();
		}
		
		private function getResGuildWarLeaderSkillUseMessage(msg:ResGuildWarLeaderSkillUseMessage):void
		{
			AppManager.showAppNoHide(AppConstant.GUILD_LEADER_SKILL_NOTICE,msg);
		}
		
		private function getResGuildWarResultMessage(msg:ResGuildWarResultMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_OVER,msg);
		}
		
		private function getResGuildWarCityBriefnessInfoMessage(msg:ResGuildWarCityBriefnessInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_FIGHTCITY,msg);
		}
		
		private function getResGuildWarOrePositionMessage(msg:ResGuildWarOrePositionMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WAR_FINDORE,msg);
		}
		
		private function getResGuildWarCampScoreMessage(msg:ResGuildWarCampScoreMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WAR_CAMPSCORE,msg);
		}
		
		private function getResGuildWarPersionInfoMessage(msg:ResGuildWarPersionInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WAR_PERSIONINFO,msg);
		}
		
		private function getResGuildWarPersonRankMessage(msg:ResGuildWarPersonRankMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WAR_PERSONRANK,msg);
		}
		
		private function getResGuildWarCampOreMessage(msg:ResGuildWarCampOreMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WAR_CAMPORE,msg);
		}
		
		private function getResGuildWarOreInfoMessage(msg:ResGuildWarOreInfoMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if(role){
				(role.headFace as HeadFace).updateGuildWarInfoBar(msg.oreList);
			}
		}
		
		private function getResGuildWarOperateResultMessage(msg:ResGuildWarOperateResultMessage):void
		{
			switch(msg.opaque){
				case OpaqueEnum.GUILDWAR_GIFT:
					GuildWarSender.reqGuildWarCityInfo();//领取帮会战奖励成功之后
					break;
			}
		}
		
		private function getResGuildWarCityInfoMessage(msg:ResGuildWarCityInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_INFO,msg);
		}
		
		private function getResGuildWarCityApplyInfoMessage(msg:ResGuildWarCityApplyInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_APPLYINFO,msg);
		}
		
		private function getResGuildWarChangeMaxPriceMessage(msg:ResGuildWarChangeMaxPriceMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_CHANGEMAXPRICE,msg);
		}
	}
}