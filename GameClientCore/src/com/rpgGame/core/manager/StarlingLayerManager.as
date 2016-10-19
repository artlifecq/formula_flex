package com.rpgGame.core.manager
{
	import com.game.engine3D.manager.Stage3DLayerManager;

	import starling.display.Sprite;

	/**
	 *
	 * Starling层管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 上午10:03:17
	 *
	 */
	public class StarlingLayerManager
	{
		/** 角色头部表现层 **/
		public static const HEAD_FACE_LAYER : String = "HEAD_FACE_LAYER";
		/** 场景效果层 **/
		public static const SCENE_EFFECT_LAYER : String = "SCENE_EFFECT_LAYER";

		public static const MAIN_UI_LAYER : String = "MAIN_UI_LAYER";
		public static const APP_LAYER : String = "APP_LAYER";
		public static const HINT_LAYER : String = "HINT_LAYER";
		public static const TIP_LAYER : String = "TIP_LAYER";
		public static const TOP_LAYER : String = "TOP_LAYER";
		public static const BODY_LAYER : String = "BODY_LAYER";

		/** 角色头部表现层 **/
		public static var headFaceLayer : Sprite;
		/** 场景效果层 **/
		public static var sceneEffectLayer : Sprite;

		public static var mainUILayer : Sprite;
		public static var appUILayer : Sprite;
		/** 提示语层 **/
		public static var hintUILayer : Sprite;
		/** tip语层 **/
		public static var tipUILayer : Sprite;
		/** top置顶层 **/
		public static var topUILayer : Sprite;

		public static function setup() : void
		{
			headFaceLayer = creatLayer(HEAD_FACE_LAYER, 0);
			headFaceLayer.touchable = false;
			sceneEffectLayer = creatLayer(SCENE_EFFECT_LAYER, 1);
			sceneEffectLayer.touchable = false;

			mainUILayer = creatLayer(MAIN_UI_LAYER, 2);
			appUILayer = creatLayer(APP_LAYER, 3);
			hintUILayer = creatLayer(HINT_LAYER, 4);
			tipUILayer = creatLayer(TIP_LAYER, 5);
			topUILayer = creatLayer(TOP_LAYER, 6);
		}

		private static function creatLayer(key : String, index : int) : Sprite
		{
			var layer : Sprite = Stage3DLayerManager.starlingLayer.setLayer(key, index);
			return layer;
		}
	}
}
