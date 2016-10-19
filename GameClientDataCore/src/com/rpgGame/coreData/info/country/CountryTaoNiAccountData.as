package com.rpgGame.coreData.info.country
{

	/**
	 * 国家讨逆结算数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-03 上午10:50:25
	 *
	 */
	public class CountryTaoNiAccountData
	{
		/**
		 * 玩家ID
		 */
		public var heroId : Number = 0;
		/**
		 * 玩家名字
		 */
		public var heroName : String = "";
		/**
		 * 复活次数
		 */
		public var reliveCount : int = 0;
		/**
		 * 击杀怪物数
		 */
		public var killMonsterCount : int = 0;
		/**
		 * 击杀先锋数
		 */
		public var killEliteCount : int = 0;
		/**
		 * 击杀首领数
		 */
		public var killBossCount : int = 0;

		public function CountryTaoNiAccountData()
		{
		}
	}
}
