package com.rpgGame.core.app
{
	import com.game.mainCore.core.manager.LayerManager;

	/**
	 * 共存面板的位置调管理
	 * @author fly.liuyang
	 * 创建时间：2014-5-30 下午6:02:18
	 * 
	 */
	public class AppMergeManager
	{
		
		private static var _instace:AppMergeManager;
		
		/**两个面板间的横向距离 */
		private static var _offsetX:int = -5;
		
		public function AppMergeManager()
		{
		}
		
		public static function get instace():AppMergeManager
		{
			if(_instace == null)
				_instace = new AppMergeManager();
			
			return _instace;
		}

		public function setup():void
		{
			AppDispather.instance.addEventListener( AppEvent.APP_SHOW, onAppShow );
			AppDispather.instance.addEventListener( AppEvent.APP_HIDE, onApphide );
		}
		
		private function onAppShow( ev:AppEvent ):void
		{
			var appName:String = ev.appInfo.appName;
			setAppMerge(appName , true );
			dealMutexPanel(appName);
		}
		
		private function onApphide( ev:AppEvent ):void
		{
			setAppMerge( ev.appInfo.appName );
		}
		
		//-----------------------------------
		/**
		 * 处理互斥面板；
		 * @author 卢国征 2015-5-22
		 */
		public static function dealMutexPanel( appName:String ):void
		{
			var arr:Array = AppMergeConfig.getMutexArrByAppInfo( appName );
			for each(var mutexAppName:String in arr)
			{
				if ( AppManager.isAppInScene( mutexAppName ) )
				{
					AppManager.hideApp( mutexAppName );
				}
			}
		}
		
		/**
		 * 共存面板的位置管理，横向排列
		 * @param mergeAppName		当前显示或者隐藏的面板
		 * @param isShow			是否显示
		 * @author 卢国征 2015-5-22
		 */		
		private function setAppMerge( mergeAppName:String, isShow:Boolean = false ):void
		{
			var arr:Array = AppMergeConfig.getMergeArrByAppInfo( mergeAppName );
			if( arr == null || arr.length <= 0 )
				return;
			
			var showingArr:Vector.<String> = getShowingArr( arr );
			if( isShow && showingArr.length <= 1 )
				return;
			
			var width:int = getAppArrWidth( showingArr );
			var height:int = getAppArrHeight( showingArr );
			var startX:int = ( LayerManager.stage.stageWidth - width ) / 2;
			var posY:int = ( LayerManager.stage.stageHeight - height ) / 2;
			posY = ( posY < 0 ) ? 0 : posY;
			var nextX:int = startX;
			var leng:int = showingArr.length;
			var appName:String;
			for ( var i:int = 0; i < leng; i++ ) 
			{
				appName = showingArr[ i ];
				AppManager.setAppTweenPosX( appName, nextX );
				nextX = nextX + AppManager.getAppWidth( appName ) + _offsetX;
				AppManager.setAppPosY( appName, posY );
			}
			
			var depLeng:int = showingArr.length - 1;
			for ( var j:int = depLeng; j >= 0; j-- ) 
			{
				appName = showingArr[ j ];
				AppManager.bringToTop( appName );
			}
		}
		
		/**
		 * 得到当前共存面板的总宽
		 * @param arr
		 * @return 
		 * @author 卢国征 2015-5-22
		 */		
		private function getAppArrWidth( arr:Vector.<String> ):int
		{
			var width:int =0;
			for each ( var appName:String in arr ) 
			{
				width += AppManager.getAppWidth( appName );
			}
			return width;
		}
		
		/**
		 * 得到当前共存面板的总高
		 * @param arr
		 * @return 
		 * @author 卢国征 2015-5-22
		 */		
		private function getAppArrHeight( arr:Vector.<String> ):int
		{
			var height:int =0;
			for each ( var appName:String in arr ) 
			{
				var appHeight:int = AppManager.getAppHeight( appName );
				if( height < appHeight )
				{
					height = appHeight;
				}
			}
			return height;
		}
		
		/**
		 * 得到当前可共存显示所有面板
		 * @param arr
		 * @return 
		 * 
		 */		
		private function getShowingArr( arr:Array ):Vector.<String>
		{
			var showWingArr:Vector.<String> = new Vector.<String>;
			var leng:int = arr.length;
			var appName:String;
			for ( var i:int = 0; i < leng; i++ ) 
			{
				appName = arr[ i ];
				if( AppManager.isAppInScene( appName ) )
					showWingArr.push( appName );
			}
			return showWingArr;
		}
	}
}