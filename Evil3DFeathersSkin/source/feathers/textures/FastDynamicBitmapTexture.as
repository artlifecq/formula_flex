package feathers.textures
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import starling.textures.DynamicBitmapTexture;
	import starling.utils.FreeRectangleChoiceHeuristic;
	import starling.utils.MathUtil;
	import starling.utils.MaxRectsBinPack;
	
	/**
	 * 快速动态贴图集，对于大量频繁的动态贴图做的特殊优化
	 * 主要优化点在于
	 * 1.重用BitmapData,不会在短时间内new dispose大量的BitmapData
	 * 2.固定尺寸，无须每次插入都重新使用耗时算法计算尺寸
	 * 3.作为画布使用的bitmapData会在30秒无改变的情况下释放内存
	 * 
	 *@auther wewell@163.com
	 * 
	 */
	public class FastDynamicBitmapTexture extends DynamicBitmapTexture
	{
		private var _binWidth:int = 0;
		private var _binHeight:int = 0;
		private var _canvas:BitmapData;
		
		private static const DISPOSE_CANVAS_DELAY:int = 30 * 1000;
		
		public function FastDynamicBitmapTexture(binWidth:int, binHeight:int)
		{
			setTileSize(binWidth, binHeight);
			super();
		}
		
		/**
		 * 生成大图
		 */
		override protected function createTextureAtlas():Boolean
		{
			//30秒内如无变化，则释放内存
			//TimerServer.add(disposeCanvas,DISPOSE_CANVAS_DELAY);
			return super.createTextureAtlas();
		}
		
		/**
		 * 设置固定贴图大小 
		 * @param maxWidth:宽,必须为2的次幂
		 * @param maxHeight:高,必须为2的次幂
		 */
		public function setTileSize(binWidth:int, binHeight:int):void
		{
			_binWidth = MathUtil.getNextPowerOfTwo(binWidth);
			_binHeight = MathUtil.getNextPowerOfTwo(binHeight);
			if (_binWidth > 2048 || _binHeight > 2048)
				throw new Error("动态大图超过2048*2048大小限制");
		}
		
		/** 重写createMaxRectsBinPack方法，生成MaxRectsBinPack对象 */
		override protected function createMaxRectsBinPack(fontRects:Vector.<Rectangle>):MaxRectsBinPack
		{
			return FreeRectangleChoiceHeuristic.findBin(fontRects, _binWidth, _binHeight, false);
		}
		
		/**
		 * 创建一个空的bitmapData及对应Textrue 
		 * @param textureWidth：宽，2的次幂
		 * @param textureHeight：高，2的次幂
		 * @return 返回创建的bitmapData对象
		 * 
		 */
		override protected function createEmptyBitmapData(textureWidth:int, textureHeight:int):BitmapData
		{
			//大小未变的情况下重用BitmapData
			if(_canvas && _canvas.width == textureWidth && _canvas.height == textureHeight)
			{
				_canvas.fillRect(_canvas.rect, 0);
				return _canvas;
			}
			
			disposeCanvas();
			super.disposeTexture();
			
			_canvas = super.createEmptyBitmapData(textureWidth, textureHeight);
			return _canvas;
		}
		
		override protected function disposeEmptyBitmapData(bitmapData:BitmapData):void
		{
			//不再需要时才清理
		}
		
		/** 释放贴图和大图资源 */
		override protected function disposeTexture():void
		{
			//不再需要时才清理
		}
		
		private function disposeCanvas():void
		{
			if(_canvas){
				_canvas.dispose();
				_canvas = null;
			}
		}
	}
}

