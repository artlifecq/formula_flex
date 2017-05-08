package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.netData.map.message.SCLunJianPanelInfosMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *副本相关信息处理
	 *@author dik
	 *2017-5-8下午1:32:21
	 */
	public class DungeonCmdListener extends BaseBean
	{
		public function DungeonCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(227501, onSCLunJianPanelInfosMessage );
			finish();
		}
		
		private function onSCLunJianPanelInfosMessage(msg:SCLunJianPanelInfosMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,msg.lunJianInfos);
		}
	}
}