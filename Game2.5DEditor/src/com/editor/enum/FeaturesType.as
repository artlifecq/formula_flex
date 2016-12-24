package com.editor.enum
{

	/**
	 *
	 * 特性类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-08-03 上午11:03:17
	 *
	 */
	public class FeaturesType
	{
		/**
		 * 无
		 */
		public static const NONE_TYPE : String = "";
		/**
		 * 场景
		 */
		public static const SCENE_TYPE : String = "scene";
		/**
		 * 换装资源
		 */
		public static const AVATAR_RESOURCE_TYPE : String = "avatar_resource";
		/**
		 * 技能
		 */
		public static const SPELL_TYPE : String = "spell";
		/**
		 * 布置
		 */
		public static const DECORATE_TYPE : String = "decorate";
		/**
		 * 轨迹
		 */
		public static const TRAIL_TYPE : String = "trail";
		/**
		 * 剧情
		 */
		public static const STORY_TYPE : String = "story";
		/**
		 * 自定义
		 */
		public static const CUSTOM_TYPE : String = "custom";

		/**
		 * 地图块
		 */
		public static const SCENE_BLOCK_TYPE : String = "scene_block";
		/**
		 * 地图块布置
		 */
		public static const SCENE_BLOCK_DECORATE_TYPE : String = "scene_block_decorate";


		public function FeaturesType()
		{
		}

		public static var featureTypes : Array = null;
		public static var features : Array = null;
		initFeatures();

		private static function initFeatures() : void
		{
			featureTypes = [SCENE_TYPE, AVATAR_RESOURCE_TYPE, SPELL_TYPE, DECORATE_TYPE, TRAIL_TYPE, STORY_TYPE, CUSTOM_TYPE, //
				SCENE_BLOCK_TYPE, SCENE_BLOCK_DECORATE_TYPE];
			features = [{type: NONE_TYPE, name: "无"}, //
				{type: SCENE_TYPE, name: "场景"}, //
				{type: AVATAR_RESOURCE_TYPE, name: "换装资源"}, //
				{type: SPELL_TYPE, name: "技能"}, //
				{type: DECORATE_TYPE, name: "布置"}, //
				{type: TRAIL_TYPE, name: "轨迹"}, //
				{type: STORY_TYPE, name: "剧情"}, //
				{type: CUSTOM_TYPE, name: "自定义"}, //
				{type: SCENE_BLOCK_TYPE, name: "地图块"}, //
				{type: SCENE_BLOCK_DECORATE_TYPE, name: "地图块布置"}];
		}

		public static function isFeature(type : String) : Boolean
		{
			if (featureTypes.indexOf(type) != -1)
				return true;
			return false;
		}
	}
}
