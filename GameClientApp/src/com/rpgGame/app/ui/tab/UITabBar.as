package com.rpgGame.app.ui.tab
{
	import com.rpgGame.core.ui.SkinUI;
	
	import flash.events.Event;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *基于原始tabbar扩展的tabbar，需要切标签的统一使用这一套 
	 * @author dik
	 * 
	 */
	public class UITabBar
	{
		private var _tabBar:TabBar;
		private var _container:DisplayObjectContainer;
		private var _currentView:ViewUI;
		private var _tabViewMap:HashMap;
		private var _data:*;
		private var _allDatas:Vector.<UITabBarData>;
		
		/**
		 * 
		 * @param tab 要绑定的tabbar
		 * @param datas tabbar数据
		 * 
		 */
		public function UITabBar(tab:TabBar,datas:Vector.<UITabBarData>)
		{
			_tabBar=tab;
			_allDatas=datas;
			_container=_tabBar.parent;
			_tabViewMap=new HashMap();
			if(!tab.dataProvider){
				tab.dataProvider=new ListCollection();
			}
			tab.dataProvider.removeAll();
			var num:int=datas.length;
			for(var i:int=0;i<num;i++){
				tab.dataProvider.addItem(datas[i]);
			}
			_tabBar.tabInitializer = onTabInitializer;
			_tabBar.addEventListener(FeathersEventType.INITIALIZE,onInitialize);
		}
		
		private function onInitialize():void
		{
			_tabBar.removeEventListener(FeathersEventType.INITIALIZE,onInitialize);
			_tabBar.selectedIndex=0;
			selectChangeHandler();
		}
		
		private function onTabInitializer(tab:ToggleButton, item:UITabBarData ):void
		{
			if(item.text){
				tab.label = item.text;
			}
			if(item.tabClass){
				tab.styleClass=item.tabClass;
			}
		}
		
		public function show(data:*=null, openTable:String="0"):void
		{
			_tabBar.addEventListener(Event.CHANGE,selectChangeHandler);
			this._data=data;
			_tabBar.selectedIndex=getTabIndex(openTable);
			selectChangeHandler();
		}
		
		private function getTabIndex(key:String):int
		{
			var num:int=_tabBar.dataProvider.length;
			var item:UITabBarData;
			for(var i:int=0;i<num;i++){
				item=_tabBar.dataProvider.getItemAt(i) as UITabBarData;
				if(item.tabKey==key){
					return i;
				}
			}
			return 0;
		}
		
		private function selectChangeHandler():void
		{
			var index:int=_tabBar.selectedIndex;
			var item:UITabBarData=_tabBar.selectedItem as UITabBarData;
			if(_currentView){
				_currentView.removeFromParent();
			}
			var view:ViewUI=_tabViewMap.getValue(item.viewClass);
			var cls:Class=item.viewClass;
			if(!view){
				view=new cls();
				_tabViewMap.add(item.viewClass,view);
			}
			_currentView=view;
			_container.addChild(_currentView);
			_currentView.show(_data);
		}
		
		public function hide():void
		{
			_tabBar.removeEventListener(Event.CHANGE,selectChangeHandler);
			if(_currentView){
				_currentView.hide();
			}
		}
	}
}