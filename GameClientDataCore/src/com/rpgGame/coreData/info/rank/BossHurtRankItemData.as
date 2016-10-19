package com.rpgGame.coreData.info.rank
{

	/**
	 * Boss伤害排行榜项目数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-03 上午10:50:25
	 *
	 */
	public class BossHurtRankItemData
	{
		/**
		 * 排行序号
		 */
		public var rankIndex : int = 0;
		/**
		 * 玩家名字
		 */
		public var heroName : String = "";
		/**
		 * 最大伤害
		 */
		public var maxHurt : int = 0;
		/**
		 * 当前伤害
		 */
		public var currHurt : int = 0;
		/**
		 * 玩家id
		 */
		public var id : Number = 0;
		

		public function BossHurtRankItemData()
		{
		}
	}
}
