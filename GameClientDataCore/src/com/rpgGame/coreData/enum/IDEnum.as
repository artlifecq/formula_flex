package com.rpgGame.coreData.enum
{
	public class IDEnum
	{
		static private var _id:int = 100000;
		public function IDEnum()
		{
		}
		
		static public function get nextID():int
		{
			return _id++;
		}
	}
}