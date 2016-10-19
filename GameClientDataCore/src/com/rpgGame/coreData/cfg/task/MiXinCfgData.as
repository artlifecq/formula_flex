package com.rpgGame.coreData.cfg.task
{
	import com.rpgGame.coreData.info.task.MiXinPrizeInfo;
	
	import app.message.MiXinConfig;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 鸡毛信Cfg静态数据 
	 * @author 陈鹉光
	 * 
	 */	
	public class MiXinCfgData
	{
		/**领取密信任务的npc**/
		private static var _acceptNpc:int;
		/**刷新密信任务的npc**/
		private static var _refleshNpc:int;
		/**弱国刷新密信任务的npc**/
		private static var _weakRefleshNpc:int;
		/**交密信任务的npc以及换信的npc**/
		private static var _submitNpc:int;
		/**完成密信任务的npc**/
		private static var _completeNpc:int;
		
		/**每天能够接受密信任务的次数**/
		public static var timesPerDay:int;
		/**密信活动能够开启的最大小时**/
		public static var miXinStartMaxHour:int;
		/**密信活动能够开启的最小小时**/
		public static var miXinStartMinHour:int;
		/**密信活动期间加成的经验百分比**/
		public static var miXinAddMultiple:Number;
		/** 是否在活动时间内 **/
		public static var isInTime:Boolean;
		/**鸡毛信奖励**/
		public static var awardHashMap:HashMap;
		
		
		public static function setConfig( miXinConfig:MiXinConfig ):void
		{
			if( miXinConfig == null )
				return;
			
			awardHashMap = new HashMap();
			timesPerDay = miXinConfig.timesPerDay;
			miXinStartMinHour = miXinConfig.miXinStartMinHour;
			miXinStartMaxHour = miXinConfig.miXinStartMaxHour;
			miXinAddMultiple = miXinConfig.miXinAddMultiple;
			isInTime = miXinConfig.hasTimesPerDay;
			
			var len:int = miXinConfig.miXinPrize.length;
			var mixinPrize:MiXinPrizeInfo;
			for( var i:int = 0; i < len; i ++)
			{
				mixinPrize = new MiXinPrizeInfo();
				mixinPrize.converMixinPrizeData(miXinConfig.miXinPrize[i]);
				awardHashMap.add( mixinPrize.level, mixinPrize );
			}
		}
		
		/**
		 * 获取适合当前等级的鸡毛信奖励配置
		 * @param level 玩家等级
		 * @return 
		 * 
		 */		
		public static function getMiXinPrizeByLevel(level:int):MiXinPrizeInfo
		{
			var levels:Array = awardHashMap.keys();
			levels.sort(Array.NUMERIC);
			var len:int = levels.length;
			for(var i:int=0; i<len; i++)
			{
				if(i >= len-1 || levels[i] == level)
					return awardHashMap.getValue(levels[i]);
				
				if(levels[i] < level && level < levels[i+1])
					return awardHashMap.getValue(levels[i]); 
			}
			return null;
		}

		/**领取密信任务的npc**/
		public static function get acceptNpc():int
		{
			return _acceptNpc;
		}

		/**
		 * @private
		 */
		public static function set acceptNpc(value:int):void
		{
			_acceptNpc = value;
		}

		/**刷新密信任务的npc**/
		public static function get refleshNpc():int
		{
			return _refleshNpc;
		}

		/**
		 * @private
		 */
		public static function set refleshNpc(value:int):void
		{
			_refleshNpc = value;
		}

		/**弱国刷新密信任务的npc**/
		public static function get weakRefleshNpc():int
		{
			return _weakRefleshNpc;
		}

		/**
		 * @private
		 */
		public static function set weakRefleshNpc(value:int):void
		{
			_weakRefleshNpc = value;
		}

		/**交密信任务的npc以及换信的npc**/
		public static function get submitNpc():int
		{
			return _submitNpc;
		}

		/**
		 * @private
		 */
		public static function set submitNpc(value:int):void
		{
			_submitNpc = value;
		}

		/**完成密信任务的npc**/
		public static function get completeNpc():int
		{
			return _completeNpc;
		}

		/**
		 * @private
		 */
		public static function set completeNpc(value:int):void
		{
			_completeNpc = value;
		}

		
	}
}