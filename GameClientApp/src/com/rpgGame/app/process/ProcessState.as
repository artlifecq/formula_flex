package com.rpgGame.app.process
{

	/**
	 *
	 * 流程状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-3 下午2:15:33
	 *
	 */
	public class ProcessState
	{
		/**
		 * 加载默认公共皮肤素材
		 */
		public static const STATE_LOAD_PUBLIC_UI_ASSETS : String = "STATE_LOAD_PUBLIC_UI_ASSETS";
		
		/**
		 * 加载默认公共皮肤素材-位图
		 */
		public static const STATE_LOAD_PNGX_UI_ASSETS : String = "STATE_LOAD_PNGX_UI_ASSETS";
		
		/**
		 * 加载字体库
		 */
		public static const STATE_LOAD_FONTS : String = "STATE_LOAD_FONTS";
		
		/**
		 * 加载配置数据
		 */
		public static const STATE_LOAD_CONFIG_DATA : String = "STATE_LOAD_CONFIG_DATA";
		/**
		 * 开始游戏
		 */
		public static const STATE_START_GAME : String = "STATE_START_GAME";

		public function ProcessState()
		{
		}
	}
}
