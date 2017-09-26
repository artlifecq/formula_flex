package com.rpgGame.core.app
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.manager.scene.PanelFixedInSceneManager;
	import com.rpgGame.core.utils.AudioPlayUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.Loader;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	import away3d.events.EventDispatcher;
	
	import gs.TweenLite;
	import gs.TweenMax;
	import gs.easing.Back;
	import gs.easing.Linear;
	import gs.easing.Sine;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	
	/**
	 *   app面板
	 * @author fly.liuyang
	 *
	 */
	public class AppPanel extends EventDispatcher
	{
		/** 最大加载失败重试次数 **/
		private static var MAX_ERROR_NUM : int = 3;

		/** 面板调整位置的速  **/
		private static var PANEL_OFFSET_TWEEN_TIME : Number = 0.3;

		/** app资源是否已经在加载中 **/
		private var _isLoading : Boolean = false;

		private var _app : IApp;

		public var depth : int;

		private var _appInfo : AppInfo;
		private var _data : Object;
		private var _openTable : int;

		private var _loader : Loader;

		private var _errorNum : int;
		private var _parentContiner : DisplayObjectContainer;
		private var _isAppShowIng : Boolean = false;
		private var _needAmition:Boolean = true;
		private var closeTween:TweenMax;

		public function AppPanel(appInfoP : AppInfo)
		{
			_appInfo = appInfoP;
		}

		private function get isAppShowIng() : Boolean
		{
			return _isAppShowIng;
		}
		
		private function set isAppShowIng(value : Boolean) : void
		{
			_isAppShowIng = value;
		}

		public function setup() : void
		{
			if (_app != null)
				return;

			if (_isLoading)
				return;

			isAppShowIng = true;
			_isLoading = true;

			if (_appInfo.resName)
			{
				GameLog.add("load app res:" + _appInfo.resName);
				var loadUrl : String = ClientConfig.getUI(_appInfo.resName);
				AppLoadManager.instace().loadByUrl(loadUrl, _appInfo.loadingTitle, onLoadComplete, onError);
			}
			else
			{
				trace(_appInfo.appName + " resName: null");
				GameLog.add(_appInfo.appName + " resName: null");
				onLoadComplete();
			}
		}

		private function onCloseBtnClick() : void
		{
			_isLoading = false;
		}

		public function init(data : Object, $openTable : int, parentContiner : DisplayObjectContainer) : void
		{
			_data = data;
			_openTable = $openTable;
			_parentContiner = parentContiner;
		}
		
		/**
		 *是否切地图关闭 
		 * @return 
		 * 
		 */
		public function get changeMapClose():Boolean
		{
			return _app.changeMapClose;
		}

		public function show() : void
		{
			isAppShowIng = true;
			if (_app != null)
			{
				//				if( _app.parent == null || _app.isHideEffecting() )
				//				{
				//					_app.superAddEvent();
				//					_app.addEvent();
				//				}
				_app.show(_data, _openTable, _parentContiner);
				AppManager.changeAlwaysTopApp();
				if(_needAmition)
				{
					TweenMax.killTweensOf(_app);
					var showObj:DisplayObject=_app as DisplayObject;
					showObj.alpha=0;
					
					var initx:int=_app.x;
					var inity:int=_app.y;
					var initPvx:int=0;
					var initPvy:int=0;
					showObj.pivotX=_app.width/2;
					showObj.pivotY=_app.height/2;
					_app.x+=(_app.width/2-initPvx);
					_app.y+=(_app.height/2-initPvy);
					
					
					//				_app.refresh();
					TweenMax.fromTo(_app, 0.3, 
						{
							scaleX: 0.7,
							scaleY: 0.7,
							alpha: 0,
							ease: Back.easeInOut
							
							
						},
						{
							scaleX: 1.0,
							scaleY: 1.0,
							alpha: 1,
							ease: Back.easeInOut,
							onComplete:function():void
							{
								_app.x=initx;
								_app.y=inity;
								showObj.pivotX=initPvx;
								showObj.pivotY=initPvy;
							}
						});
					_needAmition = false;
				}
				AppDispather.instance.dispatchEvent(new AppEvent(AppEvent.APP_SHOW, appInfo));
			}
			else
			{
				setup();
			}
			AudioPlayUtil.playUIPanelOpen();
		}

		public function hide() : void
		{
			if(closeTween){
				return;
			}
			TweenMax.killTweensOf(_app);
			if (_app != null && _app.parent != null)
			{
//				_app.superRemoveEvent();
//				_app.removeEvent();
				closeTween=TweenMax.to(_app, 0.3, {
					y: _app.y + 10,
					alpha: 0,
					ease: Sine.easeIn,
					onComplete:realRemove
				});
				
			}
		}
		private function realRemove():void
		{
			isAppShowIng = false;
			_needAmition = true;
			closeTween=null;
			if(_app.parent){
				_app.parent.removeChild(_app as DisplayObject);
			}
			AppDispather.instance.dispatchEvent(new AppEvent(AppEvent.APP_HIDE, appInfo));
		}
		public function dispose() : void
		{
			hide();
			if (_app != null)
				_app.dispose();
		}

		public function onLoadComplete(_appUrl : String = null) : void
		{
			_isLoading = false;
			var clsName : String = _appInfo.className;
			if (isAppShowIng)
			{
				try
				{
					var cls : Class = ApplicationDomain.currentDomain.getDefinition(clsName) as Class;
				}
				catch (error : Error)
				{
					GameLog.addError(error.message);
				}

				if (cls != null)
				{
					_app = new cls();
					_app.appinfo = _appInfo;
					/*					_app.supperSetup();
										_app.setup();
										_app.initAttr();
										_app.initView();*/
					show();
					_app.addEventListener(Event.CLOSE, onPanelClose);
					dispatchEvent(new Event(Event.COMPLETE));
				}
			}
		}

		private function onPanelClose(ev : Event) : void
		{
			hide();
			AudioPlayUtil.playUIPanelClose();
		}

		private function onLoadClose(e : Event) : void
		{
			dispose();
			dispatchEvent(new Event(Event.CLOSE));
		}

		private function onError(url : String) : void
		{
			dispose();
			_errorNum++;
			_isLoading = false;
			if (_errorNum < MAX_ERROR_NUM)
			{
				setTimeout(errorReLoad, 100);
			}
			else
			{
				_errorNum = 0;
				GameLog.add("应用模块加载出错" + url);
			}
		}

		private function errorReLoad() : void
		{
			setup();
		}

		public function get hasParent() : Boolean
		{
			if (_app != null)
			{
				return _app.parentContainer == null ? false : true;
			}
			return false;
		}

		public function isShowing() : Boolean
		{
//			return hasParent && !_app.isHideEffecting();
			return isAppShowIng;
		}

		public function getAppWidth() : Number
		{
			if (_app != null)
			{
				return _app.width;
			}
			return 0;
		}

		public function getAppHeight() : Number
		{
			if (_app != null)
			{
				return _app.height;
			}
			return 0;
		}

		public function setAppPosX(value : int) : void
		{
			if (_app != null)
			{
				_app.x = value;
				onTweenPosComplete();
			}
		}

		public function setAppTweenPosX(value : int) : void
		{
			if (_app != null)
			{
				TweenLite.to(_app, PANEL_OFFSET_TWEEN_TIME, {x: value, ease: Linear.easeOut, onComplete: onTweenPosComplete});
			}
		}

		public function setAppTweenPosY(value : int) : void
		{
			if (_app != null)
			{
				TweenLite.to(_app, PANEL_OFFSET_TWEEN_TIME, {y: value, ease: Linear.easeOut, onComplete: onTweenPosComplete});
			}
		}

		private function onTweenPosComplete() : void
		{
			PanelFixedInSceneManager.updatePosPer(_app as Sprite);
		}

		public function setAppPosY(value : int) : void
		{
			if (_app != null)
			{
				_app.y = value;
				onTweenPosComplete();
			}
		}

		public function get appPosY() : int
		{
			if (_app != null)
			{
				return _app.y;
			}
			return 0;
		}

		public function get appPosX() : int
		{
			if (_app != null)
			{
				return _app.x;
			}
			return 0;
		}

		public function get appInfo() : AppInfo
		{
			return _appInfo;
		}

		public function get appName() : String
		{
			return _appInfo.appName;
		}

		public function showCloseGuide(isShowBg : Boolean, bgAlpha : Number) : void
		{
			if (_app != null)
			{
				_app.showCloseGuide(isShowBg, bgAlpha);
			}
		}

		public function bringToTop() : void
		{
			//DepthManager.bringToTop( _app as DisplayObject );
			/*if (_app != null)
				StarlingLayerManager.appUILayer.addChild(_app as starling.display.DisplayObject);*/
			if (_app != null&&_app.parent)
				_app.parent.addChild(_app as starling.display.DisplayObject);
		}

		public function hitTest(xPos : Number, yPos : Number) : Boolean
		{
			return _app.hitTest(new Point(xPos, yPos));
		}

		public function get alwaysTop():Boolean
		{
			return _app.alwaysTop;
		}
	}
}
