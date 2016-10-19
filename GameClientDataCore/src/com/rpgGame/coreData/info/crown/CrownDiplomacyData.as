package com.rpgGame.coreData.info.crown
{

	/**
	 * 王权外交数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-22 下午3:50:25
	 *
	 */
	public class CrownDiplomacyData
	{
		/**
		 * 国家名称
		 */
		public var countryId : int;
		/**
		 * 国库资金
		 */
		public var treasuryCapital : String;
		/**
		 * 综合国力
		 */
		public var nationalStrength : String;
		/**
		 * 国家等级
		 */
		public var countryLevel : String;
		/**
		 * 当前盟国
		 */
		public var currAllyId : int;
		/**
		 * 操作
		 */
		public var operate : String;

		public function CrownDiplomacyData()
		{
		}
	}
}
