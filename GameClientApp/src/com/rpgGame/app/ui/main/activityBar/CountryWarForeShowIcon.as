package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.countryWar.CountryWarForeShowIconSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 * 国战预告图标
	 * GuoDong.Zhang
	 * 2016-7-18
	 */
	public class CountryWarForeShowIcon extends SkinUI
	{
		private var _customSkin:CountryWarForeShowIconSkin;
		
		public function CountryWarForeShowIcon()
		{
			_customSkin = new CountryWarForeShowIconSkin();
			super(_customSkin);
			_customSkin.lbDesc.text = "国战";
		}
		
		public function onShow():void
		{
			TipTargetManager.show(this,TargetTipsMaker.makeSimpleTextTips("国战即将开启"));
		}
		
		public function onHide():void
		{
			TipTargetManager.remove(this);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _customSkin.icon:
					
					break;
			}
		}
		
	}
}