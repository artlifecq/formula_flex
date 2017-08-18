package com.rpgGame.coreData.cfg.task
{
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.daily.TouZhuPrizeData;

	public class TouZhuCfgData
	{
		/**偷猪任务的奖励，按照物品品质排序**/
		public static var prizeVect:Vector.<TouZhuPrizeData>;
		
		/**领取偷猪任务的npc**/
		public static var acceptNpc:int;
		/**完成偷猪任务的npc**/
		public static var completeNpc:int;
		/**每天能够接受偷猪任务的次数**/
		public static var timesPerDay:int;
		/**活动开始时间**/
		public static var timeData:String;
		/**活动持续时长**/
		public static var duration:Number;
		/**接受**/
		public static var acceptDialog:String;
		/**完成对话**/
		public static var completeDialog:String;
		
//		public static function setConfig( touZhuConfig:TouZhuConfig ):void
//		{
//			prizeVect = new Vector.<TouZhuPrizeData>();
//			if( touZhuConfig == null )
//				return;
//			
//			timesPerDay = touZhuConfig.timesPerDay;
//			timeData = touZhuConfig.timeData;
//			
//			if( touZhuConfig.duration != null )
//				duration = touZhuConfig.duration.toNumber();
//			
//			var len:int = touZhuConfig.prizes.length;
//			for( var i:int = 0; i < len; i ++)
//			{
//				prizeVect.push( new TouZhuPrizeData( touZhuConfig.prizes[i] ) );
//			}
//			
//		}
		
		/**
		 * 偷猪的猪ID
		 * @return 
		 * 
		 */		
		public static function getTouZhuId():int
		{
			if( prizeVect.length <= 0 )
				return -1;
			
			return prizeVect[0].zhuId;
		}
		
		public static function getAllPrizeVect():Vector.<PrizeInfo>
		{
			var allPrizeVect:Vector.<PrizeInfo> = new Vector.<PrizeInfo>();
			var touZhuPrizeData:TouZhuPrizeData;
		
			var len:int = prizeVect.length;
			for( var i:int = 0; i < len; i ++ )
			{
				touZhuPrizeData = prizeVect[i];
				allPrizeVect.push( touZhuPrizeData.prize );
			}
			return allPrizeVect;
		}
		
		/**
		 * 是否是猪怪物
		 * @param monsterId
		 * @return 
		 * 
		 */		
		public static function isZhuMonster( monsterId:int ):Boolean
		{
			var touZhuPrizeData:TouZhuPrizeData;
			var len:int = prizeVect.length;
			for( var i:int = 0; i < len; i ++ )
			{
				touZhuPrizeData = prizeVect[i];
				if( touZhuPrizeData.zhuId == monsterId )
					return true;
			}
			return false;
		}
		
		public static function getPrizeByZhuId( monsterId:int ):PrizeInfo
		{
			var touZhuPrizeData:TouZhuPrizeData;
			var len:int = prizeVect.length;
			for( var i:int = 0; i < len; i ++ )
			{
				touZhuPrizeData = prizeVect[i];
				if( touZhuPrizeData.zhuId == monsterId )
					return touZhuPrizeData.prize;
			}
			return null;
		}
		
		public static function getQuality( monsterId:int ):int
		{
			var touZhuPrizeData:TouZhuPrizeData;
			var len:int = prizeVect.length;
			for( var i:int = 0; i < len; i ++ )
			{
				touZhuPrizeData = prizeVect[i];
				if( touZhuPrizeData.zhuId == monsterId )
					return i;
			}
			return 0;
		}
		
	}
}