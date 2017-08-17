package com.rpgGame.coreData.info.roulette
{
	import com.rpgGame.coreData.info.task.PrizeInfo;

	/**
	 * 转盘奖励 
	 * @author wewell@163.com
	 * 
	 */	
	public class RoulettePrizes
	{
		public var prizes:Array;
		public var id:int;
		public var index:int;
		public var prizeInfo:PrizeInfo;
		public var isCollectedPrize:Boolean;
		
		public function RoulettePrizes()
		{
		}
		
//		public function setRoulette(pro:RoulettePrizesProto):void
//		{
//			prizes = [];
//			
//			var info:RoulettePrizeInfo;
//			var data:RoulettePrizeProto;
//			for each(data in pro.prizes)
//			{
//				info = new RoulettePrizeInfo();
//				info.converRoulettePrizeData(data);
//			}
//		}
		
		
	}
}