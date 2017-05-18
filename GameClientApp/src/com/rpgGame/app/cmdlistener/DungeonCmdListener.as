package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.netData.lunjian.message.SCLunJianPanelInfosMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianResultMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianTimeMessage;
	
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
			SocketConnection.addCmdListener(227502, onSCLunJianTimeStartMessage );
			SocketConnection.addCmdListener(227503, onSCLunJianResultMessage );
			
			finish();
		}
		
		private function onSCLunJianResultMessage(msg:SCLunJianResultMessage):void
		{
			if(msg.success==1){
				AppManager.showApp(AppConstant.SWORD_RESULT_SUCCESS,msg.ljId);
			}else{
				AppManager.showApp(AppConstant.SWORD_RESULT_FAIL,msg.ljId);
			}
		}
		
		private function onSCLunJianTimeStartMessage(msg:SCLunJianTimeMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_LUNJIAN_TIME,msg.ljId,msg.remainTime);
		}
		
		private function onSCLunJianPanelInfosMessage(msg:SCLunJianPanelInfosMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,msg.lunJianInfos);
		}
	}
}