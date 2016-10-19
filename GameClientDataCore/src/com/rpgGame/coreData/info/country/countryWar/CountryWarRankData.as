package com.rpgGame.coreData.info.country.countryWar
{
	

	/**
	 * 国战杀人排行榜的单项数据
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarRankData
	{
		public var rank:int;
		/**英雄ID**/
		public var heroID:Number;
		/**英雄名字**/
		public var heroName:String;
		/**国家ID**/
		public var countryID:int;
		/**杀敌数量**/
		public var killCount:int;
		
		public function CountryWarRankData()
		{
			
		}
		
	}
}