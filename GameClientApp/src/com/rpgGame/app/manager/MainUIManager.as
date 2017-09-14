package com.rpgGame.app.manager
{


	import com.rpgGame.app.ui.main.MainGUI;
	
	import flash.geom.Point;

	/**
	 * 主界面管理
	 * 现在有以下几项
	 * 1角色头像、怪物头像
	 * 2小地图、顶部活动条
	 * 3快捷栏
	 * 4任务面板
	 * @author 卢国征
	 *
	 */
	public class MainUIManager
	{
		private static var _mainGUI : MainGUI;

		public function MainUIManager()
		{
		}

		public static function get mainui() : MainGUI
		{
			if (_mainGUI == null)
			{
				_mainGUI = new MainGUI();
			}
			return _mainGUI;
		}

		/**
		 * 显示主界面
		 * @author 卢国征  2015-4-28
		 */
		public static function showMainUI() : void
		{
			mainui.show();
		}

		/**
		 * 隐藏主界面
		 * @author 卢国征  2015-4-28
		 */
		public static function hideMainUI() : void
		{
			mainui.hide();
		}
		public static function setMainUIVisible(bool:Boolean):void
		{
			mainui.visible=bool;
		}
		/**
		 * 显示与隐藏主界面
		 * @author 卢国征  2015-4-28
		 *
		 */
		public static function showOrHide() : void
		{
			if (_mainGUI == null)
				return;

			if (mainui.parent)
				hideMainUI();
			else
				showMainUI();
		}

		public static function getBtnGolbalPos(btnName : String) : Point
		{
			return _mainGUI.getBtnGlobalPos(btnName);
		}

		public static function showTaskBar() : void
		{
			//mainui.showTaskBar();
		}

		public static function hideTaskBar() : void
		{
			//mainui.hideTaskBar();
		}
	}
}
