package com.rpgGame.core.utils
{
	
	/**
	 * 数字转换器
	 * @author carver
	 * 
	 */	
	public class NumberFormatter
	{
		/**
		 *	Formats a number to include a leading zero if it is a single digit
		 *	between -1 and 10. 	
		 * 
		 * 	@param n The number that will be formatted
		 *
		 *	@return A string with single digits between -1 and 10 padded with a 
		 *	leading zero.
		 *
		 * 	@langversion ActionScript 3.0
		 *	@playerversion Flash 8.5
		 *	@tiptext
		 */		
		public static function addLeadingZero(n:Number):String
		{
			var out:String = String(n);
			
			if(n < 10 && n > -1)
			{
				out = "0" + out;
			}
			
			return out;
		}	
		
		/** 返回符合条件的最大单位 **/
		private static function getUnit(value:Number, arrPos:Array) :　int
		{
			for (var idx:int=0; idx<arrPos.length; idx++)
			{
				if (arrPos[idx] <= value)
				{
					return idx;
				}
			}
			return arrPos.length-1;
		}
		
		private static function fixLen(num:int, fixLen:int) : String
		{
			var strNum:String = num.toString();
			var ret:String = "";
			for (var idx:int=strNum.length; idx<fixLen; idx++)
			{
				ret += "0";
			}
			
			return ret + strNum;
		}
		
		/**
		 * 将数字格式化为字符串，看下面各种变态的例子：<br/>
		 * GameLog.add(NumberFormatter.format(12345, ["万"], [10000], 1));	// 1.2万<br/>
		 * GameLog.add(NumberFormatter.format(10345, ["万"], [10000], 1));	// 1万<br/>
		 * GameLog.add(NumberFormatter.format(103550, ["万"], [10000], 1, false));	// 10.4万<br/>
		 * GameLog.add(NumberFormatter.format(103550, ["亿", "万"], [100000000, 10000], 1));	// 10.3万<br/>
		 * GameLog.add(NumberFormatter.format(10355093487259, ["亿", "万"], [100000000, 10000], 0, false, null, 2));	// 103550亿9349万<br/>
		 * GameLog.add(NumberFormatter.format(10355093487259, ["亿", "万"], [100000000, 10000], 5));	// 103550.93487亿<br/>
		 * GameLog.add(NumberFormatter.format(590, ["亿", "万", "千", "百", "十"], [100000000, 10000, 1000, 100, 10], 0, false, [1,2,3,4,5], 2));	// 0005百00009十<br/>
		 * GameLog.add(NumberFormatter.format(10355093487259, ["G", "M", "K", ""], [1024*1024*1024, 1024*1024, 1024, 1], 0, false));	// 9643G954M719K667<br/>
		 * GameLog.add(NumberFormatter.format(12345, ["亿"], [100000000], 1));	// 12345<br/>
		 * @param value 需要被格式化的数字
		 * @param arrUnit 各位上的单位字符串 例如：["亿","万","千","百","十"]
		 * @param arrPos 各单位的量 例如：["100000000","10000","1000","100","10"]
		 * @param pointCount 精确到小数点几位，如果设置了这个变量，那么只会转换第一个单位
		 * @param isFloor 是否用去尾法舍去小数点
		 * @param arrFill 每个单位的显示长度，如果填了这个数组，当该位显示不够时，会自动补0
		 * @param maxUnit 显示单位的数量上限
		 * @return 返回格式化后的字符串
		 * @author 康露 2014年7月16日
		 * 
		 */
		public static function format(value:Number, arrUnit:Array, arrPos:Array, pointCount:int=0, isFloor:Boolean=true, arrFill:Array=null, maxUnit:int=0x7fffffff) : String
		{
			var f:Number;
			var posUnit:int;
			var num:String;
			if (pointCount > 0)
			{// 只显示一个单位
				f = value * Math.pow(10, pointCount);
				posUnit = getUnit(f, arrPos);
				if (posUnit >= arrPos.length)
				{
					return value.toString();
				}
				f = isFloor ? Math.floor(f / arrPos[posUnit]) : Math.ceil(f/arrPos[posUnit]);
				num = (f/Math.pow(10, pointCount)).toFixed(pointCount);
				if (num.indexOf(".0") != -1)
				{
					num = num.substr(0, num.length-2);
				}
				return num + arrUnit[posUnit];
			} else
			{// 显示到最后一个单位
				posUnit = getUnit(value, arrPos);
				if (posUnit >= arrPos.length)
				{
					return value.toString();
				}
				
				var showLen:int = arrPos.length;
				var showUnit:int = 0;
				var ret:String = "";
				f = value;
				for (var idx:int=posUnit; (idx<showLen)&&(showUnit<maxUnit); idx++,showUnit++)
				{
					var n:int;
					if (((showUnit==maxUnit-1) || (idx==showLen - 1)) && !isFloor)
					{
						n = Math.ceil(f/arrPos[idx]);
					} else
					{
						n = Math.ceil((f / arrPos[idx]) >> 0);
					}
					ret += (arrFill==null)?n.toString():fixLen(n, arrFill[idx]);
					ret += arrUnit[idx];
					f %= arrPos[idx];
				}
				return ret;
			}
			
			return value.toString();
		}
		
		/**
		 * 将数字转换为千分位方式 
		 * @param value
		 * @return 
		 * 
		 */		
		public static function formatThousands(value:Number):String 
		{
			var numStr:String = Math.abs(value).toString();
			var numArr:Array = new String(numStr).split(".");
			
			var numLen:int = String(numArr[0]).length;
			
			if (numLen > 3) {
				var numSep:int = int(Math.floor(numLen / 3));
				
				if ((numLen % 3) == 0) {
					numSep--;
				}
				
				var b:int = numLen;
				var a:int = b - 3;
				
				var arr:Array = [];
				for (var i:int = 0; i <= numSep; i++) {
					arr[i] = numArr[0].slice(a, b);
					a = int(Math.max(a - 3, 0));
					b = int(Math.max(b - 3, 1));
				}
				arr.reverse();
				numArr[0] = arr.join(",");
			}
			numStr = numArr.join(".");
			return numStr.toString();
		}
		
		
		public static function int2CommaString(number:uint):String
		{
			var str:String = String(number);
			var len:int = str.length;
			var ret:String = "";
			for(var i:int = 0; i < len; i++)
			{
				if(i%3==0 && i != 0)
				{
					ret = str.charAt(len-i-1) + "," + ret;
				}
				else
				{
					ret = str.charAt(len-i-1) + ret;
				}
			}
			return ret;
		}
		
		/**
		 * •	主界面人物头像处数字：
		 *	金额全部取整：最小金额=0，最大金额=999999999999（9999亿），超出不在累计。
		 *	a	数量不超过99999时全部显示（精确到各位）；
		 *	b	数量超过99999并且不大于99999999显示4位有效数字+“万”。例如：10.00万、999.5万、9999万；
		 *	c	数量超过99999999，并且不大于999999999999，显示4位有效数字+"亿"。例如：1.000亿、99.50亿、999.5亿、9999亿。
		 * @param number
		 * @return 
		 * ------------------------------------------
		 * toFixed() 方法会自动四舍五入，照成显示不精确， 
		 * 比如，31150元宝， 固定2位小数就是显示3.12万，照成玩家误解以为元宝给少了
		 * 这里采取直接截取字符串的方法，超过2位的就直接截取，不做舍入操作
		 * 刘阳 2015年1月22日
		 */
		public static function mainCharNumberFormatter(number:Number):String
		{
			var str:String;
			var len:int ;
			var pointIndex:int
			if(number > 999999999999)
			{
				str = "9999亿";
			}
			else if(number > 99999999)//亿
			{
				//1.22 刘阳修改， toFixed() 会自动四舍五入，
//				len = uint(number/100000000).toString().split("").length;
//				str = (number/100000000).toFixed(4-len) +"亿";	
				
				str = (number/100000000).toString();
				
				pointIndex = str.indexOf(".");
				if(pointIndex == -1)
				{
					str += "亿"
				}else
				{
					str = str.substr(0,pointIndex + 3) + "亿";
				}
			}
			else if(number > 99999)//万
			{
				//1.22 刘阳修改， toFixed() 会自动四舍五入，
//				len = uint(number/10000).toString().split("").length;
//				str = (number/10000).toFixed(4-len)+"万";
				str = (number/10000).toString();
				pointIndex = str.indexOf(".");
				if(pointIndex == -1)
				{
					str += "万"
				}else
				{
					str = str.substr(0,pointIndex + 3) + "万";
				}
			}
			else
			{
				str = int2CommaString(number);
			}
				
			return str;
			
		}

	}
}