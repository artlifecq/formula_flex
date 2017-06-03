package com.rpgGame.app.ui.tab
{
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;

	/**
	 *基于原始tabbar扩展的tabbar，需要切标签的统一使用这一套 
	 * @author dik
	 * 
	 */
	public class UITabBar
	{
		private var _tabBar:TabBar;
		
		/**
		 * 
		 * @param tab 要绑定的tabbar
		 * @param datas tabbar数据
		 * 
		 */
		public function UITabBar(tab:TabBar,datas:Vector.<UITabBarData>)
		{
			_tabBar=tab;
			if(!tab.dataProvider){
				tab.dataProvider=new ListCollection();
			}
			tab.dataProvider.removeAll();
			var num:int=datas.length;
			for(var i:int=0;i<num;i++){
				tab.dataProvider.addItem(datas[i]);
			}
			_tabBar.tabInitializer = onTabInitializer;
		}
		
		private function onTabInitializer(tab:ToggleButton, item:UITabBarData ):void
		{
			if(item.text){
				tab.label = item.text;
			}
			if(item.styleName){
				tab.styleName=item.styleName;
			}
		}
	}
}