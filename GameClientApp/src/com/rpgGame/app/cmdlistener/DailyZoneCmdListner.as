package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneMonsterCountMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZonePanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneTimeInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class DailyZoneCmdListner extends BaseBean
	{
		public function DailyZoneCmdListner():void
		{
			super();
		}
		override public function start():void
		{
			SocketConnection.addCmdListener(400101, getSCDailyZonePanelInfoMessage);
			SocketConnection.addCmdListener(400102, getSCDailyZoneMonsterCountMessage);
			SocketConnection.addCmdListener(400103, getSCDailyZoneTimeInfoMessage);
			SocketConnection.addCmdListener(400104, getSCDailyZoneRewardPanelInfoMessage);
			finish();
		}
		
		private function getSCDailyZonePanelInfoMessage(msg:SCDailyZonePanelInfoMessage):void
		{
			DailyZoneDataManager.instance().updataDailyList(msg.panelInfos);
		}
		
		private function getSCDailyZoneMonsterCountMessage(msg:SCDailyZoneMonsterCountMessage):void
		{
			
		}
		
		private function getSCDailyZoneTimeInfoMessage(msg:SCDailyZoneTimeInfoMessage):void
		{
			
		}
		
		private function getSCDailyZoneRewardPanelInfoMessage(msg:SCDailyZoneRewardPanelInfoMessage):void
		{
			
		}
	}
}