package com.rpgGame.app.ui
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	
	import starling.events.Event;

	public class UITableGroup
	{
		private var _tabBar:TabBar;
		private var _skinui:SkinnableContainer;
		private var _grouList:Vector.<SkinUIModePanel>;
		private var _currentmodepanle:SkinUIModePanel;
		public function UITableGroup(tab:TabBar,skinui:SkinnableContainer):void
		{
			_tabBar = tab;
			_skinui = skinui;
			_tabBar.dataProvider = new ListCollection();
			_grouList = new Vector.<SkinUIModePanel>();
			_tabBar.tabInitializer = defaultTabInitializer;
			_tabBar.addEventListener(Event.CHANGE,selectChangeHandler);
		}
		protected function defaultTabInitializer(tab:ToggleButton, item:SkinUIModePanel):void
		{
			tab.label = item.buttonLabel;
		}
		private function selectChangeHandler():void
		{
//			trace(_tabBar.selectedIndex);
			if(_tabBar.selectedItem==null)
				return ;
			_currentmodepanle = _tabBar.selectedItem as SkinUIModePanel;
			if(_currentmodepanle!=null)
			{
				_currentmodepanle.refashSkin(_skinui);
				_currentmodepanle.showView();
			}
		}
		public function addModePane(mode:SkinUIModePanel):void
		{
			if(_grouList.indexOf(mode)<0)
			{
				_grouList.push(mode);
			}
		}
		
		public function refeash(index:int):void
		{
			_tabBar.dataProvider.removeAll();
			for each(var mode:SkinUIModePanel in _grouList)
			{
				if(mode.isOpen)
					_tabBar.dataProvider.push(mode);
			}
			_tabBar.selectedIndex = index;
		}
		
		public function changeCurrentValue():void
		{
			
		}
		
		public function get crrentModePanle():SkinUIModePanel
		{
			return _currentmodepanle;
		}
		
	}
}