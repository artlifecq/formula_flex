package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.netData.meridian.message.SCMeridianInfoMessage;
	import com.rpgGame.netData.meridian.message.SCMeridianListMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class MeridianCmdListerner extends BaseBean
	{
		public function MeridianCmdListerner()
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(225102,recSingleMeridianInfo);
			finish();
		}
		private function recSingleMeridianInfo(msg:SCMeridianInfoMessage):void
		{
			
		}
		private function recMeridianList(msg:SCMeridianListMessage):void
		{
			
		}
	}
}