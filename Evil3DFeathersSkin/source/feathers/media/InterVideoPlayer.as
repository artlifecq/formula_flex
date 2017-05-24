package feathers.media
{
	import flash.display.BitmapData;
	import flash.display3D.Context3D;
	import flash.events.NetStatusEvent;
	import flash.geom.Point;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import feathers.themes.GuiTheme;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import away3d.events.Event;
	import starling.rendering.Painter;
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureFactory;
	
	import utils.TimerServer;
	
	/**
	 *
	 * 内嵌的StageVideo播放类
	 * 
	 * @todo
	 * 与界面层交叉嵌套
	 * wewell@163.com
	 */
	
	public class InterVideoPlayer extends DisplayObjectContainer  implements IMediaPlayer
	{
		/**
		 *	开始播放 
		 */		
		public static const NETSTATUS_PLAY_START:String = "NetStream.Play.Start";
		/**
		 *	缓冲 
		 */		
		public static const NETSTATUS_PLAY_BUFFER:String = "NetStream.Buffer.Empty";
		/**
		 *	播放完毕 
		 */		
		public static const NETSTATUS_PLAY_COMPLETE:String = "NetStream.Play.Stop";
		/**
		 * IO错误 
		 */		
		public static const NETSTATUS_IO_ERROR:String = "NetStream.Play.StreamNotFound";
		
		/**
		 * 缓冲区被刷新
		 */
		public static const NETSTATUS_BUFFER_FLUSH:String = "NetStream.Buffer.Flush";
		
		/**
		 * 缓冲区已满
		 */
		public static const  NETSTATUS_BUFFER_FULL:String = "NetStream.Buffer.Full";
		
		public static const SHOW_MODE_STAGEVIDEO:String = "stageVideo";
		
		public static const SHOW_MODE_INTER:String = "inter";
		
		private var _width:Number=0;
		private var _height:Number=0;
		private var _bufferTime:Number=1;
		private var _netConnection:NetConnection;
		private var _video:Video;
		private var _netStream:NetStream;
		private var _url:String;
		private var _localPoint:Point;
		private var _globalPoint:Point;
		private var  _showMode:String;
		private var _videoBmd:BitmapData;
		private var _videoTexture:IStarlingTexture;
		private var _videoImage:Image;
		private var _isPlaying:Boolean;
		private var _isPause:Boolean;
		
		public var onNetStatusFunction:Function;
		
		/**
		 *	 
		 * @param $width 
		 * @param $height
		 * @param $bufferTime  缓冲时间
		 * 
		 */		
		public function InterVideoPlayer($width:Number=320,$height:Number=240, mode:String="inter", $bufferTime:Number=0)
		{
			_video = new Video($width, $height);
			_video.opaqueBackground = 0x000000;
			_localPoint = new Point();
			_globalPoint = new Point();
			
			this.width = $width;
			this.height = $height;
			_bufferTime = $bufferTime;
			setShowMode(mode);
			
			_netConnection = new NetConnection();
			_netConnection.connect(null);
			
			_netStream = new NetStream(_netConnection);
			_netStream.bufferTime = _bufferTime;
			_netStream.client = {};
			
//			this.addEventListener(Event.ADDED_TO_STAGE,addToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeFromStage);
		}
		
/*		private function addToStage(evt:Event):void
		{
			if(_isPause)
			{
				resume();
			}else
			{
				play(_url);
			}
		}*/
		
		private function setShowMode(mode:String):void
		{
			_showMode = mode;
			
			if(_showMode == SHOW_MODE_STAGEVIDEO)
			{
				Starling.current.nativeStage.addChildAt(_video, 0);
				
			}else if(_showMode == SHOW_MODE_INTER)
			{
				_videoBmd = new BitmapData(_width, _height);
			}
		}
		
		public function play(url:String):void
		{
			if(GuiTheme.isErrorStr(url))return;
			
			if(_netStream != null)
			{
				_netStream.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
				_netStream.play(url);
				
				//screen
				_video.width = _width;
				_video.height = _height;
				_video.smoothing = true;
				_video.attachNetStream(_netStream);
				
				//如果暂停则恢复播放
				if(_isPause)resume();
			}
			_url = url;
		}
		
		public function pause():void
		{
			_isPause = true;
			if(_netStream != null)
			{
				_netStream.pause();
				stopRenderFame();
			}
		}
		
		public function resume():void
		{
			_isPause = false;
			if(_netStream != null)
			{
				_netStream.resume();
				startRenderFrame();
			}
		}
		
		public function close():void
		{
			if(_netStream != null)
			{
				_netStream.close();
				stopRenderFame();
			}
		}
		
		private function onNetStatus(evt:NetStatusEvent):void
		{
			trace(evt.info.code);
			switch(evt.info.code)
			{
				case NETSTATUS_PLAY_START:
					_netStream.seek(0);
					trace("video start time:"+_netStream.time);
					startRenderFrame();
					break;
				case NETSTATUS_PLAY_BUFFER:
				case NETSTATUS_BUFFER_FULL:
				case NETSTATUS_BUFFER_FLUSH:
					break;
				case NETSTATUS_PLAY_COMPLETE:
					trace("video stop time:"+_netStream.time);
					play(_url);
					break;
				case NETSTATUS_IO_ERROR:
					stopRenderFame();
					break;
			}
			if(onNetStatusFunction != null)
			{
				onNetStatusFunction(evt.info.code);
			}
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
			if(!_video || context == null || context.driverInfo == "Disposed")return;
			
			_videoBmd.draw(_video);
			var lastTextrue:IStarlingTexture = _videoTexture;
			_videoTexture = TextureFactory.fromBitmapData(_videoBmd, false);
			_videoTexture.root.uploadBitmapData(_videoBmd);
			
			if(_videoImage == null)
			{
				_videoImage = new Image(_videoTexture);
				this.addChild(_videoImage);
			}
			_videoImage.width = _width;
			_videoImage.height = _height;
			_videoImage.texture = _videoTexture;
			
			if(lastTextrue != null)
			{
				lastTextrue.root.dispose();
			}
		}
		
		override public function set width(value:Number):void
		{
			super.width = _width = value;
			if(_video)
			{
				_video.width = value;
			}
		}
		
		override public function set height(value:Number):void
		{
			super.height = _height = value;
			if(_video)
			{
				_video.height = value;
			}
		}
		
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}
		
		private function updateView():void
		{
			if(!_video)return;
			
			_video.x = _globalPoint.x;
			_video.y = _globalPoint.y;
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
			if(_video.parent)_video.parent.removeChild(_video);
//			this.removeEventListener(Event.ADDED_TO_STAGE,addToStage);
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeFromStage);
			_netStream.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			_netStream.close();
			if(_videoBmd)
			{
				_videoBmd.dispose();
			}
			_videoBmd = null;
			if(_videoTexture != null)
			{
				_videoTexture.root.dispose();
			}
			_videoBmd = null;
			_netStream = null;
			_video = null;
			_url = null;
		}
		
	}
}



