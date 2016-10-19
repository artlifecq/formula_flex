package com.game.engine2D.parser
{
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.ImageDecodingPolicy;

	import org.client.load.loader.multi.DisplayObjLoadManager;
	import org.client.load.loader.multi.loader.DisplayObjLoader;
	import org.client.load.loader.multi.vo.LoadData;

	/**
	 *
	 * 地图切片图片资源解析器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-8 下午16:12:35
	 *
	 */
	public class MapTileImageParser implements IResParser
	{
		private var _loadData : LoadData;
		private var _loadCompleteFunc : Function;
		private var _loadErrorFunc : Function;
		private var _loaderInfo : LoaderInfo;
		private var _content : Object;
		private var _isLoaded : Boolean = false;
		private var _isLoading : Boolean = false;

		public function MapTileImageParser()
		{
		}

		final public function load(fullSourchPath : String, priority : int, userData : Object = null) : void
		{
			if (_isLoaded || _isLoading)
			{
				throw new Error("加载中不能再次加载，本次加载请调用unload清除！");
				return;
			}
			_isLoading = true;
			_isLoaded = false;
			_loadData = new LoadData(fullSourchPath, loadSourceComplete, null, loadError, "", fullSourchPath, priority, null, null, null, 2, 0, ImageDecodingPolicy.ON_LOAD);
			_loadData.applicationDomain = new ApplicationDomain();
			_loadData.userData = userData;
			DisplayObjLoadManager.load(_loadData);
		}

		private function loadSourceComplete(ld : LoadData, e : Event) : void
		{
			_content = e.target.content;
			var loader : DisplayObjLoader = e.currentTarget as DisplayObjLoader;
			_loaderInfo = loader.loaderInfo;
			_isLoading = false;
			_isLoaded = true;
			if (_loadCompleteFunc != null)
				_loadCompleteFunc(this);
		}

		private function loadError(ld : LoadData, e : Event = null) : void
		{
			if (_loadErrorFunc != null)
				_loadErrorFunc(this);
		}

		final public function get loadData() : LoadData
		{
			return _loadData;
		}

		final public function onLoadComplete(func : Function) : IResParser
		{
			_loadCompleteFunc = func;
			return this;
		}

		final public function onLoadError(func : Function) : IResParser
		{
			_loadErrorFunc = func;
			return this;
		}

		final public function extractor(className : String) : Object
		{
			if (_content is Bitmap)
			{
				return _content as Bitmap;
			}
			else if (_content is DisplayObjectContainer)
			{
				if (_loaderInfo)
				{
					var appDomain : ApplicationDomain = _loaderInfo.applicationDomain;
					if (appDomain.hasDefinition(className))
					{
						var cls : Class = appDomain.getDefinition(className) as Class;
						return cls;
					}
				}
			}
			return null;
		}

		final public function unload() : void
		{
			_isLoading = false;
			_isLoaded = false;
			if (_loadData)
			{
				if (_loadData.url)
					DisplayObjLoadManager.cancelLoadByUrl(_loadData.url);
				_loadData.userData = null;
				_loadData = null;
			}
			_loadCompleteFunc = null;
			_loadErrorFunc = null;
			_loaderInfo = null;
			_content = null;
		}

		final public function dispose() : void
		{
			unload();
		}
	}
}
