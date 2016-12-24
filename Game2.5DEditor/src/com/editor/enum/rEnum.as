package com.editor.enum
{
	

	/**
	 * 此类不需要加入性能统计 
	 */	
	public class rEnum
	{
		/** 内部枚举值保存 **/
		private static var _value:int = 0;
		
		/**
		 * 枚举起点，默认以0开始
		 * @param start 起点数值
		 * @return 返回起点枚举值
		 */		
		public static function ENUM_START( start:int = 0):int
		{
			_value = start;
			return _value;
		}
		
		/**
		 * 获取下一个枚举值
		 * @return 返回下一个枚举值
		 */		
		public static function get next():int
		{
			return ++_value;
		}
	}
}