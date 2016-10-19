package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.main.activityBar.CountryWarForeShowIcon;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * 国战预告图标管理
	 * GuoDong.Zhang
	 * 2016-7-18
	 */
	public class CountryWarForeShowManager
	{
		private static var _icon:CountryWarForeShowIcon;
		
		public static function setup():void
		{
			//国战预告结束时间点
			var foreShowEndTime:Number = SystemTimeManager.startServiceTm + CountryWarCfgData.startWarDurationWhenServerStart;
			var remainForeShowTime:Number = foreShowEndTime - SystemTimeManager.curtTm;
			if(remainForeShowTime > 0)
			{
				showIcon();
			}
		}
		
		/**
		 * 国战预告图标
		 * 此方法为临时代码，以后会添加到活动图标集功能中
		 */
		public static function showIcon():void
		{
			if(_icon == null)
			{
				_icon = new CountryWarForeShowIcon();
			}
			StarlingLayerManager.mainUILayer.addChild(_icon);
			_icon.onShow();
			Starling.current.nativeStage.addEventListener(Event.RESIZE, onStageResize);
			onStageResize();
		}
		
		public static function hideIcon():void
		{
			if(_icon != null && _icon.parent)
			{
				Starling.current.nativeStage.removeEventListener(Event.RESIZE, onStageResize);
				_icon.removeFromParent();
				_icon.onHide();
			}
		}
		
		private static function onStageResize(e : * = null) : void
		{
			var stageWidth:int = Starling.current.nativeStage.stageWidth;
			var stageHeight:int = Starling.current.nativeStage.stageHeight;
			_icon.x = stageWidth - 455;
			_icon.y = 65;
		}
	}
}