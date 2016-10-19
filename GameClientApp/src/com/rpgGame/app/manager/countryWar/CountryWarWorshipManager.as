package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.ui.main.activityBar.CountryWarWorshipIcon;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * 国战参拜管理
	 * GuoDong.Zhang
	 * 2016-8-29
	 */
	public class CountryWarWorshipManager
	{
		public static var endTime:Number = 0;
		private static var _icon:CountryWarWorshipIcon;
		
		public static function showIcon():void
		{
			if(_icon == null)
			{
				_icon = new CountryWarWorshipIcon();
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