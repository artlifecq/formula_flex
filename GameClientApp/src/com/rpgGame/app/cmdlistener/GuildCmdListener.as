package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	
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
			finish();
		}
		
		private function getResGuildInfoMessage(msg:ResGuildInfoMessage):void
		{
			GuildManager.instance().setResGuildInfoMessage(msg);
			
		}
		
	}
}