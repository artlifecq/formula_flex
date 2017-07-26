package com.rpgGame.coreData.enum
{
	public class EnumCity
	{
		/**
		 * 东卫
		 */
		public static const DONG_WEI:int=1;
		/**
		 * 中卫
		 */
		public static const ZHONG_WEI:int=2;
		/**
		 * 西卫
		 */
		public static const XI_WEI:int=3;
		/**
		 * 王城
		 */
		public static const WANG_CHENG:int=4;
		/**
		 * 皇城
		 */
		public static const HUANG_CHENG:int=6;
		
		public function EnumCity()
		{
		}
		
		public static function getCityName(city):String
		{
			var name:String="";
			switch(city){
				case EnumCity.WANG_CHENG:
					name="【大梁】";
					break;
				case EnumCity.XI_WEI:
					name="【会稽】";
					break;
				case EnumCity.ZHONG_WEI:
					name="【姑苏】";
					break;
				case EnumCity.DONG_WEI:
					name="【曲阜】";
					break;
			}
			return name;
		}
	}
}