package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import flash.events.MouseEvent;
	
	import org.mokylin.skin.app.systemSet.systemSet_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	
	public class SystemsetingPanel extends SkinUIPanel
	{
		protected var _skin : systemSet_Skin;
		private var _viewList:Vector.<BasePaneView>;
		public function SystemsetingPanel()
		{
			this._skin = new systemSet_Skin();
			super(_skin);
			
			initView();
		}
		private function initView():void
		{
			_viewList = new Vector.<BasePaneView>();
			_viewList.push(new HookSetingView(this._skin.guaji));
			_viewList.push(new SystemSetView(this._skin.xitong));
			_viewList.push(new HideSetView(this._skin.pingbi));
			_viewList.push(new BasePaneView(this._skin.kuaijie));
			closeAll();
		}
		
		private function closeAll():void
		{
			for(var i:int= _viewList.length-1;i>=0;i--)
				_viewList[i].visible = false;
		}
		
		override public function show(data : * = null, openTable : String = "", parentContiner : DisplayObjectContainer = null) : void
		{
			super.show(data,openTable,parentContiner);
			initEvent();
			_skin.tab_set.selectedIndex = 0;
			onTab(null);
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			
			switch (target) {
				case _viewList[0]._skin.btn_start:
					startClick();
					break;
			}
			
		}
		
		
		private function initEvent():void
		{
			_skin.tab_set.addEventListener(Event.CHANGE, onTab);
		}
		private function onTab(e:Event):void
		{
			closeAll();
			var index:int = this._skin.tab_set.selectedIndex;
			_viewList[index].visible = true;
		}
		private function startClick():void
		{
			if (!TrusteeshipManager.getInstance().isAutoFightRunning)
			{
				TrusteeshipManager.getInstance().startAutoFight();
			}
			hide();
		}
		
		override protected function onHide() : void
		{
			SystemSetManager.getinstance().saveData();
			super.onHide();
			
		}
	}
}