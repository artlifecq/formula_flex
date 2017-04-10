package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 *装备面板
	 *@author dik
	 *2017-4-6下午3:17:27
	 */
	public class EquipPanel extends SkinUIPanel
	{
		private var _skin:Zhuangbei_Skin;
		
		private var intensifyUI:EquipIntensifyUI;
		
		private var _currentUI:SkinUI;
		
		public function EquipPanel()
		{
			_skin=new Zhuangbei_Skin();
			super(_skin);
			initUI();
		}
		
		private function set currentUI(value:SkinUI):void
		{
			if(_currentUI){
				_currentUI.removeFromParent();
			}
			_currentUI = value;
			this.addChild(_currentUI);
			_currentUI.refresh();
		}

		private function initUI():void
		{
			intensifyUI=new EquipIntensifyUI();
			currentUI=intensifyUI;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			intensifyUI.show();
		}
	}
}