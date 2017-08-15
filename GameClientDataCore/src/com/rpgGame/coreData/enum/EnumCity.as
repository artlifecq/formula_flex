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
		public static const HUANG_CHENG:int=5;
		
		/**
		 * 邯郸
		 */
		public static const WC_HD:int=1;
		/**
		 * 大梁
		 */
		public static const WC_DL:int=2;
		/**
		 * 郢都
		 */
		public static const WC_YD:int=3;
		/**
		 * 临淄
		 */
		public static const WC_LZ:int=4;
		
		public static var wangChengFlags:Array=["handan","daliang","chengdu","linzi"];
		public static var wangchangCitys:Array=["wangcheng3","wangcheng4","wangcheng1","wangcheng2"];
		public static var weichengCitys:Array=["weicheng1","weicheng2","weicheng3"];
		public static var weichengFlags:Array=["gusu","qufu","kuaiji"];
		
		public function EnumCity()
		{
		}
		
		public static function getCityName(city:int,wcId:int=-1):String
		{
			var name:String="";
			switch(city){
				case EnumCity.WANG_CHENG:
					name=getCityWCName(wcId);
					break;
				case EnumCity.XI_WEI:
					name="【会稽】";
					break;
				case EnumCity.ZHONG_WEI:
					name="【曲阜】";
					break;
				case EnumCity.DONG_WEI:
					name="【姑苏】";
					break;
				case EnumCity.HUANG_CHENG:
					name="【咸阳】";
					break;
			}
			return name;
		}
		
		private static function getCityWCName(city:int):String
		{
			var name:String="";
			switch(city){
				case EnumCity.WC_HD:
					name="【邯郸】";
					break;
				case EnumCity.WC_DL:
					name="【大梁】";
					break;
				case EnumCity.WC_YD:
					name="【郢都】";
					break;
				case EnumCity.WC_LZ:
					name="【临淄】";
					break;
			}
			return name;
		}
	}
}