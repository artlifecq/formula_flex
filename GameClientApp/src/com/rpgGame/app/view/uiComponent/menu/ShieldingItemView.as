package com.rpgGame.app.view.uiComponent.menu
{
	import com.rpgGame.app.manager.DisplaySetUpManager;
	import com.rpgGame.app.manager.GameSettingManager;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangShieldingMenu;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.map.ShieldingitemSkin;
	
	import starling.display.DisplayObject;
	
	public class ShieldingItemView extends SkinUI
	{
		private var _skin:ShieldingitemSkin;
		private var _type:String;
		public function ShieldingItemView()
		{
			_skin=new ShieldingitemSkin();
			super(_skin);
		}
		
		public function setData(type:String):void
		{
			_type=type;
			_skin.labelDisplay.text=LanguageConfig.getText(type);
			_skin.btn_shield.isSelected=GameSettingManager.getBtnStateByType(_type);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent( MenuEvent.SAKEYBLOCK, onSetBtnState );
			EventManager.addEvent(MenuEvent.CANCEL_LOCK,setBtnFalse);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			if(target==_skin.btn_shield){
				//				EventManager.dispatchEvent( MenuEvent.SHIELDMENU_CLICK, _type );
				GameSettingManager.setState(_type,_skin.btn_shield.isSelected);
			}
		}
		
		private function setBtnFalse():void
		{
			if(_type==LangShieldingMenu.SYSTEMSET_AKEY_BLOCK){
				_skin.btn_shield.isSelected=false;
			}
		}
		
		private function onSetBtnState(bool:Boolean):void
		{
			_skin.btn_shield.isSelected=bool;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent( MenuEvent.SAKEYBLOCK, onSetBtnState );
			EventManager.removeEvent(MenuEvent.CANCEL_LOCK,setBtnFalse);
		}
	}
}