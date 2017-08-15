package com.rpgGame.app.manager
{
	import com.game.engine2D.Scene;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	
	import away3d.Away3D;
	
	/**
	 * 根据设置的值来调整游戏的质量 
	 * @author NEIL
	 * 
	 */	
	public class DisplaySetUpManager 
	{
		
		private static const MAX_CONFIG_LEVEL:int = 3;
		
		private static var _configLevel:int;
		private static var _autoSetting:Boolean = true;
		private static var _openPhantom:Boolean;
		private static var _openHeat:Boolean;
		private static var _openGlow:Boolean;
		private static var _openHeightEffect:Boolean;
		private static var _shadowLevel:int;
		private static var _filterQuality:int;
		
		
		public static function get autoSetting():Boolean
		{
			return _autoSetting;
		}
		
		public static function set autoSetting(value:Boolean):void
		{
			_autoSetting = value;
		}
		
		public static function defaultSetting():void
		{
			DisplaySetUpManager.autoSetting = true;
			setToMid();
		}
		
		public static function applySetting(dispaySet:Object):void
		{
			if (dispaySet != null)
			{
				DisplaySetUpManager.configLevel = dispaySet.quality;
				DisplaySetUpManager.viewAntiAlias = dispaySet.antiAlias;
				DisplaySetUpManager.displayLevel = dispaySet.displayLevel;
				DisplaySetUpManager.shadowLevel = dispaySet.shadowLevel;
				DisplaySetUpManager.openPhantom = dispaySet.openPhantom;
				DisplaySetUpManager.openBlend = dispaySet.openBlendPass;
				DisplaySetUpManager.openHeightEffect = dispaySet.openHeightEffect;
				DisplaySetUpManager.openHeat = dispaySet.openHeat;
				DisplaySetUpManager.openGlow = dispaySet.openGlow;
				DisplaySetUpManager.filterQuality = dispaySet.filterQuality>0 ? dispaySet.filterQuality : 100;
			}
		}
		
		public static function reducedPerforms():Boolean
		{
			if (_configLevel > 0)
			{
				_configLevel--;
				switch (_configLevel)
				{
					case 1:
						setToLow();
						return true;
					case 2:
						setToMid();
						return true;
					default:
				}
			}
			return false;
		}
		
		public static function improvePerforms():Boolean
		{
			if (_configLevel < 3)
			{
				_configLevel++;
				switch (_configLevel)
				{
					case 2:
						setToMid();
						return true;
					case 3:
						setToHigh();
						return true;
					default:
				}
			}
			return false;
		}
		
		public static function get configLevel():int
		{
			if (DisplaySetUpManager.autoSetting == true)
			{
				return 0;
			}
			return _configLevel;
		}
		
		public static function set configLevel(value:int):void
		{
			switch (value)
			{
				case 0:
					DisplaySetUpManager.autoSetting = true;
					return;
				case 1:
					DisplaySetUpManager.autoSetting = false;
					setToLow();
					return;
				case 2:
					DisplaySetUpManager.autoSetting = false;
					setToMid();
					return;
				case 3:
					DisplaySetUpManager.autoSetting = false;
					setToHigh();
				default:
					return;
			}
		}
		
		public static function setToLow():void
		{
			_configLevel = 1;
			openHeightEffect = false;
			openBlend = false;
			openPhantom = false;
			openGlow = false;
			openHeat = false;
			viewAntiAlias = 0;
			displayLevel = 0;
			shadowLevel = 0;
			filterQuality = 70;
		}
		
		public static function setToMid():void
		{
			_configLevel = 2;
			openHeightEffect = false;
			openBlend = true;
			openPhantom = true;
			openGlow = true;
			openHeat = true;
			viewAntiAlias = 1;
			displayLevel = 1;
			shadowLevel = 3;
			filterQuality = 100;
		}
		
		public static function setToHigh():void
		{
			_configLevel = 3;
			openHeightEffect = true;
			openBlend = true;
			openPhantom = true;
			openGlow = true;
			openHeat = true;
			viewAntiAlias = 2;
			displayLevel = 2;
			shadowLevel = 3;
			filterQuality = 100;
		}
		
		public static function set openBlend(value:Boolean):void
		{
			Away3D.BLEND_PASS = value;
		}
		
		public static function get openBlend():Boolean
		{
			return Away3D.BLEND_PASS;
		}
		
		public static function set viewAntiAlias(value:int):void
		{
			Stage3DLayerManager.viewAntiAlias = value;
		}
		
		public static function get viewAntiAlias():int
		{
			return Stage3DLayerManager.viewAntiAlias;
		}
		
		public static function set displayLevel(value:int):void
		{
			Away3D.DISPLAY_LEVEL = value;
		}
		
		public static function get displayLevel():int
		{
			return Away3D.DISPLAY_LEVEL;
		}
		
		public static function set shadowLevel(value:int):void
		{
			_shadowLevel = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.shadowLevel = value;
			}
			var scene:Scene = SceneManager.scene;
			if(scene)
			{
				scene.shadowLevel = value;
			}
			AvatarManager.updateSimpleShadow();
		}
		
		public static function get shadowLevel():int
		{
			return _shadowLevel;
		}
		
		public static function set filterQuality(value:int):void
		{
			_filterQuality = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.view.filter3DQuality = (value * 0.01);
			}
		}
		
		public static function get filterQuality():int
		{
			return _filterQuality;
		}
		
		public static function set openGlow(value:Boolean):void
		{
			_openGlow = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.glow = value;
			}
		}
		
		public static function get openGlow():Boolean
		{
			return _openGlow;
		}
		
		public static function set openPhantom(value:Boolean):void
		{
			_openPhantom = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.phantom = value;
			}
		}
		
		public static function get openPhantom():Boolean
		{
			return _openPhantom;
		}
		
		public static function set openHeat(value:Boolean):void
		{
			_openHeat = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.heat = value;
			}
		}
		
		public static function get openHeat():Boolean
		{
			return _openHeat;
		}
		
		public static function set openHeightEffect(value:Boolean):void
		{
			_openHeightEffect = value;
			var gameScene3D:GameScene3D = SceneManager.getScene();
			if (gameScene3D)
			{
				gameScene3D.useGodRayFilter = value;
				GameSetting.useRingDepthOfFieldFilter = value;
				GameCameraManager.updateCameraState();
			}
		}
		
		public static function get openHeightEffect():Boolean
		{
			return _openHeightEffect;
		}
	}
}