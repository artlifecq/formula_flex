package com.client.loader
{
	import com.client.events.VerEvent;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.VersionUtils;

	import flash.display.Loader;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TextEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 * Flash 文件列表流加载
	 * @author carver
	 *
	 */
	public class ListStreamLoader extends EventDispatcher
	{
		private var _stream : URLStream;
		private var _loader : Loader;

		private var _loadedCnt : uint;
		private var _allLoadCnt : uint;

		private var _baseDir : String;
		private var _urlList : Vector.<String>;

		private var _stage : Stage;

		private var preLoader : PreLoader = new PreLoader();
		private var _preloader : Object = null;
		private var _useVersion : Boolean;
		private var _isDecode : Boolean;
		private var _version : String;

		public function ListStreamLoader(stage : Stage = null)
		{
			_stage = stage;

			_stream = new URLStream();
			_stream.addEventListener(Event.OPEN, onOpen);
			_stream.addEventListener(Event.COMPLETE, onComplete);
			_stream.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_stream.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);

			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onLoaderOver);
		}

		public function doLoad(baseDir : String, urlList : Vector.<String>, useVersion : Boolean = false, isDecode : Boolean = false, version : String = "") : void
		{
			_baseDir = baseDir;
			_urlList = urlList;
			_allLoadCnt = _urlList.length;
			_useVersion = useVersion;
			_isDecode = isDecode;
			_version = version;
			beginLoad();
		}

		/**
		 * 开始加载
		 *
		 */
		private function beginLoad() : void
		{
			if (_urlList.length > 0)
			{
				var url : String = _urlList.shift();
				if (_useVersion)
				{
					if (_isDecode)
					{
						_stage.addChild(preLoader);
						if (null == _preloader)
						{
							_preloader = preLoader.loader;
						}

						GameLog.addShow(url.replace(".ml", "0.ml"), VersionUtils.getVersionPath(url.replace(".ml", "0.ml")));
						var urlPath0 : String = _baseDir + url.replace(".ml", "0.ml");
						var urlPath1 : String = _baseDir + url.replace(".ml", "1.ml");
						var urlPath2 : String = _baseDir + url.replace(".ml", "2.ml");
						// 执行加载
						doload(this, [urlPath0, urlPath1, urlPath2]);
					}
					else
					{
						_stream.load(new URLRequest(_baseDir + url));
					}
				}
				else
				{
					_stream.load(new URLRequest(_baseDir + VersionUtils.getVersionPath(url)));
				}
			}
			else
			{
				_stream.removeEventListener(Event.OPEN, onOpen);
				_stream.removeEventListener(Event.COMPLETE, onComplete);
				_stream.removeEventListener(ProgressEvent.PROGRESS, onProgressHandler);
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _onLoaderOver);
				_loader = null;
				_stream = null;
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}

		private function errorHandler() : void
		{
			GameLog.addShow("Dll load Error");
		}

		private function doload(thisObj : ListStreamLoader, pathlist : Array) : void
		{
			_preloader.load_res(pathlist, {}, thisObj, thisObj, completeHandler, progressHandler, errorHandler);
		}

		private function progressHandler(progress : Number, loadGame : Boolean) : void
		{
			var pe : ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS);
			pe.bytesLoaded = progress;
			pe.bytesTotal = 1;
			//
			dispatchEvent(pe);
		}

		private function completeHandler(version : ByteArray) : void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}

		private function onOpen(e : Event) : void
		{
			dispatchEvent(new TextEvent(Event.OPEN, false, false, "加载程序"));
		}

		private function onProgressHandler(e : ProgressEvent) : void
		{
			var onPercent : Number = 1 / _allLoadCnt;
			var percent : Number = e.bytesLoaded / e.bytesTotal;
			percent = onPercent * percent + (_loadedCnt * onPercent);
			var pe : ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS);
			pe.bytesLoaded = percent;
			pe.bytesTotal = 1;

			dispatchEvent(pe);
		}

		private function onComplete(e : Event) : void
		{
			if (_isDecode)
			{
				_stream.removeEventListener(Event.OPEN, onOpen);
				_stream.removeEventListener(Event.COMPLETE, onComplete);
				_stream.removeEventListener(ProgressEvent.PROGRESS, onProgressHandler);
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _onLoaderOver);
				_loader = null;
				_stream = null;
				dispatchEvent(new VerEvent(VerEvent.SIZE_ERROR));
			}

			var byteArray : ByteArray = new ByteArray();
			_stream.readBytes(byteArray);
			if (_isDecode)
			{
				byteArray.uncompress();
			}
			_stream.close();
			var loaderContext : LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			if (loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true;
			}
			_loader.loadBytes(byteArray, loaderContext);
		}

		private function onIoError(e : IOErrorEvent) : void
		{
			GameLog.throwError(new Error(e.type, "加载----出错"));
		}

		private function _onLoaderOver(e : Event) : void
		{
			_loadedCnt++;
			beginLoad();
		}

	}
}

class LoadFileInfo
{
	public var name : String;
	public var ver : String;
	public var path : String;
	public var size : uint;
}
