package com.rpgGame.app.ctrl
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.time.SystemTimeManager;

	/**
	 * 冷却管理器
	 * @author yfl
	 */	
	public class ControlCoolDown
	{

		protected static var _customCoolDownMap:HashMap = new HashMap();
		
		
		
		public function ControlCoolDown()
		{
			
		}
		
		
		
		public static function AddCustomCoolDownTime(key:int, time:int):void
		{
			SetCoolDownTime(_customCoolDownMap, key, time);
		}
		
		public static function RemoveCustomCoolDownTime(key:int):void
		{
			SetCoolDownTime(_customCoolDownMap, key, 0);
		}
		
		public static function IsCustomCoolDown(key:int):Boolean
		{
			return (GetCoolDownTime(_customCoolDownMap, key) == 0);
		}
		

		
		public static function GetCustomCooldownTime(key:int):int
		{
			return GetCoolDownTime(_customCoolDownMap, key) -  SystemTimeManager.curtTm;
		}
		


		
		/*
		* 设置冷却时间
		* @param map
		* @param id
		* @param time
		*/		
		private static function SetCoolDownTime(map:HashMap, key:int, time:int):void
		{
			if (time <= 0)
			{
				if (map.containsKey(key))
					map.remove(key);
			}
			else
			{
				map.put(key, ( SystemTimeManager.curtTm + time));
			}
		}
		
		/**
		 * 得到冷却时间 
		 * @param map
		 * @param id
		 * @return 
		 */		
		private static function GetCoolDownTime(map:HashMap, key:int):int
		{
			var v:int = map.get(key);
			if (v != 0)
			{
				if ( SystemTimeManager.curtTm > v)
				{
					map.remove(key);
					v = 0;
				}
			}
			
			return v;
		}
		
		/**
		 * 得到冷却毫秒 
		 * @param map
		 * @param key
		 * @return 
		 * 
		 */
		private static function GetCoolDownTimeMs(map:HashMap, key:int):int
		{
			var v:int = map.get(key);
			if (v != 0)
			{
				if ( SystemTimeManager.curtTm > v)
				{
					map.remove(key);
					v = 0;
				}
				else
				{
					v = v -  SystemTimeManager.curtTm;
				}
			}
			
			return v;
		}
	}
}