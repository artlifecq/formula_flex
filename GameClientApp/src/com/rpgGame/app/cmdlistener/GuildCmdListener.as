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
	import com.rpgGame.netData.guild.handler.G2CNotifyGuildActiveHandler;
	import com.rpgGame.netData.guild.handler.G2CNotifyGuildMemberActiveHandler;
	import com.rpgGame.netData.guild.message.G2CNotifyGuildActiveMessage;
	import com.rpgGame.netData.guild.message.G2CNotifyGuildMemberActiveMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildApplyOperationMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildAppointMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildInviteOperationMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildKillMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildLevelUpMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildSkillLevelUpMessage;
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
			
			SocketConnection.addCmdListener(111110, onReplyGuildAppointHandler);
			SocketConnection.addCmdListener(111111,  onReplyGuildInviteOperationHandler);
			SocketConnection.addCmdListener(111112,  onReplyGuildLevelUpHandler);
			SocketConnection.addCmdListener(111113, onReplyGuildSkillLevelUpHandler);
			SocketConnection.addCmdListener(111114, onReplyGuildKillHandler);
			SocketConnection.addCmdListener(111115, onReplyGuildApplyOperationHandler);
			SocketConnection.addCmdListener(111116, onG2CNotifyGuildActiveHandler);
			SocketConnection.addCmdListener(111117, onG2CNotifyGuildMemberActiveHandler);
			
			finish();
		}
		
		private function onG2CNotifyGuildMemberActiveHandler(msg:G2CNotifyGuildMemberActiveMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onG2CNotifyGuildMemberActiveHandler(msg);
		}
		
		private function onG2CNotifyGuildActiveHandler(msg:G2CNotifyGuildActiveMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onG2CNotifyGuildActiveHandler(msg);
		}
		
		private function onReplyGuildApplyOperationHandler(msg:ReplyGuildApplyOperationMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onReplyGuildApplyOperationHandler(msg);
		}
		
		private function onReplyGuildKillHandler(msg:ReplyGuildKillMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onReplyGuildKillHandler(msg);
		}
		
		private function onReplyGuildSkillLevelUpHandler(msg:ReplyGuildSkillLevelUpMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onReplyGuildSkillLevelUpHandler(msg);
		}
		
		private function onReplyGuildLevelUpHandler(msg:ReplyGuildLevelUpMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onReplyGuildLevelUpHandler(msg);
		}
		
		private function onReplyGuildInviteOperationHandler(msg:ReplyGuildInviteOperationMessage):void
		{
			// TODO Auto Generated method stub
			GuildManager.instance().onReplyGuildInviteOperationHandler(msg);
		}
		private function onReplyGuildAppointHandler(msg:ReplyGuildAppointMessage):void
		{
			GuildManager.instance().onReplyGuildAppointHandler(msg);
		}
	
		
		private function getResGuildActiveMessage(msg:ResGuildActiveMessage):void
		{
			if(GuildManager.instance().guildData){
				GuildManager.instance().guildData.active=msg.active;
			}
			EventManager.dispatchEvent(GuildEvent.GUILD_CHANGE_ACTIVE,msg.active);
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
				if(role.headFace is HeadFace)
					(role.headFace as HeadFace).checkBloodState();
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