package feathers.controls
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import avmplus.getQualifiedClassName;
	
	import away3d.loaders.multi.MultiDobjLoadManager;
	import away3d.loaders.multi.MultiDobjLoader;
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.core.IMovieClip;
	import feathers.drawer.MovieClipData;
	import feathers.themes.GuiTheme;
	import feathers.themes.GuiThemeStyle;
	import feathers.themes.ThemeLoader;
	
	import starling.events.Event;
	
	import utils.TimerServer;
	
	/**
	 *  序列帧动画
	 * @author wewell@163.com
	 * 
	 */	
	public class UIMovieClip extends UIAsset implements IMovieClip
	{
		public static var RES_ROOT:String = "../res/app/";
		private static var BmdId:int;
		private var _frameLabels:Vector.<String>;
		private var _frameStyles:Vector.<String>;
		private var _frameOffsets:Vector.<Point>;
		
		/**
		 * 帧间隔，毫秒
		 */
		private var _frameTime:int;
		private var _fps:int=24;
		
		/*** 总帧数	 */
		private var _totalFrames:int;
		
		 
		/** 当前帧 	*/
		private var _curFrame:int;
		private var _repeatPlay:Boolean = true;
		private var _frameCalls:Dictionary;
		private var _isPlaying:Boolean;
		private var _isLoaded:Boolean;
		private var _autoPlay:Boolean;
		
		/**
		 * 构造函数
		 */		
		public function UIMovieClip()
		{
			_frameTime = 1000/_fps;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		/**
		 * 帧频 
		 * @param value
		 * see fps
		 */		
		public function set frameRate(value:int):void
		{
			fps = value;
		}
		
		public function set fps(value:int):void
		{
			_fps = value;
			_frameTime = 1000/_fps;
			if(_isPlaying)
			{
				TimerServer.edit(renderFrame,_frameTime);
			}
		}
		
		public function get fps():int
		{
			return _fps;
		}
		
		/**
		 * 设置被添加到舞台之后是否自动播放
		 */
		public function set autoPlay(value:Boolean):void
		{
			_autoPlay = value;
			if(_autoPlay && stage != null)
			{
				play();
			}
		}
		
		public function get autoPlay():Boolean
		{
			return _autoPlay;
		}
		
		public function set nativeMovieClipUrl(url:String):void
		{
			var loadData:MultiLoadData = new MultiLoadData(url, onSwfLoad);
			MultiDobjLoadManager.load(loadData);
		}
		
		private function onSwfLoad($ld : MultiLoadData, event : flash.events.Event):void
		{
			var loader : MultiDobjLoader = event.currentTarget as MultiDobjLoader;
			var mc : MovieClip = loader.content as MovieClip;
			nativeMocieClip = mc;
		}
		
		private var mcData:MovieClipData;
		public function set nativeMocieClip(nativeDisp:flash.display.DisplayObject):void
		{
			if(mcData == null)mcData = new MovieClipData();
			mcData.draw(nativeDisp, false, true);
			_totalFrames = mcData.totalFrames;
			var bd:BitmapData;
			var subStyle:String;
			for(var i:int=0; i<_totalFrames; i++)
			{
				bd = mcData.getBitmapData(i);
				subStyle = "__UIMovieClip"+(BmdId++);
				GuiTheme.ins.pushDynamicSubTexture(bd,subStyle);
				_frameLabels.push(i+"");
				_frameStyles.push(subStyle);
			}
		}
		
		private var _themeUrl:String;
		/**
		 * 设置外部加载的纹理url 
		 * @param url
		 */		
		public function set themeUrl(url:String):void
		{
			if(_themeUrl == url)return;
			_themeUrl = url;
		}
		
		/**
		 *  设置皮肤
		 * @param value String
		 * 1. 已存在纹理集里的key
		 * 2. 外部url,动态加载,加载完成后将发送Starling.events.Event(Event.COMPLETE)事件
		 * 
		 */	
		private var _mcStyle:String;
		override public function set styleName(value:String):void
		{
			if(!value)
			{
				trace("UIMovieClip: styleName=null");
				return;
			}
			if(value.indexOf("?") >= 0)
			{
				value = value.split("?")[0];
			}
			if(_mcStyle == value)return;
			_mcStyle = value;
			
			var styles:Object = GuiThemeStyle.getStyle(value);
			var subStyle:String;
			var label:String;
			_frameLabels = new Vector.<String>;
			_frameStyles = new Vector.<String>;
			_frameOffsets = new Vector.<Point>;
			for (label in styles)
			{
				_frameLabels.push(label);
			}
			
			//升序
			_frameLabels = _frameLabels.sort(sortString);
			//trace(_frameLabels);
			
			var p:Point;
			numAssets = 0;
			for each(label in _frameLabels)
			{
				subStyle = styles[label];
				_frameStyles.push(subStyle);
				
				p = GuiTheme.ins.getOffSet(subStyle);
				_frameOffsets.push(p);
				
				if(GuiTheme.ins.hasTexture(subStyle))
				{
					numAssets++;
					
					if(!this.width || !this.height)
					{
						var sub:Object = GuiTheme.ins.getSubThemeInfo(subStyle);
						if(sub)
						{
							this.width = sub.width;
							this.height = sub.height;
						}
					}
				}
			}
			
			_totalFrames = frameLabels.length;
			if(numAssets == _totalFrames)
			{
				_isLoaded = true;
			}
			
			if(this.stage != null)
			{
				checkLoad();
			}
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		override public function set styleClass(value:Class):void
		{
			if(!value)return;
			styleName = getQualifiedClassName(value).replace("::", ".");
		}
		
		private function sortString(a:String, b:String):int
		{
			if(a>b)return 1;  
			else if(a<b)return -1;  
			return 0;
		}
		
		public function get stateSkin():StateSkin
		{
			return GuiThemeStyle.getStateSkin(styleName);
		}
		
		private function checkLoad():void
		{
			TimerServer.callAfterFrame(_loadNow);
		}
		
		private function _loadNow():void
		{
			if(_isLoaded)
			{
				onLoadFinish();
				return;
			}
			
			if(_themeUrl)
			{
				themeLoad(_themeUrl);
			}else
			{
//				singleLoad();//暂不开放单帧加载
			}
		}
		
		private function themeLoad(url:String):void
		{
			if(url.indexOf(RES_ROOT) == -1)
			{
				url = RES_ROOT+url;
			}
			_themeUrl = url;
			_isLoaded = false;
			var loader:ThemeLoader = new ThemeLoader();
			loader.load(url, onThemeLoaded);
		}
		
		private function singleLoad():void
		{
			numAssets = 0;
			for each(var style:String in _frameStyles)
			{
				if(!GuiTheme.ins.hasTexture(style))
				{
					GuiTheme.ins.LoadAsset(style, onAssetLoad);
				}else{
					numAssets++;
				}
			}
			if(numAssets == _frameStyles.length)
			{
				onLoadFinish();
			}
		}
		
		private function onLoadFinish():void
		{
			_isLoaded = true;
			if(_isPlaying || (_autoPlay && stage != null))play();
			this.dispatchEvent(new starling.events.Event(starling.events.Event.COMPLETE));
		}
		
		private function onThemeLoaded(loader:ThemeLoader):void
		{
			var p:Point;
			var label:String;
			var len:int = _frameLabels.length;
			for (var i:int=0; i<len; i++)
			{
				var subStyle:String = _frameStyles[i];
				p = GuiTheme.ins.getOffSet(subStyle);
				_frameOffsets[i] = p;
				
				if(!this.width || !this.height)
				{
					var sub:Object = GuiTheme.ins.getSubThemeInfo(subStyle);
					if(sub)
					{
						this.width = sub.width;
						this.height = sub.height;
					}
				}
			}
			onLoadFinish();
		}
		
		private function onAddedToStage():void
		{
			checkLoad();
		}
		
		private function onRemoveFromStage():void
		{
			stop();
		}
		
		private var numAssets:int;
		private function onAssetLoad():void
		{
			numAssets++;
			if(numAssets == frameLabels.length)
			{
				onLoadFinish();
			}
		}
		
		private function renderFrame():void
		{
			if( !this.stage || !visible)
			{
				stop();
				return;
			}
			
			_curFrame++;
			if(_curFrame >= _totalFrames)
			{
				if(_repeatPlay)
				{
					_curFrame =0;
				}else
				{
					stop();
				}
			}
			
			gotoFrame( _curFrame);
		}
		
		private function gotoFrame(frame:int):void
		{
			if(frame < 0 || frame >= totalFrames)frame = 0;
			_curFrame = frame;
			
			//切换显示
			super.styleName = _frameStyles[frame];
			
			if(mcData)
			{
				offset = mcData.getFrameOffset(frame);
			}else{
				offset = _frameOffsets[frame];
			}
			if(offset)
			{
				super.x = mX + offset.x;
				super.y = mY + offset.y;
			}
			
			if(_frameCalls && _frameCalls[frame])
			{
				_frameCalls[frame](this);
			}
		}
		
		//=======================override==================================
		
		private var offset:Point;
		private var mX:int;
		private var mY:int;
		override public function set x(value:Number):void
		{
			if(x==value)
				return;
			super.x = value;
			mX = value;
		}
		override public function get x():Number
		{
			return mX + (offset ? offset.x : 0);
		}
		
		
		override public function set y(value:Number):void
		{
			if(y==value)
				return;
			super.y = value;
			mY = value;
		}
		override public function get y():Number
		{
			return mY + (offset ? offset.y : 0);
		}
		
		
		//=======================IMovieClip==================================
		/**
		 * 当前播放到的帧索引,从0开始
		 */
		public function get currentFrame():int{return _curFrame}
		
		/**
		 * 当前播放到的帧标签
		 */
		public function get currentFrameLabel():String
		{
			return _frameLabels ? _frameLabels[_curFrame] : null;
		}
		
		/**
		 * 动画总帧数
		 */
		public function get totalFrames():int{return _totalFrames};
		/**
		 * 返回由FrameLabel对象组成的数组。数组包括整个动画实例的所有帧标签。
		 */		
		public function get frameLabels():Vector.<String>{return _frameLabels};
		/**
		 * 是否循环播放,默认为true。
		 */		
		public function get repeatPlay():Boolean{return _repeatPlay};
		public function set repeatPlay(value:Boolean):void
		{
			_repeatPlay = value;
		}
		/**
		 * 是否正在播放
		 */	
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}
		
		/**
		 * 跳到指定帧并播放
		 * @param frame 可以是帧索引或者帧标签，帧索引从0开始。
		 */
		public function gotoAndPlay(frame:Object):void
		{
			var f:int = frame is String ? _frameLabels.indexOf(frame as String) : int(frame);
			gotoFrame( f );
			play();
		}
		/**
		 * 跳到指定帧并停止
		 * @param frame 可以是帧索引或者帧标签，帧索引从0开始。
		 */
		public function gotoAndStop(frame:Object):void
		{
			var f:int = frame is String ? _frameLabels.indexOf(frame as String) : int(frame);
			gotoFrame( f );
			stop();
		}
		/**
		 * 从当期帧开始播放
		 */		
		public function play():void
		{
			if(_isLoaded)TimerServer.addLoop(renderFrame, _frameTime);
			_isPlaying = true;
		}
		/**
		 * 在当前帧停止播放
		 */		
		public function stop():void
		{
			TimerServer.remove(renderFrame);
			_isPlaying = false;
		}
		/**
		 * 为指定帧添加回调函数。注意：同一帧只能添加一个回调函数。后添加的回调函数将会覆盖之前的。
		 * @param frame 要添加回调的帧标签或者帧索引。
		 * @param callBack 回调函数。设置为null，将取消之前添加的回调函数。
		 */		
		public function addFrameScript(frame:Object,callBack:Function):void
		{
			if(_frameCalls == null)_frameCalls = new Dictionary();
			var f:int = frame is String ? _frameLabels.indexOf(frame as String) : int(frame);
			_frameCalls[f] = callBack;
			
			if(callBack == null)
			{
				delete _frameCalls[f];
			}
		}
		
		override public function dispose():void
		{
			_isLoaded = false;
			
			stop();
			TimerServer.remove(_loadNow);
			
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.removeEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			
			_frameLabels = null;
			_frameStyles = null;
			_frameCalls = null;
			_frameOffsets = null;
			
			super.dispose();
		}
	}
}