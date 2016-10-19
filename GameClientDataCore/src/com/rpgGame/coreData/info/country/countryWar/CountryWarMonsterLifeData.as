package com.rpgGame.coreData.info.country.countryWar
{
	

	/**
	 * 
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarMonsterLifeData
	{
		/** 神兽什么的 CountryWarMonsterType **/
		public var monsterType:int;
		
		/** 怪物配置id **/
		public var monsterId:int;
		/** 怪物所属国家 **/
		public var monsterCountry:int;
		/** 怪物血量百分比 **/
		public var bloodProgress:int;
		/**是否已经死亡*/
		public var isDead:Boolean;
		
		
		public function CountryWarMonsterLifeData()
		{
		}
	}
}