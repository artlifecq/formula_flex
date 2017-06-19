package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.guild.GuildManager;
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
			SocketConnection.addCmdListener(111199, getResGuildOperateResultMessage);
			finish();
		}
		
		private function getResGuildInfoMessage(msg:ResGuildInfoMessage):void
		{
			GuildManager.instance().setResGuildInfoMessage(msg);
		}
		
		private function getResGuildBriefnessInfo(msg:ResGuildBriefnessInfoMessage):void
		{
			GuildManager.instance().setResGuildBriefnessInfo(msg.guildBriefnessInfo);
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