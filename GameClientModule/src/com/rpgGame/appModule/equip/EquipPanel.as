package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.ViewUI;
	
	import feathers.controls.Radio;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_Skin;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_daohang;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *装备面板
	 *@author dik
	 *2017-4-6下午3:17:27
	 */
	public class EquipPanel extends SkinUIPanel
	{
		private var _skin:Zhuangbei_Skin;
		private var _tabSkin:Zhuangbei_daohang;
		private var tabUIs:Vector.<ViewUI>;
		private var tabBtn:Vector.<Radio>;
		
		private var _currentUI:ViewUI;
		
		public function EquipPanel()
		{
			_skin=new Zhuangbei_Skin();
			super(_skin);
			initUI();
		}
		
		private function set currentUI(value:ViewUI):void
		{
			if(_currentUI){
				_currentUI.removeFromParent();
			}
			_currentUI = value;
			this.addChild(_currentUI);
			_currentUI.show();
		}

		private function initUI():void
		{
			_tabSkin=_skin.daohang.skin as Zhuangbei_daohang;
			tabBtn=new Vector.<Radio>();
			tabBtn.push(_tabSkin.btn_jineng);
			tabBtn.push(_tabSkin.btn_zuomo);
			tabBtn.push(_tabSkin.btn_xilian);
			tabBtn.push(_tabSkin.btn_jicheng);
			tabBtn.push(_tabSkin.btn_hecheng);
			
			tabUIs=new Vector.<ViewUI>();
			tabUIs.push(new EquipIntensifyUI());
			tabUIs.push(new EquipPolishUI());
			tabUIs.push(new EquipSmeltUI());
			tabUIs.push(new EquipInheritUI());
			tabUIs.push(new EquipComboUI());
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			onTouchTarget(_tabSkin.btn_jineng);
		}
		
		override public function hide():void
		{
			super.hide();
			_currentUI.hide();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target is Radio){
				var index:int=tabBtn.indexOf(target as Radio);
				if(index!=-1){
					currentUI=tabUIs[index];
				}
			}
		}
	}
}