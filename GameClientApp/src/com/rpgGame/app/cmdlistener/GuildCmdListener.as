package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.guild.message.ResGuildActiveMessage;
	import com.rpgGame.netData.guild.message.ResGuildApplyListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildBriefnessInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildChangeGuildIdMessage;
	import com.rpgGame.netData.guild.message.ResGuildChangeMemberTypeMessage;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildInviteListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	import com.rpgGame.netData.guild.message.ResGuildSkillInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarChangeMaxPriceMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityApplyInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityInfoMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarOperateResultMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	public class GuildCmdListener extends BaseBean
	{
		public function GuildCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(111101, getResGuildInfoMessage);
			SocketConnection.addCmdListener(111102, getResGuildBriefnessInfo);
			SocketConnection.addCmdListener(111103, getResGuildListInfo);
			SocketConnection.addCmdListener(111104, getResGuildInviteListInfo);
			SocketConnection.addCmdListener(111105, getResGuildApplyListInfo);
			SocketConnection.addCmdListener(111106, getResGuildChangeGuildId);
			SocketConnection.addCmdListener(111107, getResGuildChangeMemberType);
			SocketConnection.addCmdListener(111108, getResGuildSkillInfo);
			SocketConnection.addCmdListener(111109, getResGuildActiveMessage);
			SocketConnection.addCmdListener(111199, getResGuildOperateResultMessage);
			
			SocketConnection.addCmdListener(253101, getResGuildWarCityInfoMessage);
			SocketConnection.addCmdListener(253102, getResGuildWarCityApplyInfoMessage);
			SocketConnection.addCmdListener(253104, getResGuildWarChangeMaxPriceMessage);
			SocketConnection.addCmdListener(253199, getResGuildWarOperateResultMessage);
			
			
			finish();
		}
		
		private function getResGuildActiveMessage(msg:ResGuildActiveMessage):void
		{
			if(GuildManager.instance().guildData){
				GuildManager.instance().guildData.active=msg.active;
			}
			EventManager.dispatchEvent(GuildEvent.GUILD_CHANGE_ACTIVE,msg.active);
		}
		
		private function getResGuildWarOperateResultMessage(msg:ResGuildWarOperateResultMessage):void
		{
			
		}
		
		private function getResGuildWarChangeMaxPriceMessage(msg:ResGuildWarChangeMaxPriceMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_CHANGEMAXPRICE,msg);
		}
		
		private function getResGuildWarCityApplyInfoMessage(msg:ResGuildWarCityApplyInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_APPLYINFO,msg);
		}
		
		private function getResGuildWarCityInfoMessage(msg:ResGuildWarCityInfoMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_WCZB_INFO,msg);
		}
		
		private function getResGuildInfoMessage(msg:ResGuildInfoMessage):void
		{
			GuildManager.instance().setResGuildInfoMessage(msg);
		}
		
		private function getResGuildBriefnessInfo(msg:ResGuildBriefnessInfoMessage):void
		{
			AppManager.showAppNoHide(AppConstant.GUILD_BRIEFNESSINFO_PANEL,msg.guildBriefnessInfo);
		}
		
		private function getResGuildListInfo(msg:ResGuildListInfoMessage):void
		{
			GuildManager.instance().setGuildListInfoMessage(msg);
		}
		private function getResGuildInviteListInfo(msg:ResGuildInviteListInfoMessage):void
		{
			GuildManager.instance().setGuildInviteListInfo(msg.inviteList);
		}
		private function getResGuildApplyListInfo(msg:ResGuildApplyListInfoMessage):void
		{
			GuildManager.instance().setGuildApplyListInfo(msg.applyList);
		}
		
		private function getResGuildChangeGuildId(msg:ResGuildChangeGuildIdMessage):void
		{
			GuildManager.instance().changeGuildId(msg);
			var role:SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if(role && role.usable)
			{
				var herodata:HeroData = role.data as HeroData;
				herodata.guildId = msg.guildId;
				herodata.guildMemberType = msg.guildMemberType;
				herodata.guildName = msg.guildName;
				if(role.headFace is HeadFace)
					(role.headFace as HeadFace).addAndUpdateGuildName();
			}
		}
		private function getResGuildChangeMemberType(msg:ResGuildChangeMemberTypeMessage):void
		{
			
		}
		private function getResGuildOperateResultMessage(msg:ResGuildOperateResultMessage):void
		{
			GuildManager.instance().getGuildOperateResult(msg);
		}
		
		private function getResGuildSkillInfo(msg:ResGuildSkillInfoMessage):void
		{
			GuildManager.instance().setGuildSkill(msg.personSkillList,msg.leaderSkillList);
		}
		
	}
}