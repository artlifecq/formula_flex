package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.manager.countryWar.CountryWarPrepareManager;
	import com.rpgGame.app.manager.countryWar.CountryWarManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	
	import org.client.mainCore.utils.Tick;
	import org.mokylin.skin.app.countryWar.CountryWarForeShowIconSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 * 国战预告图标
	 * GuoDong.Zhang
	 * 2016-7-18
	 */
	public class CountryWarIcon extends SkinUI
	{
		private var _customSkin:CountryWarForeShowIconSkin;
		
		public function CountryWarIcon()
		{
			_customSkin = new CountryWarForeShowIconSkin();
			super(_customSkin);
		}
		
		public function onShow():void
		{
			Tick.addCallback(tick);
			tick();
			_customSkin.lbDesc.visible = false;
			_customSkin.lbDesc.text = "国战即将开启";
			TipTargetManager.show(this,TargetTipsMaker.makeSimpleTextTips("国战即将开启"));
		}
		
		public function onHide():void
		{
			Tick.removeCallback(tick);
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
		
		private function tick(...args):void
		{
			var selfCountryWarInfo:CountryWarInfoData = CountryWarManager.getSelfCountryWarInfo();
			if(selfCountryWarInfo)
			{
				if(!_customSkin.lbDesc.visible)
				{
					_customSkin.lbDesc.visible = true;	
				}
				var remainStarTime:Number = selfCountryWarInfo.warStartTime - SystemTimeManager.curtTm;
				if(remainStarTime > 0)
				{
					_customSkin.lbDesc.text = TimeUtil.formatTimeToTimeString(remainStarTime/1000) + "后开始";
				}
				else if(_customSkin.lbDesc.text != "")
				{
					_customSkin.lbDesc.text = "";
					TipTargetManager.show(this,TargetTipsMaker.makeSimpleTextTips("国战正在进行"));
				}
			}
			else
			{
				CountryWarPrepareManager.hideCountryWarIcon();
			}
		}
	}
}