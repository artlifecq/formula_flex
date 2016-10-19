package com.rpgGame.core.app
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;

	/**
	 * app模块加载器
	 * @author fly.liuyang
	 * 创建时间：2014-5-19 下午2:03:22
	 *
	 */
	public class AppLoader extends EventDispatcher
	{
		private var _appUrl : String;
		private var _themeLoader : ThemeLoader;

		public function AppLoader()
		{
			super();
			_themeLoader = new ThemeLoader();
		}

		public function get appUrl() : String
		{
			return _appUrl;
		}

		/**
		 * 加载面板
		 * @param $appUrl
		 * @param decodeFunc
		 * @author 卢国征 2015-5-22
		 */
		public function loadApp($appUrl : String, decodeFunc : Function) : void
		{
			_appUrl = $appUrl;
			_themeLoader.load($appUrl, onResolver, null, onError);
		}

		private function onResolver(loader : ThemeLoader) : void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}

		private function onError(ld : MultiLoadData, e : Event) : void
		{
			dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
		}
	}
}
