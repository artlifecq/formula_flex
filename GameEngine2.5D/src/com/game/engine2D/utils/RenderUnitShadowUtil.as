package com.game.engine2D.utils
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.tools.FunctionCache;
	import com.game.mainCore.libCore.dispose.DisposeHelper;
	
	import flash.display.BitmapData;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import org.client.mainCore.utils.BitmapDataUtil;

	public class RenderUnitShadowUtil
	{
		public function RenderUnitShadowUtil()
		{
		}
		
		private static var _shadowCtf:ColorTransform = new ColorTransform();
		_shadowCtf.color = 0x000000;
		_shadowCtf.alphaMultiplier = GlobalConfig2D.shadowAlpha;

		private static var _shadowBlurFilter:BlurFilter = new BlurFilter(2,2,BitmapFilterQuality.LOW);
		
		private static var _funGetShadow:FunctionCache = new FunctionCache("RenderUnit", getShadow, 4*1024, DisposeHelper.add, FunctionCache.POLICY_LAST_REMOVE);
		private static var _funGetScaleShadow:FunctionCache = new FunctionCache("RenderUnitScale", getShadowScale, 4*1024, DisposeHelper.add, FunctionCache.POLICY_LAST_REMOVE);
		
		private static const ptZero:Point = new Point();
		
		public static function getShadow(bmd:BitmapData) : BitmapData
		{
			var ret:BitmapData;
			if(!BitmapDataUtil.isAvailable(bmd))
			{
				return null;
			}
			//一个共用的矩阵
			var ma:Matrix = new Matrix();
			ma.identity();
			ma.scale(1, GlobalConfig2D.shadowYScale);
			
			ma.c = GlobalConfig2D.tanShadow;
			
			var width:uint = /*Math.ceil*/(bmd.width +bmd.height*GlobalConfig2D.tanShadow)/*>>0*/;
			var height:uint = /*Math.ceil*/(bmd.height*GlobalConfig2D.shadowYScale)/*>>0*/;
			if(width && height)
			{
				ret = new BitmapData(width,height, bmd.transparent, 0x00ffffff);
				ret.draw(bmd, ma, _shadowCtf, null, null, true);
				ret.applyFilter(ret, ret.rect, ptZero, _shadowBlurFilter);
			}
			return ret;
		}
		
		public static function getShadowScale(bmd:BitmapData) : BitmapData
		{
			if(!BitmapDataUtil.isAvailable(bmd))
			{
				return null;
			}
			//一个共用的矩阵
			var ma:Matrix = new Matrix();
			ma.identity();
			ma.scale(-1, GlobalConfig2D.shadowYScale);
			ma.translate(bmd.width, 0);
			
			ma.c = GlobalConfig2D.tanShadow;
			
			var ret:BitmapData;
			var width:uint = /*Math.ceil*/(bmd.width+bmd.height*GlobalConfig2D.tanShadow);
			var height:uint = /*Math.ceil*/(bmd.height*GlobalConfig2D.shadowYScale);
			if(width && height)
			{
				ret = new BitmapData(width, height, bmd.transparent, 0x00ffffff);
				ret.draw(bmd, ma, _shadowCtf, null, null, true);
				ret.applyFilter(ret, ret.rect, ptZero, _shadowBlurFilter);
			}
			return ret;
		}

		public static function getApCache(bmpData:BitmapData):BitmapData
		{
			if (null == bmpData)
				return null;
			return _funGetShadow.call(bmpData);
		}
		
		public static function removeApCache(bmpData:BitmapData):void
		{
			if (null == bmpData)
				return;

			_funGetShadow.remove(bmpData);
		}

		public static function getApScaleCache(bmpData:BitmapData):BitmapData
		{
			if (null == bmpData)
				return null;

			return _funGetScaleShadow.call(bmpData);
		}
		
		public static function removeApScaleCache(bmpData:BitmapData):void
		{
			if (null == bmpData)
				return;

			_funGetScaleShadow.remove(bmpData);
		}
	}
}
