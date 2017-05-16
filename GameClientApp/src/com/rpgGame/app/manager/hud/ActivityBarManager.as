package com.rpgGame.app.manager.hud
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBoss;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.WelfareEvent;
	import com.rpgGame.coreData.cfg.MazeCfgData;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	public class ActivityBarManager 
	{
		
		public static const buttonDics:Object = {};
		
		
		public static function getActivityIsRunning(activityType:String):Boolean
		{
			var btn:ActivityButtonBase = (ActivityBarManager.buttonDics[activityType] as ActivityButtonBase);
			if (btn != null)
			{
				return btn.runing;
			}
			return false;
		}
		
		public static function getActivityBtnByType(activityType:String):ActivityButtonBase
		{
			return ActivityBarManager.buttonDics[activityType] as ActivityButtonBase;
		}
		
		private static function setNotice(activityType:String, timeData:String, hint:String, hintTime:int):void
		{
			var _local5:TimeData = new TimeData(timeData);
			var _local6:Number = (_local5.getCheackNextTime(0) - hintTime);
			if (_local6 <= SystemTimeManager.curtTm)
			{
				_local6 = (_local5.getCheackNextTime(-(hintTime)) - hintTime);
			}
			TweenLite.delayedCall((_local6 - SystemTimeManager.curtTm) / 1000, showNotice, [activityType, hint, hintTime]);
		}
		
		private static function showNotice(activityType:String, hint:String, hintTime:int):void
		{
			var _local4:Number;
			NoticeManager.marqueeNotify(hint);
			var _local5:ActivityButtonBase = (buttonDics[activityType] as ActivityButtonBase);
			if (_local5)
			{
				_local4 = _local5.openTimeData.getCheackNextTime(-hintTime - 1000) - hintTime;
				trace("下次活动弹提示的时间：" + new Date(_local4) + activityType);
				TweenLite.delayedCall(((_local4 - SystemTimeManager.curtTm) / 1000), showNotice, [activityType, hint, hintTime]);
			}
		}
		
		public static function setup():void
		{
//			var _local1:RacingMiscData = RacingCfgData.miscData;
//			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "Racing", _local1.timeData, _local1.duration, _local1.prepareDuration);
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "Maze", MazeCfgData.timeData, MazeCfgData.duration, MazeCfgData.prepareTime);
//			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "BaZhenTu", BaZhenTuManager.expMultipleStartInTodayTime, BaZhenTuManager.baZhenDuration, BaZhenTuManager.baZhenDuration);
			ActivityButtonBoss.init();
//			YuMaQiShouManager.showActivityBtn();
//			YuMaQiShouManager.onCheckQiShouYuanOpenTime();
//			ShiLianManager.init();
//			BecomeKingManager.init();
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "LunTan", SystemTimeManager.curtTm);
//			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "HotSpring", HotSpringManager.timeData, HotSpringManager.durationTime);
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "SevenLogin", SystemTimeManager.curtTm, 0, 0);
			EventManager.dispatchEvent(WelfareEvent.GET_STATUS_CHANGED);
//			setNotice("Racing", _local1.timeData, LanguageConfig.getText("NOTICE_START_HINT"), 300000);
		}
	}
}