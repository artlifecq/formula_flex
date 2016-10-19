package com.rpgGame.core.utils
{
	import com.rpgGame.coreData.cfg.ClientConfig;

	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 *
	 * 控制台
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-10 下午5:26:37
	 *
	 */
	public class ConsoleDesk
	{
		private static var _urlLoader : URLLoader;
		private static var _consoleLoader : Loader;
		private static var _container : DisplayObjectContainer;

		public function ConsoleDesk()
		{
		}

		public static function showOrHide(stage : Stage) : void
		{
			if (!_container)
				_container = new Sprite();

			if (_container.parent)
			{
				_container.parent.removeChild(_container);
			}
			else
			{
				stage.addChild(_container);
				_container.x = 0;
				_container.y = 0;

				if (!_urlLoader)
				{
					var url : String = ClientConfig.getConsoleDesk("GameConsoleDesk");
					_urlLoader = new URLLoader();
					_urlLoader.addEventListener(Event.COMPLETE, loadComplete);
					_urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
					_urlLoader.load(new URLRequest(url));
				}
			}
		}

		private static function loadComplete(e : Event) : void
		{
			var urlLoader : URLLoader = e.currentTarget as URLLoader;
			urlLoader.removeEventListener(Event.COMPLETE, loadComplete);
			var bytes : ByteArray = urlLoader.data;
			//
			_consoleLoader = new Loader();
			_consoleLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			_consoleLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			var loaderContext : LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			if(loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true; 
			}
			_consoleLoader.loadBytes(bytes, loaderContext);
		}

		private static function onIoError(event : IOErrorEvent) : void
		{
		}

		private static function onLoaderComplete(event : Event) : void
		{
			_consoleLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoaderComplete);
			_consoleLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_container.addChild(_consoleLoader.content);
		}
	}
}
