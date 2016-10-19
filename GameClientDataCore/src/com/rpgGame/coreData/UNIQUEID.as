package com.rpgGame.coreData
{
	/**
	 * 这个是专门给事件做的，为了防止事件ID一样
	 * @author 
	 * 
	 */	
	public class UNIQUEID
	{
		/** 内部枚举值保存 **/
		private static var _value:int = 0;
		
		/**
		 * 获取下一个枚举值
		 * @return 返回下一个枚举值
		 */		
		public static function get NEXT():int
		{
			return ++_value;
		}
	}
}