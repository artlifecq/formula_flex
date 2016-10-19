package com.rpgGame.app.ui.menu
{
	public class MenuItem
	{
		public var title:String = null;
		public var callBackFun:Function = null;
		public var index:int;
		public var icon:String;
		
		/**
		 * @param titleStr 菜单项显示的文字，  
		 * @param func		菜单项文字被点击时的回调函数
		 * 
		 */		
		public function MenuItem($index:int,titleStr:String,$icon:String, func:Function)
		{
			title = titleStr;
			callBackFun = func;
			index = $index;
			icon = $icon;
		}
	}
}