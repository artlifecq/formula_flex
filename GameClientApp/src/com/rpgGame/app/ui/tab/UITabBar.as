package com.rpgGame.app.ui.tab
{
	import flash.events.Event;
	
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.core.ToggleGroup;
	
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
		protected var _currentKey:int;
		protected var _currentIndex:int=-1;
		protected var _needRefash:Boolean = true;
		protected var _touchGroup:ToggleGroup;
		protected var _gap:int = 0;
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
			_gap = tab.gap;
			init();
		}
		private function init():void
		{
			_tabBar.touchable=true;
			_tabBar.touchGroup=false;
			_container=_tabBar.parent;
			_tabViewMap=new HashMap();
			if(_tabBar.dataProvider != null){
				_tabBar.dataProvider.removeAll();
			}
			_touchGroup = new ToggleGroup();
			var length:int = _allDatas.length;
			var button:ToggleButton;
			var item:UITabBarData;
			for(var i:int = 0;i<length;i++)
			{
				item = _allDatas[i];
				button = new ToggleButton();
				button.toggleGroup = _touchGroup;
				if(item.text){
					button.label = item.text;
				}
				if(item.tabStyle){
					button.styleClass=item.tabStyle;
				}
				item.button = button;
			}
		}
		/*private function onTabInitializer(tab:ToggleButton, item:UITabBarData ):void
		{
			if(item.text){
				tab.label = item.text;
			}
			if(item.tabStyle){
				tab.styleClass=item.tabStyle;
			}
		}*/
		
		public function show(data:*=null, openTable:int=0):void
		{
			if(openTable==0){//没给就给个默认的
				openTable=_allDatas[0].tabKey;
			}
			_touchGroup.addEventListener(Event.CHANGE,selectChangeHandler);
			this._data=data;
			switchTabKey(openTable);
		}
		
		/**
		 *根据tabKey设置数据 
		 * @param key
		 * 
		 */
		protected function getTabDataIndexByTabKey(key:int):int
		{
			var num:int=_allDatas.length;
			var i:int=0;
			for(i=0;i<num;i++){
				if(_allDatas[i].tabKey==key){//已经在数据组里面了
					return i;
				}
			}
			return -1;
		}
		
		
		public function getTabDataByTabKey(key:int):UITabBarData
		{
			var num:int=_allDatas.length;
			var i:int=0;
			for(i=0;i<num;i++)
			{
				if(_allDatas[i].tabKey==key)
				{//已经在数据组里面了
					return _allDatas[i];
				}
			}
			return null;
		}
			
		
		protected function getTabkeyByIndex(index:int):int
		{
			var num:int=_allDatas.length;
			var i:int=0;
			for(i=0;i<num;i++){
				if(_allDatas[i].isShow){//已经在数据组里面了
					index--;
					if(index<0)
						return _allDatas[i].tabKey;
				}
			}
			return 0;
		}
		
		public function switchTabKey(key:int):void
		{
			var index:int = getTabDataIndexByTabKey(key);
			if(index>=0)
			{
				var item:UITabBarData = _allDatas[index];
				if(item==null||!item.isShow)
					index = -1;
			}
			if(index<0)
			{
				var length:int = _allDatas.length;
				for(var i:int = 0;i<length;i++)
				{
					if(_allDatas[i].isShow)
					{
						index = i;
						key = _allDatas[i].tabKey;
						break;
					}
				}
			}
			if(_currentView!=null&&_currentKey == key && _currentIndex == index)
			{
				_currentView.show(_data);
				return ;
			}
			_currentKey = key;
			_currentIndex = index;
			_touchGroup.selectedIndex=index;
			selectChangeHandler();
		}
		
		public function addTabDataWithTabKey(key:int):void
		{
			var num:int=_allDatas.length;
			var item:UITabBarData;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				if(item.tabKey==key){
					if(!item.isShow)
					{
						item.isShow = true;
						_needRefash = true;
					}
					break;
				}
			}
		}
		
		public function removeTabDataWithTabKey(key:int):void
		{
			var num:int=_allDatas.length;
			var item:UITabBarData;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				if(item.tabKey==key){
					if(item.isShow)
					{
						item.isShow = false;
						_needRefash = true;
					}
					break;
				}
			}
		}
		
		public function updata():void
		{
			if(!_needRefash)
				return ;
			_needRefash = false;
			var num:int=_allDatas.length;
			var item:UITabBarData;
			_tabBar.removeChildren();
			var startX:Number = 0;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				if(item.isShow)
				{
					_tabBar.addChild(item.button);
					item.button.validate();
					item.button.x = startX;
					startX += item.button.width+_gap;
				}
			}
		}
		private function selectChangeHandler():void
		{
			var index:int=_touchGroup.selectedIndex;
			if(index<0)
				return ;
			var item:UITabBarData=_allDatas[index];
			if(_currentView){
				_currentView.removeFromParent();
			}
			if(!item){
				return;
			}
			_currentKey = item.tabKey;
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