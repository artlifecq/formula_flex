package com.rpgGame.app.manager
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.SceneCharType;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 场景摄像机镜头前效果管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-8-30 上午10:26:37
	 *
	 */
	public class SceneCameraLensEffectManager
	{
		private static var UNIQUE_ID : Number = 0;
		private static var _effectByName : HashMap;

		public function SceneCameraLensEffectManager()
		{
		}

		public static function setup() : void
		{
			_effectByName = new HashMap();
		}

		public static function playEffectOnce(effectName : String, depth : int = 200, scale : Number = 1, playToTime : int = 0) : void
		{
			if (!_effectByName)
			{
				return;
			}
			var effectRu : RenderUnit3D = _effectByName.getValue(effectName);
			if (!effectRu)
			{
				var scene : GameScene3D = SceneManager.getScene();
				var rud : RenderParamData = new RenderParamData(++UNIQUE_ID, SceneCharType.SCENE_CAMERA_LENS_EFFECT, ClientConfig.getEffect(effectName));
				effectRu = RenderUnit3D.create(rud);
				effectRu.name = effectName;
				effectRu.allowCameraAnimator = true;
				effectRu.repeat = 1;
				effectRu.z = depth;
				effectRu.setScale(scale);
				effectRu.completeWhenInvisible = true;
				scene.addSceneObj(effectRu, scene.camera, false, false);
				effectRu.setPlayCompleteCallBack(onPlayEffectOnceComplete);
				_effectByName.add(effectName, effectRu);
			}
			effectRu.play(playToTime);
		}

		private static function onPlayEffectOnceComplete(effectRu : RenderUnit3D) : void
		{
			if (!_effectByName)
			{
				return;
			}
			_effectByName.remove(effectRu.name);
			SceneManager.removeSceneObjFromScene(effectRu);
		}

		public static function hasEffect(effectName : String) : Boolean
		{
			if (!_effectByName)
			{
				return false;
			}
			return _effectByName.getValue(effectName) != null;
		}

		public static function removeEffect(effectName : String) : void
		{
			if (!_effectByName)
			{
				return;
			}
			var effectRu : RenderUnit3D = _effectByName.getValue(effectName);
			if (effectRu)
			{
				_effectByName.remove(effectRu.name);
				SceneManager.removeSceneObjFromScene(effectRu);
			}
		}

		public static function sceneClear() : void
		{
			if (!_effectByName)
			{
				return;
			}
			for each (var effectRu : RenderUnit3D in _effectByName)
			{
				SceneManager.removeSceneObjFromScene(effectRu);
			}
			_effectByName.clear();
		}

		/**
		 * 播放倒计时特效
		 *
		 */
		public static function playDaoJiShiEffect(playToTime : int = 0) : void
		{
			playEffectOnce(EffectUrl.DAO_JI_SHI_EFFECT, 200, 0.7, playToTime);
		}
	}
}
