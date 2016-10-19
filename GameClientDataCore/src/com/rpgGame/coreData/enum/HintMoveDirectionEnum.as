package com.rpgGame.coreData.enum
{

	/**
	 * 提示信息移动方式
	 * @author Mandragora
	 *
	 */
	public class HintMoveDirectionEnum
	{
		public function HintMoveDirectionEnum()
		{
		}
		/**
		 * 普通的显示方式，没有滚动或者移动效果
		 */
		public static const ENUM_NORMAL : int = 0;
		/**
		 * 从下到上
		 */
		public static const ENUM_LOW_TO_TOP : int = 1;
		/**
		 * 从上到下
		 */
		public static const ENUM_TOP_TO_LOW : int = 2;
		/**
		 *  从右移动到左
		 */
		public static const ENUM_RIGHT_TO_LEFT : int = 3;
		/**
		 *  从左移动到右
		 */
		public static const ENUM_LEFT_TO_RIGHT : int = 4;
	}
}
