package com.rpgGame.coreData.enum
{
	/**
	 * 提示信息显示方式 
	 * @author Mandragora
	 * 
	 */	 
	public class HintTypeEnum
	{
		public function HintTypeEnum()
		{
		}
		/**
		 * 普通的显示方式，没有滚动或者移动效果 
		 */		
		public static const ENUM_NORMAL : int = 0;
		/**
		 *  从左移动到右
		 */		
		public static const ENUM_LEFT_TO_RIGHT : int = 1;
		/**
		 *  从右移动到左
		 */		
		public static const ENUM_RIGHT_TO_LEFT : int = 2;
		/**
		 * 从下到上 
		 */		
		public static const ENUM_LOW_TO_TOP : int = 3;
		/**
		 * 从上到下 
		 */		
		public static const ENUM_TOP_TO_LOW : int = 4;
	}
}