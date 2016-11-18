package com.rpgGame.coreData.type
{

	/**
	 *
	 * 角色UI显示类型
	 * @author L.L.M.Sunny
	 * 创建时间：2016-09-14 下午3:05:12
	 *
	 */
	public class RoleUIShowType
	{
		/**默认，可选中、显示血条*/
		public static const NORMAL : int = 0;
		/**不可选中，显示血条*/
		public static const UNSELECT_SHOW_BAR : int = 1;
		/**不可选中，不显示血条*/
		public static const UNSELECT_UNSHOW_BAR : int = 2;

		public function RoleUIShowType()
		{
		}
	}
}
