package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.netData.guild.message.ResGuildApplyListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildBriefnessInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
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
			SocketConnection.addCmdListener(111105, getResGuildApplyListInfo);
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
		
		private function getResGuildApplyListInfo(msg:ResGuildApplyListInfoMessage):void
		{
			GuildManager.instance().setGuildApplyListInfo(msg.applyList);
		}
		private function getResGuildOperateResultMessage(msg:ResGuildOperateResultMessage):void
		{
			GuildManager.instance().getGuildOperateResult(msg);
		}
		
	}
}