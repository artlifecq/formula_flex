package com.game.engine3D.config
{

	/**
	 * 引擎主配置
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-6-4 上午10:26:37
	 */
	public class GlobalConfig
	{
		/**解密函数*/
		public static var decode : Function;

		/**版本控制函数*/
		public static var version : Function;

		/**实体统一半径*/
		public static var radiusForEntity : int = 32;

		public static const DEBUG_HEAD : String = "[GameEngine3D Debug]";

		public static var transformPlanarRotation:Boolean = true;
		
		private static var _use25DMap : Boolean = false;
		private static var _use2DMap : Boolean = false;
//		private static var _map_2D_scale_z_dir : Number = 1;
//		private static var _map_2D_camera_angle : int = 30; //2d场景中的摄像头角度
		
		private static var _mapCameraAngle:Number = 40;
		private static var _mapCameraRadian:Number;
		private static var _map2dScaleZDir:Number = 1;

		public function GlobalConfig()
		{
		}

		/**
		 * 设置全局配置
		 * @parm $frameRate 帧频
		 * @param $decode 解密函数 格式：function decode(bytes):ByteArray
		 * @param $version 版本函数函数 格式：function version(url):String
		 */
		public static function setGlobalConfig($decode : Function, $version : Function = null) : void
		{
			decode = $decode;
			version = $version;
		}

		public static function get use2DMap() : Boolean
		{
			return _use2DMap;
		}

		public static function set use2DMap(value : Boolean) : void
		{
			_use2DMap = value;
//			_map_2D_scale_z_dir = value ? Math.sin(MAP_2D_CAMERA_ANGLE * Math.PI / 180) : 1;
		}

		public static function get use25DMap() : Boolean
		{
			return _use25DMap;
		}

		public static function set use25DMap(value : Boolean) : void
		{
			_use25DMap = value;
		}

		public static function get mapCameraAngle():Number
		{
			return _mapCameraAngle;
		}

		public static function set mapCameraAngle(value:Number):void
		{
			_mapCameraAngle = value;
			_mapCameraRadian = (_mapCameraAngle *Math.PI)/180.0;
			_map2dScaleZDir = Math.tan(Math.abs(_mapCameraRadian));
		}

		public static function get mapCameraRadian():Number
		{
			return _mapCameraRadian;
		}
		
		public static function transform2dValue(y:Number):Number
		{
			return y*_map2dScaleZDir;
		}

		public static function get map2dScaleZDir():Number
		{
			return _map2dScaleZDir;
		}


		/*public static function get MAP_2D_CAMERA_ANGLE() : int
		{
			return _map_2D_camera_angle;
		}

		public static function set MAP_2D_CAMERA_ANGLE(value : int) : void
		{
			_map_2D_camera_angle = value;
			_map_2D_scale_z_dir = _use2DMap ? Math.sin(_map_2D_camera_angle * Math.PI / 180) : 1;
		}
		
		public static function transformCoord_2d_3d(y : Number) : Number
		{
			return int(y / _map_2D_scale_z_dir);
		}*/
	}
}
