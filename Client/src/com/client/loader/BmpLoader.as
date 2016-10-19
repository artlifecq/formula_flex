package com.client.loader
{
	import com.client.utils.ClientUrlManager;
	import com.gameClient.log.GameLog;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 *
	 * 图片加载器
	 * @author fly.liuyang
	 * 创建时间：2015-2-25 下午9:01:16
	 * 
	 */
	public class BmpLoader extends EventDispatcher
	{
		private var _loadingStream:URLStream;
		private var _loader:Loader;
		private var _bitmapData:BitmapData;
		
		public function BmpLoader()
		{
		}
		
		public function load(url:String):void
		{
			GameLog.addShow("加载logo...");
			_loadingStream = new URLStream();
			_loadingStream.addEventListener(Event.COMPLETE,onSmLoadingCmp);
			_loadingStream.addEventListener(IOErrorEvent.IO_ERROR,onIoError);
			_loadingStream.addEventListener(Event.COMPLETE,onSmLoadingCmp);
			_loadingStream.load(new URLRequest(url));
		}
		
		private function onSmLoadingCmp(e:Event):void
		{
			_loadingStream.removeEventListener(Event.COMPLETE,onSmLoadingCmp);
			var byteArray:ByteArray = new ByteArray();
			_loadingStream.readBytes(byteArray);
			_loadingStream.close();
			if(ClientUrlManager.decode != null)
			{
				byteArray = ClientUrlManager.decode(byteArray);
			}
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLogoBgLoaded);
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			if(loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true; 
			}
			_loader.loadBytes(byteArray,loaderContext);
		}
		
		private function onIoError(e:IOErrorEvent):void
		{
			GameLog.add("登录Logo加载出错");
		}
		
		private function onLogoBgLoaded(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLogoBgLoaded);
			var info:LoaderInfo = e.currentTarget as LoaderInfo;
			_bitmapData = Bitmap(info.content).bitmapData;
			_loader.unload();
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get bitmapData():BitmapData
		{
			return _bitmapData;
		}
		
		public function dispose():void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLogoBgLoaded);
			_loader = null
		}
	}
}