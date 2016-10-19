package com.rpgGame.coreData.info.roulette
{
	import com.rpgGame.coreData.info.task.PrizeInfo;
	
	import app.message.RoulettePrizeProto;
	import app.message.RoulettePrizesProto;
	
	/**
	 * 转盘奖励信息
	 * @author wewell@163.com
	 * 
	 */	
	public class RouletteInfo
	{
		/** 奖励数组 **/
		public var prizes:Array;
		/** 基础经验 **/
		public var normalExp:int;
		/** 奖励id **/
		public var id:int;
		/** 奖励下标 **/
		public var index:int;
		/** 奖励数据 **/
		public var prizeInfo:PrizeInfo;
		public var isCollectedPrize:Boolean;
		
		public function RouletteInfo()
		{
		}
		
		/**
		 * 设置轮盘奖励数据 
		 * @param pro RoulettePrizesProto
		 * 
		 */		
		public function setRoulette(pro:RoulettePrizesProto):void
		{
			prizes = [];
			
			var info:PrizeInfo;
			var data:RoulettePrizeProto;
			for each(data in pro.prizes)
			{
				info = new PrizeInfo
				info.converRoulettePrizeData(data);
				prizes.push(info);
			}
		}
	}
}


