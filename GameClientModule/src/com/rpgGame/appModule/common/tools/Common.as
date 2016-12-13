package com.rpgGame.appModule.common.tools
{

	/**
	 * 公共支持类，内部全部为静态成员及函数，仅供UI使用
	 * @author 
	 * 
	 */	
	public class Common
	{
		/** 中文数字 **/
		private static var chineseNum:Array = [ "零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ];
		public function Common()
		{
		}
		
		/**
		 * 根据数字获得汉字的数字，支持到两位
		 * @param num 阿拉伯数字
		 * @return str 中文数字
		 * @author 陈鹉光 2016-3-22
		 */		
		public static function convertNumToChinese( num:int ):String
		{
			if ( num > 99 )
				return "";
			
			var str:String = "";
			var unit1:uint = ( num / 10 ) >> 0;
			var uint0:uint = num % 10;
			
			if ( unit1 > 1 )
				str += chineseNum[ unit1 ];
			
			if ( unit1 > 0 )
				str += chineseNum[ 10 ];
			
			if ( ! ( unit1 > 0 && uint0 == 0 ) )
				str += chineseNum[ uint0 ];
			
			return str;
		}
		
		/**
		 * 根据玩家等级获取奖励对应的等级  暂时0--210级  估计够用了
		 * @param Lv 玩家等级
		 * @return 
		 * 
		 */		
		public static function getAwardsByPlayerLv( Lv:int ):int
		{
			var level:int;
			
			if( Lv <= 9 )
				level = 0;
			else if( Lv > 9 && Lv <= 19 )
				level = 10;
			else if( Lv > 19 && Lv <= 29 )
				level = 20;
			else if( Lv > 29 && Lv <= 39 )
				level = 30;
			else if( Lv > 39 && Lv <= 49 )
				level = 40;
			else if( Lv > 49 && Lv <= 59 )
				level = 50;
			else if( Lv > 59 && Lv <= 69 )
				level = 60;
			else if( Lv > 69 && Lv <= 79 )
				level = 70;
			else if( Lv > 79 && Lv <= 89 )
				level = 80;
			else if( Lv > 89 && Lv <= 99 )
				level = 90;
			else if( Lv > 99 && Lv <= 109 )
				level = 100;
			else if( Lv > 109 && Lv <= 119 )
				level = 110;
			else if( Lv > 119 && Lv <= 129 )
				level = 120;
			else if( Lv > 129 && Lv <= 139 )
				level = 130;
			else if( Lv > 139 && Lv <= 149 )
				level = 140;
			else if( Lv > 149 && Lv <= 159 )
				level = 150;
			else if( Lv > 159 && Lv <= 169 )
				level = 160;
			else if( Lv > 169 && Lv <= 179 )
				level = 170;
			else if( Lv > 179 && Lv <= 189 )
				level = 180;
			else if( Lv > 189 && Lv <= 199 )
				level = 190;
			else if( Lv > 199 && Lv <= 209 )
				level = 200;
			else if( Lv > 209 )
				level = 210;
			
			return level;
		}
	}
}