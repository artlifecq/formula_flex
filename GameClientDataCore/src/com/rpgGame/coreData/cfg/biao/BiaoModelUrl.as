package com.rpgGame.coreData.cfg.biao
{
	public class BiaoModelUrl
	{
		public static const BIAOCHE_01:String = "monster/an_mo_biaoche_001/an_mo_biaoche_001";
		public static const BIAOCHE_02:String = "monster/an_mo_biaoche_002/an_mo_biaoche_002";
		public static const BIAOCHE_03:String = "monster/an_mo_biaoche_003/an_mo_biaoche_003";
		public static const BIAOCHE_04:String = "monster/an_mo_biaoche_004/an_mo_biaoche_004";
		public static const BIAOCHE_05:String = "monster/an_mo_biaoche_005/an_mo_biaoche_005";
		
		
		public static function getUrl(qulity:int):String
		{
			switch(qulity)
			{
				case 1:return BIAOCHE_01;
				case 2:return BIAOCHE_02;
				case 3:return BIAOCHE_03;
				case 4:return BIAOCHE_04;
				case 5:return BIAOCHE_05;
			}
			return BIAOCHE_01;
		}
	}
}