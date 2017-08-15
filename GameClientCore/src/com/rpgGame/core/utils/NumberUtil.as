package com.rpgGame.core.utils
{
	
	
	/**
	 *
	 * 数字工具类 
	 * @author fly.liuyang
	 * 创建时间：2014-3-12 下午2:55:15
	 * 
	 */
	public class NumberUtil
	{
		/**
		 * 在指定区间产生随机数 
		 * randRange(1,9) 则产生[1,9]之间的整数随机数
		 * @param min
		 * @param max
		 * @return 
		 * 
		 */		
		public static function randRange(min:int, max:int):int 
		{
			var randomNum:int = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
		
		/**
		 * 获取min和max之间的一个数，如果num超出[min, max]，则返回上限或下限 
		 * @param num 输入的数
		 * @param min 下限
		 * @param max 上限
		 * @return 返回[min, max]之间和num差值最小的值
		 * @author 康露 2014年7月15日
		 */
		public static function getBetween(num:Number, min:Number, max:Number) : Number
		{
			if (num > max)
				return max;
			if (num < min)
				return min;
			return num;
		}
		
		public static function combin($value0:uint, $value1:uint, $value2:uint, $value3:uint) : uint
		{
			return ($value0<<24) | ($value1<<16) | ($value2<<8) | ($value3);
		}
		
		/**数字转汉字*/
		public static function getNumberTo(num:Number,isshow:Boolean=false):String
		{
			var sub:String;
			if(isshow){
				if(num>=10000&&num<100000000)//&&num<1000000)
				{
					if(num<1000000)
					{
						sub=Number((num/10000).toFixed(1))+"万";
					}
					else
						sub=(num/10000).toFixed(0)+"万";
					return sub;
				}
					
				else if(num>=100000000)
				{
					sub=(num/100000000).toFixed(1)+"亿";
					return sub;
				}
			}
			return num.toString();
		}
	}
}