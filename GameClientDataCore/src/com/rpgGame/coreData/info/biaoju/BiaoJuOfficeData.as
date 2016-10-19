package com.rpgGame.coreData.info.biaoju
{
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;

	public class BiaoJuOfficeData
	{
		public function BiaoJuOfficeData()
		{
		}
		public var id : int;
		public var name : String;
		public var governmentPost : int;
		public var level : int;
		public var silver : Number;
		
		public function setup(data:CountryGovernmentPostData):void
		{
			id = data.id;
			name = data.playerName;
			governmentPost = data.governmentPost;
			level = data.level;
			silver = 0;
		}
	}
}