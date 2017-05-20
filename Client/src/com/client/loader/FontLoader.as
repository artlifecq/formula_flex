package com.client.loader
{
	import flash.events.EventDispatcher;
	import flash.display.Loader;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class FontLoader extends EventDispatcher 
	{
		
		private var _decodeFunc:Function;
		private var _loader:Loader;
		
		public function FontLoader(decodeFunc:Function)
		{
			_decodeFunc = decodeFunc;
		}
		
		public function get loader():Loader
		{
			return _loader;
		}
		
		public function load(url:String):void
		{
			var loadData:MultiLoadData = new MultiLoadData(url, onLoadCmp, onLoaderUpdate, onErrorFunc, "", "", 0, "binary", null, null, 3);
			MultiUrlLoadManager.load(loadData);
		}
		
		private function onErrorFunc(ld:MultiLoadData, e:IOErrorEvent):void
		{
			dispatchEvent(e);
		}
		
		private function onLoadCmp(ld:MultiLoadData, e:Event):void
		{
			var fontData:ByteArray = e.currentTarget.data;
			if (_decodeFunc != null)
			{
				fontData = _decodeFunc(fontData);
			}
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener("complete", onComponentLoaderComplete);
			var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			if (context.hasOwnProperty("allowCodeImport"))
			{
				context["allowCodeImport"] = true;
			}
			_loader.contentLoaderInfo.addEventListener("ioError", onIOError);
			_loader.loadBytes(fontData, context);
		}
		
		protected function onComponentLoaderComplete(event:Event):void
		{
			dispatchEvent(event);
		}
		
		protected function onIOError(event:IOErrorEvent):void
		{
		}
		
		private function onLoaderUpdate(ld:MultiLoadData, e:ProgressEvent):void
		{
			dispatchEvent(e);
		}
	}
}