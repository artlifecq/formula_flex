package com.rpgGame.coreData.cfg.task
{
	import com.rpgGame.coreData.info.toujing.TouJingPrizeInfo;
	
	import app.message.TouJingConfig;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 偷经任务配置
	 * @author 
	 * 
	 */	
	public class TouJingCfgData
	{
		/**接受偷经任务的npc的ID**/
		private static var _acceptNpcID:int;
		/**偷经的npc的ID**/
		private static var _submitNpcID:int;
		/**完成偷经任务的npc的ID**/
		private static var _completeNpcID:int;
		
		/**偷经的开始时间**/
		public static var timeData:String;
		/**偷经活动持续的时长，单位毫秒**/
		public static var duration:Number;
		/**偷经有奖励的次数**/
		public static var hasPrizeTimes:int;
		/**每天能够偷经的次数**/
		public static var timesPerDay:int;
		/**是否在在偷经活动时间内**/
		public static var isInTime:Boolean;
		/**偷经奖励**/
		public static var awardHashMap:HashMap;
		
		public static function setConfig( touJingConfig:TouJingConfig ):void
		{
			if( touJingConfig == null )
				return;
			awardHashMap = new HashMap();
			
			timeData = touJingConfig.touJingTimeData;
			if( touJingConfig.touJingDuration != null )
				duration = touJingConfig.touJingDuration.toNumber();
			hasPrizeTimes = touJingConfig.touJingHasPrizeTimes;
			timesPerDay = touJingConfig.touJingTimesPerDay;
			isInTime = touJingConfig.hasTouJingTimeData;
			
			var len:int = touJingConfig.touJingPrize.length;
			var toujingPrize:TouJingPrizeInfo;
			for( var idx:int = 0; idx < len; idx ++)
			{
				toujingPrize = new TouJingPrizeInfo();
				toujingPrize.setTouJingPrizeInfo( touJingConfig.touJingPrize[ idx ] );
				awardHashMap.add( toujingPrize.level, toujingPrize );
			}
		}
		
		/**
		 * 获取适合当前等级的偷经奖励配置
		 * @param level 玩家等级
		 * @return 
		 * 
		 */		
		public static function getTouJingPrizeByLevel(level:int):TouJingPrizeInfo
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
		

		/**接受偷经任务的npc的ID**/
		public static function get acceptNpcID():int
		{
			return _acceptNpcID;
		}

		/**
		 * @private
		 */
		public static function set acceptNpcID(value:int):void
		{
			_acceptNpcID = value;
		}

		/**偷经的npc的ID**/
		public static function get submitNpcID():int
		{
			return _submitNpcID;
		}

		/**
		 * @private
		 */
		public static function set submitNpcID(value:int):void
		{
			_submitNpcID = value;
		}

		/**完成偷经任务的npc的ID**/
		public static function get completeNpcID():int
		{
			return _completeNpcID;
		}

		/**
		 * @private
		 */
		public static function set completeNpcID(value:int):void
		{
			_completeNpcID = value;
		}


	}
}