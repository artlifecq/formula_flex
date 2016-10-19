package com.client.view.loading
{
	import com.gameClient.log.GameLog;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 *
	 * 加载背景
	 * @author fly.liuyang
	 * 创建时间：2015-2-25 下午4:32:44
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-3 下午6:05:12
	 *
	 */
	public class ClientLoadingBg extends Sprite
	{
		private var _loadingStream : URLStream;
		private var _loader : Loader;
		private var _decode : Function;
		private var _logo : DisplayObject;
		private var _bitmapMap : Bitmap;

		public function ClientLoadingBg(url : String, decoder : Function)
		{
			_bitmapMap = new Bitmap();
			addChild(_bitmapMap);
			_decode = decoder;
			loadLogoBg(url);
		}

		private function loadLogoBg(url : String) : void
		{
			GameLog.addShow("加载logo...");

			_loadingStream = new URLStream();
			_loadingStream.addEventListener(Event.COMPLETE, onSmLoadingCmp);
			_loadingStream.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_loadingStream.addEventListener(Event.COMPLETE, onSmLoadingCmp);
			_loadingStream.load(new URLRequest(url));
		}

		private function onSmLoadingCmp(e : Event) : void
		{
			_loadingStream.removeEventListener(Event.COMPLETE, onSmLoadingCmp);
			//
			var byteArray : ByteArray = new ByteArray();
			_loadingStream.readBytes(byteArray);
			_loadingStream.close();
			_loadingStream = null;
			if (_decode != null)
			{
				byteArray = _decode(byteArray);
			}
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLogoBgLoaded);
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			if(loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true; 
			}
			_loader.loadBytes(byteArray, loaderContext);
		}

		private function onIoError(e : IOErrorEvent) : void
		{
			GameLog.add("登录Logo加载出错");
		}

		private function onLogoBgLoaded(e : Event) : void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLogoBgLoaded);
			var info : LoaderInfo = e.currentTarget as LoaderInfo;
			var obj : * = info.applicationDomain.getDefinition("BMP_loadingBg");
			if (obj != null)
			{
				var cls : Class = obj as Class;
				var bitmap : BitmapData = new cls();
				_bitmapMap.bitmapData = bitmap;
			}
			_loader.unloadAndStop(false);
			_loader = null;
			dispatchEvent(new Event(Event.COMPLETE));
		}

		public function dispose() : void
		{
			if (_loadingStream)
			{
				_loadingStream.removeEventListener(Event.COMPLETE, onSmLoadingCmp);
				_loadingStream.close();
				_loadingStream = null;
			}
			if (_loader)
			{
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLogoBgLoaded);
				_loader.unloadAndStop(false);
				_loader = null;
			}
			if (_bitmapMap.bitmapData != null)
			{
				_bitmapMap.bitmapData.dispose();
				_bitmapMap.bitmapData = null;
			}
		}
	}
}
