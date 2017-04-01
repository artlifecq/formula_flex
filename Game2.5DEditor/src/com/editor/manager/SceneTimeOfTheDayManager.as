package com.editor.manager
{
	import com.editor.data.map.ClientMapTimeOfTheDayData;
	import com.editor.data.map.EditorClientMapData;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.utils.ColorUtil;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	import away3d.materials.methods.ColorTransformMethod;
	import away3d.materials.methods.FogMethod;
	import away3d.primitives.SkyBox;

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
		private static var _ratio : Number = 0;

		public function SceneTimeOfTheDayManager()
		{
		}

		public static function initScene(scene : GameScene3D) : void
		{
			_scene = scene;
			updateSceneTransform();
		}

		public static function clear() : void
		{
			_scene = null;
		}

		public static function updateSceneTransform() : void
		{
			var timeOfTheDayData : ClientMapTimeOfTheDayData = null;
			var mapData : EditorClientMapData = SceneManager.getInstance().mapData;
			if (mapData)
			{
				timeOfTheDayData = mapData.timeOfTheDayData;
			}
			if (timeOfTheDayData)
			{
				var sceneAreaDirectionalLight : DirectionalLight = _scene.sceneAreaDirectionalLight;
				if (sceneAreaDirectionalLight)
				{
					sceneAreaDirectionalLight.ambient = timeOfTheDayData.mSceneAreaDirectionalLightAmbientLevelFrom + (timeOfTheDayData.mSceneAreaDirectionalLightAmbientLevelTo - timeOfTheDayData.mSceneAreaDirectionalLightAmbientLevelFrom) * _ratio;
					sceneAreaDirectionalLight.ambientColor = ColorUtil.ratioColor(timeOfTheDayData.mSceneAreaDirectionalLightAmbientColorFrom, timeOfTheDayData.mSceneAreaDirectionalLightAmbientColorTo, _ratio);
					sceneAreaDirectionalLight.diffuse = timeOfTheDayData.mSceneAreaDirectionalLightDiffuseLevelFrom + (timeOfTheDayData.mSceneAreaDirectionalLightDiffuseLevelTo - timeOfTheDayData.mSceneAreaDirectionalLightDiffuseLevelFrom) * _ratio;
					sceneAreaDirectionalLight.color = ColorUtil.ratioColor(timeOfTheDayData.mSceneAreaDirectionalLightDiffuseColorFrom, timeOfTheDayData.mSceneAreaDirectionalLightDiffuseColorTo, _ratio);
				}

				var mainCharSyncPosLight : LightBase = _scene.mainCharSyncPosLight;
				if (mainCharSyncPosLight)
				{
					mainCharSyncPosLight.ambient = timeOfTheDayData.mMainCharSyncPosLightAmbientLevelFrom + (timeOfTheDayData.mMainCharSyncPosLightAmbientLevelTo - timeOfTheDayData.mMainCharSyncPosLightAmbientLevelFrom) * _ratio;
					mainCharSyncPosLight.ambientColor = ColorUtil.ratioColor(timeOfTheDayData.mMainCharSyncPosLightAmbientColorFrom, timeOfTheDayData.mMainCharSyncPosLightAmbientColorTo, _ratio);
					mainCharSyncPosLight.diffuse = timeOfTheDayData.mMainCharSyncPosLightDiffuseLevelFrom + (timeOfTheDayData.mMainCharSyncPosLightDiffuseLevelTo - timeOfTheDayData.mMainCharSyncPosLightDiffuseLevelFrom) * _ratio;
					mainCharSyncPosLight.color = ColorUtil.ratioColor(timeOfTheDayData.mMainCharSyncPosLightDiffuseColorFrom, timeOfTheDayData.mMainCharSyncPosLightDiffuseColorTo, _ratio);
				}

				var skyBox : SkyBox = _scene.sceneMapLayer.skyBox;
				if (skyBox)
				{
					skyBox.fogColor = ColorUtil.ratioColor(timeOfTheDayData.mSkyFogColorFrom, timeOfTheDayData.mSkyFogColorTo, _ratio);
					skyBox.fogRatio = timeOfTheDayData.mSkyFogRatioFrom + (timeOfTheDayData.mSkyFogRatioTo - timeOfTheDayData.mSkyFogRatioFrom) * _ratio;
				}

				var methods : Array = _scene.sceneMapLayer.getFogMethods();
				for each (var fogMethod : FogMethod in methods)
				{
					fogMethod.fogColor = ColorUtil.ratioColor(timeOfTheDayData.mFogColorFrom, timeOfTheDayData.mFogColorTo, _ratio);
					break;
				}

				var minDist : Number = timeOfTheDayData.mFogMinDistanceFrom + (timeOfTheDayData.mFogMinDistanceTo - timeOfTheDayData.mFogMinDistanceFrom) * _ratio;
				var maxDist : Number = timeOfTheDayData.mFogMaxDistanceFrom + (timeOfTheDayData.mFogMaxDistanceTo - timeOfTheDayData.mFogMaxDistanceFrom) * _ratio;
				_scene.sceneMapLayer.setFogDistance(minDist, maxDist);

				var colorTrans : ColorTransformMethod = _scene.sceneMapLayer.getObj(PLANT_COLOR_TRANSFORM_NAME) as ColorTransformMethod;
				if (colorTrans)
				{
					var tarnsValues : Array = ColorUtil.ratioColorTransform(timeOfTheDayData.mPlantColorTransformFrom, timeOfTheDayData.mPlantColorTransformTo, _ratio);
					colorTrans.colorTransform.redMultiplier = tarnsValues[0];
					colorTrans.colorTransform.greenMultiplier = tarnsValues[1];
					colorTrans.colorTransform.blueMultiplier = tarnsValues[2];
					colorTrans.colorTransform.alphaMultiplier = tarnsValues[3];
				}

				var nightLostGroup : ObjectContainer3D = _scene.sceneMapLayer.getObj(NIGHT_LOST_GROUP_NAME) as ObjectContainer3D;
				if (nightLostGroup)
				{
					nightLostGroup.visible = _ratio < timeOfTheDayData.mNightLostGroupRatio;
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
	}
}
