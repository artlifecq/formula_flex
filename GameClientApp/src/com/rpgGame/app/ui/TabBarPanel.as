package com.rpgGame.app.ui
{
	import com.rpgGame.app.ui.tab.FuncTabBar;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 标签面板
	 * @author dik
	 * 
	 */
	public class TabBarPanel extends SkinUIPanel
	{
		protected var _tabBar:FuncTabBar;
		protected var _tabDatas:Vector.<UITabBarData>;
		
		public function TabBarPanel(skin:StateSkin)
		{
			super(skin);
			initTabBar();
		}
		
		private function initTabBar():void
		{
			_tabDatas=new Vector.<UITabBarData>();
			initTabBarDatas();
			_tabBar=new FuncTabBar(_stateSkin["tabBar"],_tabDatas);
		}
		
		protected function initTabBarDatas():void
		{
			
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_tabBar.show(data,openTable);
		}
		
		override public function hide():void
		{
			super.hide();
			_tabBar.hide();
		}
		
		/**
		 * 添加tab数据
		 * @param tabStyle 标签按钮样式
		 * @param viewStyle 标签对应视图
		 * @param funcKey 标签对应功能键
		 * 
		 */
		protected function addTabDatas(tabStyle:Class,viewStyle:Class,funcKey:String):void
		{
			var item:UITabBarData=new UITabBarData(tabStyle,viewStyle);
			item.tabKey=funcKey;
			var fundata:Q_newfunc = NewFuncCfgData.getdataById(item.tabKey);
			if(fundata!=null&&fundata.q_show_buttonName==1)
			{
				item.text = fundata.q_string_name;
			}
			_tabDatas.push(item);
		}
	}
}