package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	public class CountryWarMonsterType
	{
		/** 镇卡将，不会复活，不会反复争夺的 **/ 
		public static const GENERAL_TYPE:uint = rEnum.ENUM_START();
		/** 四神兽，会复活，可以反复争夺的 **/
		public static const SHENSHOU_TYPE:uint = rEnum.next;
		/** 麒麟神兽，死了就打完了 **/
		public static const QINLIN_TYPE:uint = rEnum.next;
	}
}