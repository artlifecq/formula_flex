package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneIdInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneMonsterCountMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZonePanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneTimeInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
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
			SocketConnection.addCmdListener(400105, getSCDailyZoneIdInfoMessage);
			finish();
		}
		
		private function getSCDailyZonePanelInfoMessage(msg:SCDailyZonePanelInfoMessage):void
		{
			DailyZoneDataManager.instance().updataDailyList(msg.panelInfos);
		}
		
		private function getSCDailyZoneMonsterCountMessage(msg:SCDailyZoneMonsterCountMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATA_WAVE_INFO,msg.currentWaveId,msg.currentWaveKill);
		}
		
		private function getSCDailyZoneTimeInfoMessage(msg:SCDailyZoneTimeInfoMessage):void
		{
			if(msg.success ==1)
				EventManager.dispatchEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,msg.remainTime);
		}
		
		private function getSCDailyZoneRewardPanelInfoMessage(msg:SCDailyZoneRewardPanelInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,msg.success,msg.star);
			if(msg.success==1){
				AppManager.showApp(AppConstant.DAILY_DUNGEON_SUCCESS,msg);
			}else{
				AppManager.showApp(AppConstant.SWORD_RESULT_FAIL);
			}
		}
		
		private function getSCDailyZoneIdInfoMessage(msg:SCDailyZoneIdInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,msg.dailyZoneId);
		}
	}
}