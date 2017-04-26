package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
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
			SocketConnection.addCmdListener(225101,recMeridianList);
			finish();
		}
		private function recSingleMeridianInfo(msg:SCMeridianInfoMessage):void
		{
			Mgr.meridianMgr.recMeridianChange(msg.info);
		}
		private function recMeridianList(msg:SCMeridianListMessage):void
		{
			
			Mgr.meridianMgr.recMeridianInfoList(msg.infos);
		}
	}
}