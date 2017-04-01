package com.gameClient.utils
{
	import flash.utils.Dictionary;

	/**
	 * 字符串过滤函数
	 * @author kuhxkuhx
	 * @author masefee
	 * 2012-03-11
	 */
	public class StringFilter
	{
		private static var _nowState : uint = 0;
		private static var _maxSubStringLen : uint = 0;
		private static var _states : Dictionary = new Dictionary();

		private static function addMaskString(maskString : String) : void
		{
			var len : int = maskString.length;
			var curState : uint = 0;
			// 判断本字符串是否在之前已经处理过, 或者是以前处理过的字符串的子串 by 康露 2012-03-11
			var isMatched : Boolean = true;
			var key : uint = 0;
			for (var index : int = 0; index < len; index++)
			{
				var curChar : uint = maskString.charCodeAt(index);
				key = curState | curChar;
				if ((_states[key] == null) || !isMatched)
				{ // 没有匹配上, 插入新的状态 by 康露 2012-03-11
					isMatched = false;
					_nowState += 0x00010000;
					_states[key] = _nowState;
					curState = _nowState;
				}
				else
				{ // 匹配上了, 继续匹配下一个字符 by 康露 2012-03-11
					curState = _states[key] & 0x7FFFFFFF;
				}
			}
			_states[key] |= 0x80000000;
		}

		public static function init($str : String) : void
		{
			var maskList : Array = $str.split(",");

			for each (var key : String in maskList)
			{
				var str : String = String(key);
				_maxSubStringLen = Math.max(str.length, _maxSubStringLen);
				addMaskString(str);
			}
		}

		private static function sortFunc(baA : String, baB : String) : int
		{
			var aLen : int = baA.length;
			var bLen : int = baB.length;
			if (aLen > bLen)
			{
				return 1;
			}
			if (aLen < bLen)
			{
				return -1;
			}
			return 0;
		}

		/**
		 * 替换非法字符
		 * @param strMask 源字符串
		 * @param isCheckBlankSpace 是否检查空格 LCC 2012.1.11
		 * @return 替换后的字符串
		 */
		public static function match(str : String, strMask : String, isCheckBlankSpace : Boolean = false) : String
		{
			var returnValue : String = "";
			var len : int = str.length;
			for (var index : int = 0; index < len; )
			{
				var curState : uint = 0;
				var maskIndex : int = 0;
				var subIndex : int = 0;
				var subLen : int = Math.min(len - index, _maxSubStringLen);
				var curIndex : int = index;
				var preIndex : int = index;
				for (subIndex = 0; subIndex < subLen; subIndex++)
				{
					var charCode : Number = str.charCodeAt(curIndex);
					if (isCheckBlankSpace && (charCode == 0x0020 || charCode == 0x3000)) // 空白
					{
						curIndex++;
						continue;
					}

					var key : uint = (curState | charCode) & 0x7FFFFFFF;
					if (null == _states[key])
					{ // 没有匹配上 by 康露 2012-03-11
						if (preIndex == index)
						{
							returnValue += str.charAt(index++);
						}
						break;
					}
					var newState : uint = _states[key];
					if (newState >= 0x80000000)
					{ // 匹配成功 by 康露 2012-03-11
						for (; maskIndex <= subIndex; maskIndex++)
							returnValue += strMask;
						index = curIndex + 1;
					}
					curState = newState;
					curIndex++;
				}
				if (subIndex == subLen)
				{
					returnValue += str.charAt(index++);
				}
			}
			return returnValue;
		}

		/**
		 * 检测是否含有非法字符
		 * @param srcStr 源字符串
		 * @return 是否含有非法字符
		 */
		public static function checkBadWords(srcStr : String) : Boolean
		{
			var str : String = match(srcStr, "*", true);
			return str.indexOf("*") < 0 ? false : true;
		}
	}
}


