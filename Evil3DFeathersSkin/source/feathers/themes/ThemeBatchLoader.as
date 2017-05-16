package feathers.themes
{
	/**
	 * 皮肤包批量加载器
	 * @author wewell@163.com
	 * 
	 */	
	public class ThemeBatchLoader
	{
		private var _urls:Array;
		private var _urlsLoaded:int;
		private var _urlsTotal:int;
		
		private var _onLoad:Function;
		private var _onProgress:Function;
		private var _onError:Function;
		
		public function ThemeBatchLoader()
		{
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
			var loader:ThemeLoader = new ThemeLoader();
			loader.load(url, onOneLoad, onOneProgress, _onError);
		}
		
		private function onOneLoad(loader:ThemeLoader):void
		{
			_urlsLoaded++;
			
			loadNext();
		}
		
		private function onOneProgress(p:Number):void
		{
			var totalProgress:Number = _urlsLoaded/_urlsTotal + 1/_urlsTotal * p;
			if(_onProgress != null)
			{
				_onProgress(totalProgress);
			}
		}
		
	}
}