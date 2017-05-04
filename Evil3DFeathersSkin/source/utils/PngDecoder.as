package utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	
	/**
	 * png位图解码器
	 * @author wewell@163.com
	 */
	public class PngDecoder
	{
		/**
		 * 构造函数
		 */		
		public function PngDecoder()
		{
		}
		/**
		 * @inheritDoc
		 */
		public function get codecKey():String
		{
			return "png";
		}
		
		/**
		 * 回调函数字典
		 */		
		private var onCompDic:Dictionary = new Dictionary;
		/**
		 * @inheritDoc
		 */
		public function decode(bytes:ByteArray,onComp:Function):void
		{
			var loader:Loader = new Loader();
			var loaderContext:LoaderContext = new LoaderContext();
			if(loaderContext.hasOwnProperty("imageDecodingPolicy"))//如果是FP11以上版本，开启异步位图解码
				loaderContext["imageDecodingPolicy"] = "onLoad";
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComp);
			if(onCompDic==null)
				onCompDic = new Dictionary;
			onCompDic[loader] = onComp;
			loader.loadBytes(bytes,loaderContext);
		}
		
		/**
		 * 解码字节流完成
		 */		
		private function onLoadComp(event:Event):void
		{
			var loader:Loader = (event.target as LoaderInfo).loader;
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoadComp);
			var bitmapData:BitmapData = (loader.content as Bitmap).bitmapData;
			if(onCompDic[loader]!=null)
			{
				onCompDic[loader](bitmapData);
			}
			delete onCompDic[loader];
		}
	}
}