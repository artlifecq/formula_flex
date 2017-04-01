package com.editor.data.map
{
	import flash.utils.Dictionary;

	/**
	 *
	 * 地图区域类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-09-10 上午11:03:17
	 *
	 */
	public class MapAreaTypeEnum
	{
		/**
		 * 自定义区域
		 */
		public static const CUSTOM : int = 0;
		/**
		 * 障碍区域
		 */
		public static const OBSTACLE : int = 1;
		/**
		 * 竞技PK区域
		 */
		public static const ATHLETICS : int = 2;
		/**
		 * 事件区域
		 */
		public static const EVENT : int = 3;
		/**
		 * 动态障碍区域
		 */
		public static const DYNAMIC_OBSTACLE : int = 4;
		/**
		 * 摄像头属性区域
		 */
		public static const CAMERA_PROPERTY : int = 5;
		/**
		 * 安全区域
		 */
		public static const SAFE : int = 6;
		/**
		 * 技能禁止区域
		 */
		public static const SPELL_FORBID : int = 7;
		/**
		 * 摆摊区域
		 */
		public static const STALL : int = 8;

		public static var nameByType : Dictionary = new Dictionary();
		nameByType[CUSTOM] = "自定义区域";
		nameByType[OBSTACLE] = "固定障碍区域";
		nameByType[ATHLETICS] = "竞技区域";
		nameByType[EVENT] = "事件区域";
		nameByType[DYNAMIC_OBSTACLE] = "动态障碍区域";
		nameByType[CAMERA_PROPERTY] = "摄像头属性区域";
		nameByType[SAFE] = "安全区域";
		nameByType[SPELL_FORBID] = "技能禁止区域";
		nameByType[STALL] = "摆摊区域";

		public function MapAreaTypeEnum()
		{
		}

		public static function getTypeList() : Array
		{
			var types : Array = [];
			for (var type : * in nameByType)
			{
				types.push({type: type, name: nameByType[type]});
			}
			return types;
		}
	}
}
