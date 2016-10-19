package com.rpgGame.app.ui.loader
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.vo.LoadData;
	
	/**
	 * swf文件加载器
	 * @author fly.liuyang
	 * 创建时间：2014-7-7 下午9:56:16
	 * 
	 */
	public class SwfLoader extends EventDispatcher
	{

		public function get loader():Loader
		{
			return _loader;
		}

		private var _decodeFunc:Function;
		private var _loader:Loader;
		public function SwfLoader(decodeFunc:Function)
		{
			_decodeFunc = decodeFunc;
		}
		public function load(url:String):void
		{
			var loadData:LoadData = new LoadData(url,onLoadCmp,onLoaderUpdate,onErrorFunc,"","",0,URLLoaderDataFormat.BINARY,null,null,3);
			UrlLoadManager.load(loadData);
		}
		
		private function onErrorFunc(ld:LoadData,e:IOErrorEvent):void
		{
			dispatchEvent(e);
		}
		
		private function onLoadCmp(ld:LoadData,e:Event):void
		{
			var bytes:ByteArray = (e.currentTarget).data;
			if(_decodeFunc != null)
			{
				bytes = _decodeFunc(bytes);
			}
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComponentLoaderComplete);
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			if(loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true; 
			}
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			_loader.loadBytes(bytes,loaderContext);
		}
		
		protected function onComponentLoaderComplete(event:Event):void
		{
			dispatchEvent(event);
		}
		
		protected function onIOError(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
		}
		
		private function onLoaderUpdate(ld:LoadData,e:ProgressEvent):void
		{
			dispatchEvent(e);
		}
		
	}
}