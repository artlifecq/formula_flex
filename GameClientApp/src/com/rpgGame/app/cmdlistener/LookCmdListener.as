package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.events.LookEvent;
	import com.rpgGame.netData.player.message.ResOthersPlayerInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *查看消息监听器 
	 * @author dik
	 * 
	 */
	public class LookCmdListener extends BaseBean
	{
		public function LookCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(103120, onResOthersPlayerInfoMessage);
			
			finish();
		}
		
		private function onResOthersPlayerInfoMessage(msg:ResOthersPlayerInfoMessage):void
		{
			EventManager.dispatchEvent(LookEvent.ROLE_INFO,msg.othersInfo);
		}
	}
}