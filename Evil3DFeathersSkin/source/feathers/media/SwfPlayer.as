package feathers.media
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display3D.Context3D;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.loaders.multi.MultiUrlLoader;
	
	import feathers.themes.GuiTheme;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.events.Event;
	import starling.rendering.Painter;
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureFactory;
	
	import utils.TimerServer;
	
	/**
	 *
	 * 内嵌的swf播放类
	 * 
	 * @todo
	 * 与界面层交叉嵌套
	 * wewell@163.com
	 */
	
	public class SwfPlayer extends DisplayObjectContainer  implements IMediaPlayer
	{
		public static const SHOW_MODE_STAGEVIDEO:String = "stageVideo";
		
		public static const SHOW_MODE_INTER:String = "inter";
		
		private var _swfVideo:MovieClip;
		private var _width:Number=0;
		private var _height:Number=0;
		private var _url:String;
		private var _localPoint:Point;
		private var _globalPoint:Point;
		private var  _showMode:String;
		private var _swfVideoBmd:BitmapData;
		private var _swfVideoTexture:IStarlingTexture;
		private var _swfVideoImage:Image;
		private var _isPlaying:Boolean;
		private var _isPause:Boolean;
		
		private var _isLoading:Boolean = false;
		
		private var _repeat:int = 0;
		private var _repeatCompleteTimes:int = 0;
		
		
		/**
		 *	 
		 * @param $width 
		 * @param $height
		 * @param $bufferTime  缓冲时间
		 * 
		 */		
		public function SwfPlayer($width:Number=320,$height:Number=240, mode:String="inter")
		{
			_localPoint = new Point();
			_globalPoint = new Point();
			
			this.width = $width;
			this.height = $height;
			setShowMode(mode);
			
			this.addEventListener(Event.ADDED_TO_STAGE,addToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeFromStage);
		}
		
		public function get repeat():int
		{
			return _repeat;
		}

		public function set repeat(value:int):void
		{
			_repeat = value;
		}

		private function addToStage(evt:Event):void
		{
			if(_isPause)
			{
				resume();
			}else
			{
				play(_url);
			}
		}
		
		private function setShowMode(mode:String):void
		{
			_showMode = mode;
			
			if(_showMode == SHOW_MODE_STAGEVIDEO)
			{
				Starling.current.nativeStage.addChildAt(_swfVideo, 0);
				
			}else if(_showMode == SHOW_MODE_INTER)
			{
				_swfVideoBmd = new BitmapData(_width, _height);
			}
		}
		
		public function play(url:String, decode:Function = null):void
		{
			if(GuiTheme.isErrorStr(url))return;
			
			_url = url;
			_isPlaying = true;
			_isPause = false;
			
			if(_swfVideo != null)
			{
				_swfVideo.gotoAndPlay(1);
				startRenderFrame();
			}else if(!_isLoading)
			{
				_isLoading = true;
				var ld:MultiLoadData = new MultiLoadData(_url,onLoadUrlComplete,null,onIoError,"","",0,MultiLoadData.URLLOADER_BINARY,decode);
				MultiUrlLoadManager.load(ld);
			}
		}
		
		private function onLoadUrlComplete(ld:MultiLoadData, e:*):void
		{
			var multiLoader:MultiUrlLoader = e.target as MultiUrlLoader;
			var fileBytes:ByteArray = multiLoader.data as ByteArray;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoaderLoadBytesComplete);
			var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
			if(loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true; 
			}
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
			loader.loadBytes(fileBytes,loaderContext);
		}
		
		private function onIOError(event:IOErrorEvent):void
		{
			trace("SwfPlayer:loadBytes Error!:",event.text);
		}
		
		private function onLoaderLoadBytesComplete(event:*):void
		{
			var loaderInfo:LoaderInfo = event.target as LoaderInfo;
			var targetDis:MovieClip = loaderInfo ? loaderInfo.content as MovieClip : null;
			if(!targetDis)
			{
				trace("SwfPlayer:contentLoaderInfo.content Error! MovieClip  is invalid!!!");
				return;
			}
			if(targetDis.totalFrames > 1)
			{
				_swfVideo = targetDis;
			}else
			{
				_swfVideo = targetDis.getChildAt(0) as MovieClip;
			}
			
			if(!_swfVideo)
			{
				throw new Error("无效的swf,请检查舞台中是否含有视频");
			}
			
			if(_showMode == SHOW_MODE_STAGEVIDEO)
			{
				Starling.current.nativeStage.addChildAt(_swfVideo, 0);
			}else if(_showMode == SHOW_MODE_INTER)
			{
				if(_swfVideoBmd == null)
				{
					_swfVideoBmd = new BitmapData(_width, _height);
				}
			}
			_isLoading = false;
			
			if(_isPlaying)
			{
				_swfVideo.gotoAndPlay(1);
				startRenderFrame();
			}
			
			this.dispatchEventWith(Event.READY);
		}
		
		private function onIoError(ld:MultiLoadData, e:*):void
		{
			trace("onIoError", ld.url);
			this.dispatchEventWith(Event.IO_ERROR);
		}
		
		public function cancelLoad():void
		{
			_isLoading = false;
			MultiUrlLoadManager.cancelLoadByUrl(_url);
			this.dispatchEventWith(Event.CANCEL);
		}
		
		public function pause():void
		{
			_isPause = true;
			if(_swfVideo)_swfVideo.stop();
			stopRenderFame();
		}
		
		public function resume():void
		{
			_isPause = false;
			if(_swfVideo)_swfVideo.play();
			startRenderFrame();
		}
		
		public function close():void
		{
			if(_swfVideo)_swfVideo.stop();
			stopRenderFame();
		}
		
		private function startRenderFrame():void
		{
			if(_showMode != "inter")return;
			TimerServer.addLoop(renderNextFrame, 1000/25);
			_isPlaying = true;
		}
		
		private function stopRenderFame():void
		{
			if(_showMode != "inter")return;
			TimerServer.remove(renderNextFrame);
			_isPlaying = false;
		}
		
		private function renderNextFrame():void
		{
			var context:Context3D = Starling.current.context;
			if(!_swfVideo || context == null || context.driverInfo == "Disposed")return;
			var i:int = TimerServer.loopCount(renderNextFrame)%_swfVideo.totalFrames;
			
			//视频mc有个bug,即play()之后,isPlaying为true,但是currentFrame一直为1,直到再次调用play()
			if(_swfVideo.currentFrame == 1 && i > 1)
			{
				_swfVideo.play();
			}
			if(_swfVideo.currentFrame == _swfVideo.totalFrames && _repeat > 0)
			{
				_repeatCompleteTimes ++;
				if(_repeatCompleteTimes >= _repeat)
				{
					_repeatCompleteTimes = 0;
					close()
					dispatchEventWith(Event.COMPLETE);
					return ;
				}
			}
			
			_swfVideoBmd.draw(_swfVideo);
			var lastTextrue:IStarlingTexture = _swfVideoTexture;
			_swfVideoTexture = TextureFactory.fromBitmapData(_swfVideoBmd, false,false,"bgra",false);
			
			if(_swfVideoImage == null)
			{
				_swfVideoImage = new Image(_swfVideoTexture);
				this.addChild(_swfVideoImage);
			}
			_swfVideoImage.width = _width;
			_swfVideoImage.height = _height;
			_swfVideoImage.texture = _swfVideoTexture;
			
			if(lastTextrue != null)
			{
				lastTextrue.root.dispose();
			}
		}
		
		override public function set width(value:Number):void
		{
			super.width = _width = value;
			if(_swfVideo)
			{
				_swfVideo.width = value;
			}
		}
		
		override public function set height(value:Number):void
		{
			super.height = _height = value;
			if(_swfVideo)
			{
				_swfVideo.height = value;
			}
		}
		
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}
		
		private function updateView():void
		{
			if(!_swfVideo)return;
			
			_swfVideo.x = _globalPoint.x;
			_swfVideo.y = _globalPoint.y;
		}
		
		public override function render(painter:Painter):void
		{
			super.render(painter);
			
			if(_showMode == SHOW_MODE_STAGEVIDEO)
			{
				_localPoint.x = this.x;
				_localPoint.y = this.y;
				if(this.parent != null)
				{
					this.parent.localToGlobal(_globalPoint, _globalPoint);
				}else
				{
					localToGlobal(_localPoint,_globalPoint);
				}
				updateView();
			}
		}
		
		private function removeFromStage(evt:Event):void
		{
			stopRenderFame();
		}
		
		override public function dispose():void
		{
			cancelLoad();
			if(_swfVideo.parent)_swfVideo.parent.removeChild(_swfVideo);
			this.removeEventListener(Event.ADDED_TO_STAGE,addToStage);
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeFromStage);
			_swfVideo.stop();
			if(_swfVideoBmd)
			{
				_swfVideoBmd.dispose();
			}
			_swfVideoBmd = null;
			if(_swfVideoTexture != null)
			{
				_swfVideoTexture.root.dispose();
			}
			_swfVideoBmd = null;
			_swfVideo = null;
			_url = null;
		}
		
	}
}




