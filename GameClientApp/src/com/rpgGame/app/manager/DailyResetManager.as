package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.core.events.SystemTimeEvent;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 任务跨天清零
	 * @author 
	 * 
	 */	
	public class DailyResetManager
	{
		public function DailyResetManager()
		{
		}
		
		public static function setup():void
		{
			EventManager.addEvent( SystemTimeEvent.DAILY_CLEARED, onClear );
		}
		
		private static function onClear():void
		{
			//鸡毛信、夺经任务跨天不清零
			MiXinManager.resetDaily();
			TouZhuManager.resetDaily();
			TouJingManager.resetDaily();
			YunBiaoManager.resetDaily();
			
			ReliveManager.resetDaily();
			BaZhenTuManager.todayEnterTimes = 0;
		}
		
	}
}