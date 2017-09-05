package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.systemSet.systemSet_Skin;
	
	import starling.display.DisplayObject;
	
	
	public class SystemsetingPanel extends SkinUIPanel
	{
		protected var _skin : systemSet_Skin;
		private var _subguajiSetPanel:HookSetingView;
		private var _huamianSetPanel:SystemSetView;
		private var _kuaijieSetPanel:ShortcutsSetView;
		
		private var _curSub:SkinUI;
		
		public function SystemsetingPanel()
		{
			this._skin = new systemSet_Skin();
			super(_skin);
			MCUtil.removeSelf(_skin.guaji);
			MCUtil.removeSelf(_skin.pingbi);
			MCUtil.removeSelf(_skin.kuaijie);
			MCUtil.removeSelf(_skin.xitong);
			_skin.tab_set.touchGroup=false;
			_skin.tab_set.touchable=true;
			initEvent();
		}
		
		private function initEvent():void
		{
			_skin.tab_set.addEventListener(Event.CHANGE, onTab);
		}
		
		private function onTab(e:Event):void
		{
			var index:int = this._skin.tab_set.selectedIndex;
			var sub:SkinUI;
			switch(index)
			{
				case 0:
					sub=subguajiSetPanel;
					break;
				case 1:
					sub=huamianSetPanel;
					break;
				case 2:
					sub=kuaijieSetPanel;
					break;
			}
			if (sub==null||sub==_curSub) 
			{
				return;
			}
			if (_curSub) 
			{
				MCUtil.removeSelf(_curSub as DisplayObject);
			}
			_curSub=sub;
			(_curSub as DisplayObject).x=16;
			(_curSub as DisplayObject).y=81;
			this.addChild(_curSub);			
		}
		
		/** 挂机设置 */
		public function get subguajiSetPanel():HookSetingView
		{
			if(_subguajiSetPanel == null)
				_subguajiSetPanel =new HookSetingView();
			return _subguajiSetPanel;
		}
		
		/** 画面设置 */
		public function get huamianSetPanel():SystemSetView
		{
			if(_huamianSetPanel == null)
				_huamianSetPanel =new SystemSetView();
			return _huamianSetPanel;
		}
		
		/**快捷设置 */
		public function get kuaijieSetPanel():ShortcutsSetView
		{
			if(_kuaijieSetPanel == null)
				_kuaijieSetPanel = new ShortcutsSetView();
			return _kuaijieSetPanel;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			if (_curSub==null) 
			{
				onTab(null);
			}
		}
		
		override protected function onHide() : void
		{
			super.onHide();		
		}
	}
}