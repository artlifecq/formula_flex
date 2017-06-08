package com.rpgGame.coreData.info
{
	/**
	 *周奖励 
	 * @author yfl
	 * 
	 */	
	public class DRankWeekReward
	{
		public function DRankWeekReward()
		{
		}
		public var minRank:int;
		public var maxRank:int;
		public var reward:Object;
		
		public function isInWeek(rank:int):Boolean
		{
			if (rank<minRank) 
			{
				return false;
			}
			else if (rank>maxRank) 
			{
				return false;
			}
			return true;
		}
	}
}