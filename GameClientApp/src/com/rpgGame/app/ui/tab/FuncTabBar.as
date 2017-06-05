package com.rpgGame.app.ui.tab
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	
	import feathers.controls.TabBar;
	
	/**
	 *功能开启切换条 
	 * @author dik
	 * 
	 */
	public class FuncTabBar extends UITabBar
	{
		public function FuncTabBar(tab:TabBar, datas:Vector.<UITabBarData>)
		{
			super(tab, datas);
		}
		
		override public function show(data:*=null, openTable:String="0"):void
		{
			updateTabData();
			super.show(data,openTable);
		}
		
		override public function hide():void
		{
			super.hide();
		}
		
		private function updateTabData():void
		{
			if(_allDatas.length!=_tabBar.dataProvider.length){//没有全部开启
				checkOpen();
			}
		}
		
		private function checkOpen():void
		{
			var num:int=_allDatas.length;
			var item:UITabBarData;
			var funcID:int;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				funcID=int(item.tabKey);
				if(FunctionOpenManager.checkOpenBuyFunId(funcID)){//已经开启了
					setTabDataWithTabKey(item.tabKey);
				}
			}
		}
	}
}