package com.rpgGame.app.ui.tab
{
	import feathers.controls.ToggleButton;
	
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
		public var tabKey:int;
		
		
		public var button:ToggleButton;
		/**
		 *开启才展示按钮 
		 */
		public var openShow:Boolean;
		/**
		 *是否显示 
		 */
		internal var isShow:Boolean;
		/**
		 * X
		 * */
		public var initX:int;
		/**
		 * Y
		 * */
		public var initY:int;
		public function UITabBarData(tabStyle:Class,viewStyle:Class,openShow:Boolean,x:int=0,y:int=0,stylename:String="")
		{
			this.tabStyle=tabStyle;
			this.viewStyle=viewStyle;
			this.openShow=openShow;
			this.initX=x;
			this.initY=y;
			this.text=stylename;
		}
	}
}