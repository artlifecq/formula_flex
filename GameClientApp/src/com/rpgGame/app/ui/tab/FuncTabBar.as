package com.rpgGame.app.ui.tab
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.events.FunctionOpenEvent;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import feathers.controls.TabBar;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *功能开启切换条 
	 * @author dik
	 * 
	 */
	public class FuncTabBar extends UITabBar
	{
		private var _checkToTabHandler:Function;	
		private var _checkOpenHandler:Function;
		public function FuncTabBar(tab:TabBar, datas:Vector.<UITabBarData>,crosswise:Boolean=true)
		{
			super(tab, datas,crosswise);
		}
		
		override public function show(data:*=null, openTable:int=0):void
		{
			updateTabData();
			super.show(data,openTable);
			EventManager.addEvent(FunctionOpenEvent.FUNCTIONOPENID,onOpenFunc);
		}
		
		override protected function isCanToTab(key:int):Boolean
		{
			var index:int=getTabDataIndexByTabKey(key);
			if(index>=0)
			{
				var item:UITabBarData = _allDatas[index];
				if(item){
					var checkResult:Boolean;
					if(_checkToTabHandler){
						checkResult=_checkToTabHandler(item.tabKey);
					}else{
						checkResult=FunctionOpenManager.functionIsOpen(item.tabKey);//默认新功能
					}
					if(checkResult){//能切过去
						return true;
					}else if(!_checkToTabHandler){
						var q_data:Q_newfunc=NewFuncCfgData.getFuncCfg(item.tabKey);
						NoticeManager.showNotifyById(90203,null,q_data.q_name,q_data.q_level);
						return false;
					}
				}
			}
			return false;
		}
		
		private function onOpenFunc(ids:Vector.<int>):void
		{
			var num2:int=ids.length;
			var tabKey:int;
			var bool:Boolean = false;
			for(var i:int=0;i<num2;i++){
				tabKey=ids[i];
				if(isHoldFunc(tabKey)){
					if(FunctionOpenManager.functionIsOpen(ids[i])){//已经开启了
						addTabDataWithTabKey(tabKey);
						bool = true;
					}else{
						removeTabDataWithTabKey(tabKey);
						bool = true;
					}
				}
			}
			if(bool)
				this.updata();
		}
		
		private function isHoldFunc(tabKey:int):Boolean
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
			if(_allDatas.length!=_tabBar.numChildren){//没有全部开启
				checkOpen();
			}
		}
		
		private function checkOpen():void
		{
			var num:int=_allDatas.length;
			var item:UITabBarData;
			for(var i:int=0;i<num;i++){
				item=_allDatas[i];
				if(!_checkOpenHandler){
					_checkOpenHandler=defaultCheckOpen;
				}
				if(_checkOpenHandler(item)){//已经开启了或者不需要开启
					addTabDataWithTabKey(item.tabKey);
				}else{
					removeTabDataWithTabKey(item.tabKey);
				}
			}
			if(!_needRefash)
				return ;
			this.updata();
//			this.switchTabKey(this._currentKey);
		}
		
		private function defaultCheckOpen(item:UITabBarData):Boolean
		{
			return (item.openShow&&FunctionOpenManager.functionIsOpen(item.tabKey))||!item.openShow;
		}
		
		public function set checkOpenHandler(value:Function):void
		{
			_checkOpenHandler=value;
		}

		public function set checkToTabHandler(value:Function):void
		{
			_checkToTabHandler = value;
		}

	}
}