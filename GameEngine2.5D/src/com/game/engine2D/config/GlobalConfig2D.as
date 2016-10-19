package com.game.engine2D.config
{
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.engine2D.vo.PoolMesh;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import away3d.materials.TextureMaterial;
	
	import starling.utils.MathUtil;
	

	/**
	 * 引擎主配置
	 * @author Carver
	 */		
	public class GlobalConfig2D
	{
		private static var _shadowPos:Point;
		private static var _shadowBmpData:BitmapData;
		private static var _shadowTexture:TextureMaterial;
		
		/**
		 * 游戏帧频 
		 */		
		public static var FRAME_RATE:int = 60;
		/**
		 * 每刷一帧所需时间(注意要用Number类型)
		 */
		public static var SETP_TIME:Number = 1000/FRAME_RATE;
		
		public static function get shadowWidth():int
		{
			return _shadowPos.x;
		}
		
		public static function get shadowHeight():int
		{
			return _shadowPos.y;
		}
		
		public static function get shadowTexture():TextureMaterial
		{
			_shadowTexture ||= MaterialUtils.getMaterialCompressAlpha(_shadowBmpData);
			return _shadowTexture;
		}

		public static function set shadowBmpData(value:BitmapData):void
		{
			if (_shadowBmpData)
				_shadowBmpData.dispose();
			_shadowPos ||= new Point();
			_shadowPos.setTo(value.width, value.height);
			var newW:int = MathUtil.getNextPowerOfTwo(value.width);
			var newH:int = MathUtil.getNextPowerOfTwo(value.height);
			if (newW != value.width || newH != value.height)
			{
				var newBd:BitmapData = new BitmapData(newW, newH, true,0);
				newBd.copyPixels(value, value.rect, new Point());
				value.dispose();
				value = newBd;
			}
			_shadowBmpData = value;
			if (_shadowTexture)
				_shadowTexture.dispose();
			_shadowTexture = null;
		}

		public static function get tanShadow():Number
		{
			return _tanShadow;
		}

		/**影子旋转角度(竖直方向上与原图夹角)(取值范围(-90,90))*/
		public static function get shadowAngle():Number
		{
			return _shadowAngle;
		}

		public static function set shadowAngle(value:Number):void
		{
			_shadowAngle = value;
			_tanShadow = Math.tan((_shadowAngle*Math.PI)/180);
		}
		
		public static var nowTime:int;

		/**解密函数*/
		public static var decode:Function;
		
		/**版本控制函数*/
		public static var version:Function;
		
		/**资源解析函数*/
		public static var resParseFunc:Function;
		/**资源url函数*/
		public static var resUrlFunc:Function;
		/**资源方向映射函数*/
		public static var resAngleFunc:Function;
		
		/**
		 * 换装资源解析器
		 * @L.L.M.Sunny 2015-4-29 
		 */		
		public static var avatarResParser:Class=null;
		/**
		 * 地图切块资源解析器
		 * @L.L.M.Sunny 2015-5-8 
		 */		
		public static var mapTileResParser:Class=null;

		/**影子高度系数(取值范围(0,1))*/
		public static var shadowYScale:Number=0.7;
		
		private static var _shadowAngle:Number=-30;
		
		private static var _tanShadow:Number = 0;
		
		/**影子X方向偏移量*/
		public static var shadowOffsetX:int=0;
		/**影子Y方向偏移量*/
		public static var shadowOffsetY:int=0;
		/**影子透明度(取值范围(0,1))*/
		public static var shadowAlpha:Number=0.5;
		/** 阴影渲染方式 **/
		public static var shadowRenderType:uint = 2;
		
		/** 不缓存，占用的内存最小，性能最差   37帧 **/
		public static const SHADOW_SHAPE:uint = 2;
		
		public static var isShowDrawRect:Boolean = false;
		public static var enableBlendMode:Boolean = true;
		public static var useWorker:Boolean = false;
		public static var avatarResExtension:String = ".zatf";
		
		//仅仅只有值为-1的时候，才不会使用摄像机缓动。默认为0，代表使用。
		public static var cameraTween:int = -1;
		
		/** 而是否使用高刷新率来渲染，注意使用后会导致cpu升高 */
		public static var heightFramRender:Boolean = false;
		public static var MapZoneClass:Class = PoolMesh;
		
		public function GlobalConfig2D(){}
		/**
		 * 设置全局配置
		 * @parm $frameRate 帧频
		 * @param $decode 解密函数 格式：function decode(bytes):ByteArray
		 * @param $version 版本函数函数 格式：function version(url):String
		 */
		public static function setGlobalConfig($frameRate:int, $decode:Function,$version:Function=null):void
		{
			FRAME_RATE = $frameRate;
			//重新计算
			SETP_TIME = 1000/$frameRate;
			
			decode = $decode;
			
			version = $version;
		}
	}
}