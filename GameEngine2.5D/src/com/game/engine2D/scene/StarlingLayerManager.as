package com.game.engine2D.scene
{
	import com.game.engine3D.core.StarlingLayer;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	import away3d.loaders.parsers.Parsers;
	
	import starling.display.Sprite;
	import starling.display.Stage;

	/**
	 * starlingUI层级初始化 
	 * @author guoqing.wen
	 * 
	 */
	public class StarlingLayerManager
	{

		public static function get mapUILevel():Sprite
		{
			return _mapUILevel;
		}

		static private var _setupComplete:Function;
		static private var _stage:flash.display.Stage;
		static private var _starlingStage:starling.display.Stage;
		static private var _starlingLayer:StarlingLayer;
		static private var _alertLevel:Sprite;
		static private var _topLevel:Sprite;
		static private var _mapUILevel:Sprite;
		static private var _uiLevel:Sprite;
		static private var _loginLevel:Sprite;
		static private var _gameLevel:Sprite;
		public function StarlingLayerManager()
		{
		}
		
		public static function setup(stage : flash.display.Stage, 
									 viewContainer : DisplayObjectContainer, 
									 setupComplete : Function, 
									 viewCount : int = 1, 
									 starlingLayerCount : int = 0, 
									 onStarlingEventCapture : Function = null, 
									 useScreenView : Boolean = true) : void
		{
			_stage = stage;
			_setupComplete = setupComplete;
			Stage3DLayerManager.setup(
				stage, stage, 
				stage3DLayerSetupComplete, viewCount, 
				starlingLayerCount,onStarlingEventCapture,
				useScreenView
			);
		}
		
		static private function stage3DLayerSetupComplete():void
		{
			Parsers.enableAllBundled();
			Stage3DLayerManager.screenAntiAlias = 0;
			Stage3DLayerManager.viewAntiAlias = 0;
			Stage3DLayerManager.startRender();
			_starlingStage = Stage3DLayerManager.starlingLayer.stage;
			_starlingLayer = Stage3DLayerManager.starlingLayer;
			_alertLevel = _starlingLayer.setLayer("alert", 5);
			_topLevel = _starlingLayer.setLayer("topLevel", 4);
			_uiLevel = _starlingLayer.setLayer("uiLevel", 3);
			_mapUILevel = _starlingLayer.setLayer("mapUILevel", 2);
			_loginLevel = _starlingLayer.setLayer("login", 1);
			_gameLevel = _starlingLayer.setLayer("gameLevel", 0);
			
			if (_setupComplete!=null)_setupComplete();
		}

		public static function openMouseEvent():void
		{
			_alertLevel.touchable = _uiLevel.touchable = _mapUILevel.touchable = _loginLevel.touchable = _gameLevel.touchable = true;
			_topLevel.touchable = true;
		}

		public static function closeMouseEvent(isTop:Boolean,isTools:Boolean):void
		{
			_alertLevel.touchable = _uiLevel.touchable = _mapUILevel.touchable = _loginLevel.touchable = _gameLevel.touchable = false;
			_topLevel.touchable = isTop;
		}

		public static function get stage():flash.display.Stage
		{
			return _stage;
		}

		public static function get alertLevel():Sprite
		{
			return _alertLevel;
		}

		public static function get topLevel():Sprite
		{
			return _topLevel;
		}

		public static function get uiLevel():Sprite
		{
			return _uiLevel;
		}

		public static function get loginLevel():Sprite
		{
			return _loginLevel;
		}

		public static function get gameLevel():Sprite
		{
			return _gameLevel;
		}

		public static function get starlingStage():starling.display.Stage
		{
			return _starlingStage;
		}

		public static function get stageWidth():Number
		{
			return _stage.stageWidth;
		}

		public static function get stageHeight():Number
		{
			return _stage.stageHeight;
		}

	}
}