package com.rpgGame.app.ui.tab
{
	import flash.events.Event;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *基于原始tabbar扩展的tabbar，需要切标签的统一使用这一套 
	 * @author dik
	 * 
	 */
	public class UITabBar
	{
		protected var _tabBar:TabBar;
		private var _container:DisplayObjectContainer;
		private var _currentView:ViewUI;
		private var _tabViewMap:HashMap;
		protected var _data:*;
		protected var _allDatas:Vector.<UITabBarData>;//所有的tab数据
		
		/**
		 * 
		 * @param tab 要绑定的tabbar
		 * @param datas tabbar数据
		 * 
		 */
		public function UITabBar(tab:TabBar,datas:Vector.<UITabBarData>)
		{
			_tabBar=tab;
			tab.touchable=true;
			tab.touchGroup=false;
			_container=_tabBar.parent;
			_tabViewMap=new HashMap();
			_allDatas=datas;
			if(!tab.dataProvider){
				tab.dataProvider=new ListCollection();
			}else{
				tab.dataProvider.removeAll();
			}
			_tabBar.tabInitializer = onTabInitializer;
		}
		
		private function onTabInitializer(tab:ToggleButton, item:UITabBarData ):void
		{
			if(item.text){
				tab.label = item.text;
			}
			if(item.tabStyle){
				tab.styleClass=item.tabStyle;
			}
		}
		
		public function show(data:*=null, openTable:String="0"):void
		{
			if(openTable.length==0){//没给就给个默认的
				openTable=_allDatas[0].tabKey;
			}
			_tabBar.addEventListener(Event.CHANGE,selectChangeHandler);
			this._data=data;
			_tabBar.selectedIndex=setTabDataWithTabKey(openTable);
			selectChangeHandler();
		}
		
		/**
		 *根据tabKey设置数据 
		 * @param key
		 * 
		 */
		protected function setTabDataWithTabKey(key:String):int
		{
			var num:int=_tabBar.dataProvider.length;
			var i:int=0;
			var item:UITabBarData;
			for(i=0;i<num;i++){
				item=_tabBar.dataProvider.getItemAt(i) as UITabBarData;
				if(item.tabKey==key){//已经在数据组里面了
					return i;
				}
			}
			
			num=_allDatas.length;
			for(i=0;i<num;i++){
				item=_allDatas[i];
				if(item.tabKey==key){
					_tabBar.dataProvider.addItemAt(item,i);
					return i;
				}
			}
			return -1;
		}
		
		private function selectChangeHandler():void
		{
			var index:int=_tabBar.selectedIndex;
			var item:UITabBarData=_tabBar.selectedItem as UITabBarData;
			if(_currentView){
				_currentView.removeFromParent();
			}
			if(!item){
				return;
			}
			var view:ViewUI=_tabViewMap.getValue(item.viewStyle);
			if(!view){
				var cls:Class=item.viewStyle;
				view=new cls();
				_tabViewMap.add(item.viewStyle,view);
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