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
			
			finish();
		}
		
		
	}
}