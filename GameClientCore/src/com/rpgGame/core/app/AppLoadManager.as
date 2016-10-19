package com.rpgGame.core.app
{
	import com.game.mainCore.core.cache.CacheLoaderInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * app模块加载管理
	 * @author fly.liuyang
	 * 创建时间：2014-5-19 上午11:50:48
	 * 
	 */
	public class AppLoadManager
	{
		private var _cacheDic:Dictionary;
		protected var waitMap:Dictionary;
		
		public static var xxxx:uint = 100;
		
		private static var _instace:AppLoadManager;
		
		public static function instace():AppLoadManager
		{
			if(_instace == null)
				_instace = new AppLoadManager();
			
			return _instace;
		}
		
		public function AppLoadManager()
		{
			_cacheDic = new Dictionary();
			waitMap = new Dictionary();
		}
		
		/**
		 * 加载面板
		 * @param url
		 * @param loadingTitle
		 * @param func
		 * @author 卢国征 2015-5-22
		 */		
		public function loadByUrl( url:String, loadingTitle:String, onComplete:Function, onError:Function):void
		{ 
			if( isUrlReady( url ) )
			{
				onComplete( url );
			}
			else
			{
				var cacheInfo:CacheLoaderInfo = new CacheLoaderInfo();
				cacheInfo.url = url;
				cacheInfo.event = onComplete;
				cacheInfo.error = onError;
				addLoad( cacheInfo );
			}
		}
		
		/**
		 * 是否加载完成
		 * @param url
		 * @return 
		 * @author 卢国征 2015-5-22
		 */		
		public function isUrlReady( url:String ):Boolean
		{
			return _cacheDic.hasOwnProperty( url );
		}
		
		/**
		 * 添加加载项
		 * @param cacheInfo
		 * @author 卢国征 2015-5-22
		 */		
		private function addLoad( cacheInfo:CacheLoaderInfo  ):void
		{
			if( !addWait( cacheInfo ) )
				return;
			
			var _loader:AppLoader = new AppLoader();
			_loader.addEventListener( Event.COMPLETE, onLoaderComplete );
			_loader.addEventListener( Event.CLOSE, onLoadClose );
			_loader.addEventListener( IOErrorEvent.IO_ERROR, onError );
			_loader.addEventListener( ProgressEvent.PROGRESS, onLoadProgress );
			_loader.loadApp( cacheInfo.url, ClientConfig.decode );
		}
		
		/**
		 * 进度条
		 * @param event
		 * @author 卢国征 2015-5-22
		 */		
		protected function onLoadProgress( event:ProgressEvent ):void
		{
			//			var _loader:AppLoader = event.currentTarget as AppLoader;
			//			if(!_loadingMask)
			//			{
			//				_loadingMask = new WaitLogMask(LayerManager.stage.stageWidth,LayerManager.stage.stageHeight,0);
			//				_loadingMask.setTip("加载中");
			//			}
			//			_loadingMask.show(LayerManager.stage,true);
			//app资源加载loading条, 现在加载很快,后期在根据外网情况看是否添加loading条
		}
		
		protected function onError( event:IOErrorEvent ):void
		{
			
			var appLoader:AppLoader = event.target as AppLoader;
			var appInfo : AppInfo = new AppInfo();
			appInfo.resName = appLoader.appUrl;
			AppDispather.instance.dispatchEvent( new AppEvent( AppEvent.APP_LOAD_ERROR, appInfo ) );
			dispatchComplete(appLoader.appUrl, true);
		}
		
		protected function onLoadClose( event:Event ):void
		{
			var appLoader:AppLoader = event.target as AppLoader;
			dispatchComplete(appLoader.appUrl, true);
		}
		
		/**
		 * 添加到加载列表里并且返回是否已在列表中
		 * @param cacheInfo
		 * @return 				是否已在列表中
		 * @author 卢国征 2015-5-22
		 */		
		private function addWait( cacheInfo:CacheLoaderInfo ):Boolean
		{
			var arr:Array = waitMap[ cacheInfo.url ];
			if( arr != null )
			{
				for each( var cacheLoaderInfo:CacheLoaderInfo in arr )
				{
					if( cacheLoaderInfo.event == cacheInfo.event )
						return false;
				}
				
				toAddWait( arr, cacheInfo );
				return false;
			}
			
			arr = new Array();
			toAddWait( arr, cacheInfo );
			waitMap[ cacheInfo.url ] = arr;
			return true;
		}
		
		/**
		 * 添加到加载列表里
		 * @param arr
		 * @param cacheInfo
		 * @author 卢国征 2015-5-22
		 */		
		private function toAddWait( arr:Array, cacheInfo:CacheLoaderInfo ):void
		{
			arr.push( cacheInfo );
		}
		
		/**
		 * 加载完成
		 * @param event
		 * @author 卢国征 2015-5-22
		 */		
		protected function onLoaderComplete( event:Event ):void
		{
			var appLoader:AppLoader = event.target as AppLoader;
			_cacheDic[ appLoader.appUrl ] = appLoader.appUrl;
			dispatchComplete( appLoader.appUrl );
		}
		
		/**
		 * 从加载列表里移除
		 * @param appUrl
		 * @author 卢国征 2015-5-22
		 */		
		protected function dispatchComplete( appUrl:String, hasError:Boolean=false ):void
		{
			var arr:Array = waitMap[ appUrl ] as Array;
			for each( var cacheInfo:CacheLoaderInfo in arr )
			{
				hasError ? cacheInfo.error( appUrl) : cacheInfo.event( appUrl );
			}
			arr = null;
			delete waitMap[ appUrl ];
		}
	}
}
