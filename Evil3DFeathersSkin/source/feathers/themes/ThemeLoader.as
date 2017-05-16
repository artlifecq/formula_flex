package feathers.themes
{
	import flash.events.ProgressEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import away3d.enum.LoadPriorityType;
	import away3d.events.Event;
	import away3d.events.TextureDataLoaderEvent;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.textures.ATFData;
	
	import starling.textures.AsyncStarlingTexture;
	import starling.textures.ConcreteTexture;
	import starling.textures.IStarlingTexture;
	
	import utils.TimerServer;

	/**
	 *
	 * 皮肤加载器
	 * 皮肤由两个文件组成，一: *.inf记录贴图信息; 二:*.xxx(atf, bpg, png, swf)为贴图文件
	 * @author wewell@163.com
	 */
	public class ThemeLoader
	{
		private static const FILE_INF:String = ".inf";
		private static const SPLICE:String = "\/";
		
		private var _url : String;
		private var _xml:XML;
		private var _textureUrl:String;
		private var _texture:IStarlingTexture;
		
		private var _onProgress:Function;
		private var _onError:Function;
		private var _onResolver : Function;
		
		private var _extensionName:String;
		private var _priority:int;
		
		private var _bytesLoaded:int;
		private var _bytesTotal:int;
		private var _infBytesTotal:int;
		private var _loadToken:MultiLoadData;
		
		public function ThemeLoader()
		{
		}
		
		public function load(url : String, onLoad : Function = null, onProgress : Function=null, onError:Function=null, priority:int = LoadPriorityType.LEVEL_2D_UI_DEFAULT) : void
		{
			_textureUrl = _url = url;
			_onResolver = onLoad;
			_onProgress = onProgress;
			_onError = onError;
			_priority = priority;
			
			_textureUrl = GuiTheme.checkAddExtensionName(_textureUrl);
			
			loadInf();
		}
		
		public function setInfoExtensionName(name:String):void
		{
			_extensionName = name;
		}
		
		private function loadInf():void
		{
			var paths:Array = _url.split(SPLICE);
			var name:String = fileName(_url);
			_extensionName = _extensionName ||  FILE_INF;
			paths[paths.length-1] = name + _extensionName;
			
			var infPath:String = paths.join(SPLICE);
			
			_loadToken = new MultiLoadData(infPath, onInfLoad, onInfFileProgress, _onError, "","",_priority, URLLoaderDataFormat.BINARY);
			MultiUrlLoadManager.load(_loadToken);
			CONFIG::Starling_Debug
				{
					tracing("load inf:", infPath);
				}
		}
		
		private var _numRetryUncompress:int;
		private function onInfLoad(ld : MultiLoadData, event : flash.events.Event) : void
		{
			var bytes:ByteArray = (event.currentTarget).data;
			try
			{
				bytes.position = 0;
				if(_extensionName == FILE_INF )bytes.uncompress();
			} 
			catch(error:Error) 
			{
				throw new Error("ThemeLoader  Error! Repeated requests or invalid file：",  ld.url );
				return;
			}
		
			bytes.position = 0;
			var xml:XML = XML(bytes.readUTFBytes(bytes.length));
			_xml = xml;
			
			
			if(_textureUrl.indexOf(".atf") > 0)
			{
				var atfToken:MultiLoadData = new MultiLoadData(_textureUrl, onAtfLoad, onAtfFileProgress, _onError, "","",_priority, URLLoaderDataFormat.BINARY);
				MultiUrlLoadManager.load(atfToken);
			}else
			{
				var texture:ConcreteTexture = new ConcreteTexture(false,false,true,false);
				texture.addEventListener(away3d.events.Event.COMPLETE,onBitmapTextureComplete);
				texture.addEventListener(TextureDataLoaderEvent.LOAD_PROGRESS, onBitmapFileProgress);
				texture.load(_textureUrl, _priority);
			}
		}
		
		private function onBitmapTextureComplete(e:away3d.events.Event):void
		{
			var texture:ConcreteTexture = e.currentTarget as ConcreteTexture;
			texture.removeEventListener(away3d.events.Event.COMPLETE,onBitmapTextureComplete);
			texture.removeEventListener(TextureDataLoaderEvent.LOAD_PROGRESS, onBitmapFileProgress);
			GuiTheme.ins.pushTexture(_url, texture, _xml);
			TimerServer.callAfterFrame(dispatchCompleteEvent);
		}
		
		private function onBitmapFileProgress(event:TextureDataLoaderEvent):void
		{
			_bytesLoaded = event.bytesLoaded + _infBytesTotal;
			_bytesTotal = event.bytesTotal + _infBytesTotal;
			dispacthProgressEvent();
		}
		
		private function onAtfFileProgress(loader:MultiLoadData, event:ProgressEvent):void
		{
			_bytesLoaded = event.bytesLoaded + _infBytesTotal;
			_bytesTotal = event.bytesTotal + _infBytesTotal;
			dispacthProgressEvent();
		}
		
		private function onAtfLoad(ld : MultiLoadData, event : flash.events.Event) : void
		{
			var bytes:ByteArray = (event.currentTarget).data;
			bytes.position = 0;
			var atfTexture:IStarlingTexture;
			if(GuiTheme.ATF_ASYNC_UPLOAD)
			{
				atfTexture = new AsyncStarlingTexture(bytes, ld.url, false, true);
				_texture = atfTexture;
				if(!AsyncStarlingTexture(atfTexture).isReady)
					atfTexture.addEventListener(Event.TEXTURE_READY, onTextureReady);
			}else{
				var atfData:ATFData = new ATFData(bytes, false);
				var concreteTexture:ConcreteTexture = new ConcreteTexture(false, atfData.compressed, atfData.hasAlpha, false); 
				concreteTexture.textureData = atfData;
				concreteTexture.url = ld.url;
				_texture = concreteTexture;
				onTextureReady();
			}
		}
		
		private function onATFTextureComplete(e:away3d.events.Event):void
		{
			var texture:ConcreteTexture = e.currentTarget as ConcreteTexture;
			texture.removeEventListener(away3d.events.Event.COMPLETE,onATFTextureComplete);
			GuiTheme.ins.pushTexture(_url, texture, _xml);
			TimerServer.callAfterFrame(dispatchCompleteEvent);
		}
		
		private function onInfFileProgress(loader:MultiLoadData, event:ProgressEvent):void
		{
			_bytesLoaded = event.bytesLoaded;
			_bytesTotal = _infBytesTotal = event.bytesTotal;
		}
		
		private function dispacthProgressEvent():void
		{
			if(_onProgress != null)
			{
				_onProgress(_bytesLoaded/_bytesTotal);
			}
		}
		
		private function onTextureReady(e:away3d.events.Event=null):void
		{
			_texture.removeEventListener(Event.TEXTURE_READY, onTextureReady);
			if(!_texture.disposed)
			{
				GuiTheme.ins.pushTexture(_url, _texture, _xml);
				TimerServer.callAfterFrame(dispatchCompleteEvent);
			}
		}
		
		private function dispatchCompleteEvent():void
		{
			if (_onResolver != null)
				_onResolver(this);
			
			_loadToken = null;
			_onResolver = null;
			_onProgress = null;
			_onError = null;
			_extensionName = null;
		}
		
		/**
		 * 获取文件名
		 */		
		private static function fileName(path:String):String
		{
			path = path.split("?")[0];
			var i1:int = path.lastIndexOf("/");
			var i2:int = path.lastIndexOf(".");
			path =  path.substring(i1+1,i2);
			var i3:int = path.indexOf(".");
			if(i3 > 0)
			{
				path = path.substring(0, i3);
			}
			return path;
		}
		
		public function dispose() : void
		{
			if (_textureUrl)
			{
				MultiUrlLoadManager.cancelLoadByUrl(_textureUrl);
				_textureUrl = null;
			}
			if (_url)
			{
				GuiTheme.ins.popTexture(_url);
				_url = null;
			}
			TimerServer.remove(dispatchCompleteEvent);
			
			_loadToken = null;
			_onResolver = null;
			_onProgress = null;
			_onError = null;
			_xml = null;
			_loadToken = null;
			_url = null;
			_extensionName = null;
		}
	}
}
