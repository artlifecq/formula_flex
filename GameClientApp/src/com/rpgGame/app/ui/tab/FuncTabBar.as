package com.rpgGame.app.ui.tab
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.core.events.FunctionOpenEvent;
	
	import feathers.controls.TabBar;
	
	import org.client.mainCore.manager.EventManager;
	
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
			EventManager.addEvent(FunctionOpenEvent.FUNCTIONOPENID,onOpenFunc);
		}
		
		private function onOpenFunc(ids:Vector.<int>):void
		{
			var num2:int=ids.length;
			var tabKey:String;
			for(var i:int=0;i<num2;i++){
				tabKey=ids[i].toString();
				if(isHoldFunc(tabKey)){
					if(FunctionOpenManager.functionIsOpen(ids[i])){//已经开启了
						setTabDataWithTabKey(tabKey);
					}
				}
			}
		}
		
		private function isHoldFunc(tabKey:String):Boolean
		{
			var num:int=_allDatas.length;
			var item:UITabBarData;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				if(item.tabKey==tabKey){
					return true;
				}
			}
			return false;
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(FunctionOpenEvent.FUNCTIONOPENID,onOpenFunc);
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
				if(FunctionOpenManager.functionIsOpen(funcID)){//已经开启了
					setTabDataWithTabKey(item.tabKey);
				}
			}
		}
	}
}