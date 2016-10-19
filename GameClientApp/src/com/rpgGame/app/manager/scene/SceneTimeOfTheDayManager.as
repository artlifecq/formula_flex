package com.rpgGame.app.manager.scene
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.utils.ColorUtil;
	import com.game.engine3D.vo.map.ClientMapTimeOfTheDayData;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;

	import away3d.containers.ObjectContainer3D;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	import away3d.materials.methods.ColorTransformMethod;
	import away3d.materials.methods.FogMethod;
	import away3d.primitives.SkyBox;

	import utils.TimerServer;

	/**
	 *
	 * 场景天色管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-24 下午6:26:37
	 *
	 */
	public class SceneTimeOfTheDayManager
	{
		/**
		 * 植物颜色变换名称
		 */
		private static const PLANT_COLOR_TRANSFORM_NAME : String = "PLANT_COLOR_TRANSFORM";
		/**
		 * 夜晚消失组名称
		 */
		private static const NIGHT_LOST_GROUP_NAME : String = "NIGHT_LOST_GROUP";
		private static var _scene : GameScene3D;
		private static var _timeOfTheDayData : ClientMapTimeOfTheDayData;
		private static var _ratio : Number = 0;

		public function SceneTimeOfTheDayManager()
		{
		}

		public static function initScene(timeOfTheDayData : ClientMapTimeOfTheDayData, scene : GameScene3D) : void
		{
			_timeOfTheDayData = timeOfTheDayData;
			_scene = scene;
			TimerServer.addSecTick(onUpdateSceneTime, null, 60);
			onUpdateSceneTime();
			updateSceneTransform();
		}

		public static function clear() : void
		{
			_timeOfTheDayData = null;
			_scene = null;
			TimerServer.remove(onUpdateSceneTime);
		}

		private static function updateSceneTransform() : void
		{
			if (_timeOfTheDayData)
			{
				var sceneAreaDirectionalLight : DirectionalLight = _scene.sceneAreaDirectionalLight;
				if (sceneAreaDirectionalLight)
				{
					sceneAreaDirectionalLight.ambient = _timeOfTheDayData.sceneAreaDirectionalLightAmbientLevelFrom + (_timeOfTheDayData.sceneAreaDirectionalLightAmbientLevelTo - _timeOfTheDayData.sceneAreaDirectionalLightAmbientLevelFrom) * _ratio;
					sceneAreaDirectionalLight.ambientColor = ColorUtil.ratioColor(_timeOfTheDayData.sceneAreaDirectionalLightAmbientColorFrom, _timeOfTheDayData.sceneAreaDirectionalLightAmbientColorTo, _ratio);
					sceneAreaDirectionalLight.diffuse = _timeOfTheDayData.sceneAreaDirectionalLightDiffuseLevelFrom + (_timeOfTheDayData.sceneAreaDirectionalLightDiffuseLevelTo - _timeOfTheDayData.sceneAreaDirectionalLightDiffuseLevelFrom) * _ratio;
					sceneAreaDirectionalLight.color = ColorUtil.ratioColor(_timeOfTheDayData.sceneAreaDirectionalLightDiffuseColorFrom, _timeOfTheDayData.sceneAreaDirectionalLightDiffuseColorTo, _ratio);
				}

				var mainCharSyncPosLight : LightBase = _scene.mainCharSyncPosLight;
				if (mainCharSyncPosLight)
				{
					mainCharSyncPosLight.ambient = _timeOfTheDayData.mainCharSyncPosLightAmbientLevelFrom + (_timeOfTheDayData.mainCharSyncPosLightAmbientLevelTo - _timeOfTheDayData.mainCharSyncPosLightAmbientLevelFrom) * _ratio;
					mainCharSyncPosLight.ambientColor = ColorUtil.ratioColor(_timeOfTheDayData.mainCharSyncPosLightAmbientColorFrom, _timeOfTheDayData.mainCharSyncPosLightAmbientColorTo, _ratio);
					mainCharSyncPosLight.diffuse = _timeOfTheDayData.mainCharSyncPosLightDiffuseLevelFrom + (_timeOfTheDayData.mainCharSyncPosLightDiffuseLevelTo - _timeOfTheDayData.mainCharSyncPosLightDiffuseLevelFrom) * _ratio;
					mainCharSyncPosLight.color = ColorUtil.ratioColor(_timeOfTheDayData.mainCharSyncPosLightDiffuseColorFrom, _timeOfTheDayData.mainCharSyncPosLightDiffuseColorTo, _ratio);
				}

				var skyBox : SkyBox = _scene.sceneMapLayer.skyBox;
				if (skyBox)
				{
					skyBox.fogColor = ColorUtil.ratioColor(_timeOfTheDayData.skyFogColorFrom, _timeOfTheDayData.skyFogColorTo, _ratio);
					skyBox.fogRatio = _timeOfTheDayData.skyFogRatioFrom + (_timeOfTheDayData.skyFogRatioTo - _timeOfTheDayData.skyFogRatioFrom) * _ratio;
				}

				var methods : Array = _scene.sceneMapLayer.getFogMethods();
				for each (var fogMethod : FogMethod in methods)
				{
					fogMethod.fogColor = ColorUtil.ratioColor(_timeOfTheDayData.fogColorFrom, _timeOfTheDayData.fogColorTo, _ratio);
					break;
				}

				var minDist : Number = _timeOfTheDayData.fogMinDistanceFrom + (_timeOfTheDayData.fogMinDistanceTo - _timeOfTheDayData.fogMinDistanceFrom) * _ratio;
				var maxDist : Number = _timeOfTheDayData.fogMaxDistanceFrom + (_timeOfTheDayData.fogMaxDistanceTo - _timeOfTheDayData.fogMaxDistanceFrom) * _ratio;
				_scene.sceneMapLayer.setFogDistance(minDist, maxDist);

				var colorTrans : ColorTransformMethod = _scene.sceneMapLayer.getObj(PLANT_COLOR_TRANSFORM_NAME) as ColorTransformMethod;
				if (colorTrans)
				{
					var tarnsValues : Array = ColorUtil.ratioColorTransform(_timeOfTheDayData.plantColorTransformFrom, _timeOfTheDayData.plantColorTransformTo, _ratio);
					colorTrans.colorTransform.redMultiplier = tarnsValues[0];
					colorTrans.colorTransform.greenMultiplier = tarnsValues[1];
					colorTrans.colorTransform.blueMultiplier = tarnsValues[2];
					colorTrans.colorTransform.alphaMultiplier = tarnsValues[3];
				}

				var nightLostGroup : ObjectContainer3D = _scene.sceneMapLayer.getObj(NIGHT_LOST_GROUP_NAME) as ObjectContainer3D;
				if (nightLostGroup)
				{
					nightLostGroup.visible = _ratio < _timeOfTheDayData.nightLostGroupRatio;
				}
			}
		}

		public static function set ratio(value : Number) : void
		{
			_ratio = value;
			if (_ratio < 0)
				_ratio = 0;
			else if (_ratio > 1)
				_ratio = 1;
			updateSceneTransform();
		}

		public static function get ratio() : Number
		{
			return _ratio;
		}

		private static function onUpdateSceneTime() : void
		{
			if (_timeOfTheDayData)
			{
				var date : Date = SystemTimeManager.sysDateTime;
				var hour : int = date.hours;
				var minute : int = date.minutes;
				var dayTime : int = hour * TimeUtil.HOUR_MICRO_SECONDS + minute * TimeUtil.MINUTE_MICRO_SECONDS;
				var mornToNightTimes : Array = _timeOfTheDayData.mornToNightTime;
				var nightToMornTimes : Array = _timeOfTheDayData.nightToMornTime;
				if (dayTime >= mornToNightTimes[0] && dayTime <= mornToNightTimes[1])
				{
					ratio = (dayTime - mornToNightTimes[0]) / (mornToNightTimes[1] - mornToNightTimes[0]);
				}
				else if (dayTime >= nightToMornTimes[0] && dayTime <= nightToMornTimes[1])
				{
					ratio = 1 - ((dayTime - nightToMornTimes[0]) / (nightToMornTimes[1] - nightToMornTimes[0]));
				}
				else
				{
					if (dayTime > nightToMornTimes[1] && dayTime < mornToNightTimes[0])
					{
						ratio = 0;
					}
					else
					{
						ratio = 1;
					}
				}
			}
		}
	}
}
