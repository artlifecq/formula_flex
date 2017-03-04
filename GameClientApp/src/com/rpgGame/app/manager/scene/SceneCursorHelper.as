package com.rpgGame.app.manager.scene
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.display3D.Context3DCompareMode;
	import flash.geom.Vector3D;

	/**
	 *
	 * 场景鼠标助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-9 上午10:26:37
	 *
	 */
	public class SceneCursorHelper
	{
		private static var _instance : SceneCursorHelper;

		public static function getInstance() : SceneCursorHelper
		{
			if (!_instance)
			{
				_instance = new SceneCursorHelper();
			}
			return _instance;
		}

		/** 鼠标点击地面特效的路径 **/
		private var _mouseClickEffectUrl : String;
		/** 鼠标点击地面的特效 **/
		private var _mouseClickEffect : RenderUnit3D;

		public function SceneCursorHelper()
		{
			_mouseClickEffectUrl = ClientConfig.getEffect(EffectUrl.SHUBIAO_DIANJI);
		}

		public function showCursor(position : Vector3D) : void
		{
			showMouseClickEffect(position);
		}

		public function hideCursor() : void
		{
			hideMouseClickEffect();
		}

		/**
		 * 显示鼠标点击地面的特效
		 * @param position
		 *
		 */
		private function showMouseClickEffect(position : Vector3D) : void
		{
			if (!_mouseClickEffect)
			{
				var rud : RenderParamData3D = new RenderParamData3D(0, SceneCharType.MOUSE_CLICK_EFFECT, _mouseClickEffectUrl);
				_mouseClickEffect = RenderUnit3D.create(rud);
				_mouseClickEffect.depthCompareMode = Context3DCompareMode.ALWAYS;
				_mouseClickEffect.repeat = 0;
				_mouseClickEffect.play(0);
//				_mouseClickEffect.setScale(1);
				_mouseClickEffect.canRemoved = false;
				_mouseClickEffect.rotationX = -40;
				SceneManager.addSceneObjToScene(_mouseClickEffect, false, false, false);
			}
			_mouseClickEffect.visible = true;
			_mouseClickEffect.play(0);
			_mouseClickEffect.position = position;
		}

		/**
		 * 隐藏鼠标点击地面的特效
		 *
		 */
		private function hideMouseClickEffect() : void
		{
			if (_mouseClickEffect && _mouseClickEffect.parent)
			{
				_mouseClickEffect.stop();
				_mouseClickEffect.visible = false;
			}
		}

		/**
		 * 是否鼠标点击了地面行走
		 * @return
		 *
		 */
		public function isResponseMouseEvent() : Boolean
		{
			if (_mouseClickEffect && _mouseClickEffect.isPlaying)
				return true;
			return false;
		}
	}
}
