package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.CountryWarSender;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 国战观战管理器
	 * GuoDong.Zhang
	 * 2016-8-31
	 */
	public class CountryWarWatchManager
	{
		private static var _isWatching:Boolean;

		/**是否正在观战*/
		public static function get isWatching():Boolean
		{
			return _isWatching;
		}

		public static var watchTargetID:Number = 0;
		public static var watchMapID:int = -1;
		/**下次可变换观战位置的最小时间*/
		public static var nextWatchCDEndTime:Number = 0;
		
		public static function startWatch():void
		{
			_isWatching = true;
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH,tryChangeWatchPos);
		}
		
		public static function stopWatch():void
		{
			_isWatching = false;
			EventManager.removeEvent(UserMoveEvent.MOVE_THROUGH,tryChangeWatchPos);
		}
		
		public static function reqEnterWatchSceneToServer():void
		{
			var currentWarInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
			if(currentWarInfo)
			{
				CountryWarSender.reqEnterWatchScene(watchMapID,currentWarInfo.defenceCountry,watchTargetID);
			}
		}
		
		public static function reqChangeWatchTargetToServer():void
		{
			
		}
		
		private static function tryChangeWatchPos():void
		{
			if(SystemTimeManager.curtTm > nextWatchCDEndTime)
			{
				if(watchTargetID <= 0)
				{
					CountryWarSender.reqChangeWatchPos(0,MainRoleManager.actor.x,MainRoleManager.actor.z);
				}
			}
		}
	}
}