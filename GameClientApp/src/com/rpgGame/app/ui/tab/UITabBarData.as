package com.rpgGame.app.ui.tab
{
	/**
	 *自定义tabbar数据信息 
	 * @author dik
	 * 
	 */
	public class UITabBarData
	{
		/**
		 *文本内容 
		 */
		public var text:String;
		/**
		 *按钮皮肤 
		 */
		public var tabStyle:Class;
		/**
		 *标签皮肤 
		 */
		public var viewStyle:Class;
		/**
		 *标签键
		 */
		public var tabKey:String;
		
		
		public function UITabBarData(tabStyle:Class,viewStyle:Class)
		{
			this.tabStyle=tabStyle;
			this.viewStyle=viewStyle;
		}
	}
}