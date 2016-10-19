package com.rpgGame.coreData.info.heroSearch
{

	public class HeroSearchData
	{
		public var heroName : String = "";
		public var heroId : Number = 0;
		public var isOnline : Boolean = false;
		public var level : int = 0;
		public var countryId : int = 0;

		//客户端来排序的，非消息里带的
		public var index : int = 0;

		public function HeroSearchData()
		{
		}
	}
}
