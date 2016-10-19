package com.rpgGame.coreData.info.country
{

	/**
	 * 国战汇总数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-17 下午6:50:25
	 *
	 */
	public class CountryWarAggregateData
	{
		/**
		 * 国家名称
		 */
		public var countryName : String;
		/**
		 * 累计胜利
		 */
		public var winCount : int;
		/**
		 * 累计失败
		 */
		public var failCount : int;

		public function CountryWarAggregateData()
		{
		}
	}
}
