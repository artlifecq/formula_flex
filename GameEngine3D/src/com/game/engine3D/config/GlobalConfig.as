package com.game.engine3D.config
{
	import flash.utils.getTimer;

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

		public static function get DEBUG_HEAD() : String
		{
			return "[GameEngine3D Debug] " + getTimer() + " ";
		}

		private static var _use2DMap : Boolean = false;
//		private static var _map_2D_scale_z_dir : Number = 1;
//		private static var _map_2D_camera_angle : int = 30; //2d场景中的摄像头角度
		
		private static var _mapCameraAngle:Number = 40;
		private static var _mapCameraRadian:Number;
		private static var _map2dScaleZDir:Number = 1;
		
		private static var _transformPlanared : Boolean = true;
		
		private static var _kernelVersion : String = "";

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
		}

		public static function get2DMapDepth(value : int) : int
		{
			return (value>0?value:-value)<<7;
		}
		
		public static function get transformPlanared():Boolean
		{
			return _transformPlanared;
		}
		
		public static function set transformPlanared(value:Boolean):void
		{
			_transformPlanared = value;
		}
		
		public static function get mapCameraAngle():Number
		{
			return _mapCameraAngle;
		}

		public static function set mapCameraAngle(value:Number):void
		{
			_mapCameraAngle = value;
			_mapCameraRadian = ((_mapCameraAngle+90) *Math.PI)/180.0;
			_map2dScaleZDir = Math.tan(Math.abs(_mapCameraRadian));
			//_planarTransform = Math.tan(Math.abs(_planarRotationX)*(Math.PI/180.0));
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
		
		public static function set kernelVersion(value : String) : void
		{
			_kernelVersion = value;
		}
		
		public static function get kernelVersion() : String
		{
			return _kernelVersion;
		}
		
		public static function get kernelIsIE() : Boolean
		{
			return Boolean(_kernelVersion == "IE");
		}
		
		public static function get kernelIsChrome() : Boolean
		{
			return Boolean(_kernelVersion == "Chrome");
		}
		
		public static function get kernelIsFireFox() : Boolean
		{
			return Boolean(_kernelVersion == "Firefox");
		}
	}
}
