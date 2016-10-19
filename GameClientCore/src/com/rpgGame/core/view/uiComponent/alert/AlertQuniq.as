package com.rpgGame.core.view.uiComponent.alert
{
	/**
	 *
	 * alert id 枚举
	 * @author fly.liuyang
	 * 创建时间：2015-2-2 下午4:07:43
	 * 
	 */
	public class AlertQuniq
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