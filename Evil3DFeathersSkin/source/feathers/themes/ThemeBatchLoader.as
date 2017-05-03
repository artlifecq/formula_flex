package feathers.themes
{
	import flash.events.ProgressEvent;
	
	import away3d.loaders.multi.MultiLoadData;

	/**
	 * 皮肤包批量加载器
	 * @author wewell@163.com
	 * 
	 */	
	public class ThemeBatchLoader
	{
		private var _urls:Array;
		private var _needBmdUrls:Array;
		private var _urlsTotal:int;
		private var _onLoad:Function;
		private var _onProgress:Function;
		private var _onError:Function;
		
		public function ThemeBatchLoader()
		{
		}
		
		public function setNeedBitmapUrls(urls:Array):void
		{
			_needBmdUrls = urls;
		}
		
		public function loadBatch(urls : Array, onLoad : Function = null, onProgress : Function=null, onError:Function=null) : void
		{
			this._onLoad = onLoad;
			this._onProgress = onProgress;
			this._onError = onError;
			this._urls = urls.reverse();
			_urlsTotal = urls.length;
			
			loadNext();
		}
		
		private function loadNext():void
		{
			if(_urls.length == 0)
			{
				if(this._onLoad != null)
				{
					this._onLoad();
				}
				return;
			}
			
			var url:String = _urls.pop();
			var needBmd:Boolean = _needBmdUrls ? _needBmdUrls.indexOf(url) != -1 : false;
			var loader:ThemeLoader = new ThemeLoader( needBmd );
			loader.load(url, onOneLoad, onOneProgress, _onError);
		}
		
		private function onOneLoad(loader:ThemeLoader):void
		{
			loadNext();
		}
		
		private function onOneProgress(ld:MultiLoadData, e:ProgressEvent):void
		{
			var progress:Number = (_urlsTotal -1 - _urls.length)/_urlsTotal;
			var curProgress:Number = 1/_urlsTotal * e.bytesLoaded/e.bytesTotal;
			if(_onProgress != null)
			{
				_onProgress(progress + curProgress);
			}
		}
	}
}