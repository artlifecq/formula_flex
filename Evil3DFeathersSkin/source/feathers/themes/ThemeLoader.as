package feathers.themes
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.ByteArray;
	
	import away3d.events.Event;
	import away3d.events.TextureDataLoaderEvent;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	
	import starling.textures.ConcreteTexture;
	
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
		private var _textureFormat:int;
		
		private var _onProgress:Function;
		private var _onError:Function;
		private var _onResolver : Function;
		
		private var _needBitmapData:Boolean = false;
		private var _extensionName:String;
		private var _priority:int;
		
		private var _bytesLoaded:int;
		private var _bytesTotal:int;
		private var _infBytesTotal:int;
		private var _loadToken:MultiLoadData;
		
		public function ThemeLoader(needBitmapData:Boolean=false)
		{
			_needBitmapData = needBitmapData;
		}
		
		public function load(url : String, onLoad : Function = null, onProgress : Function=null, onError:Function=null, priority:int = 1000) : void
		{
			_textureUrl = _url = url;
			_onResolver = onLoad;
			_onProgress = onProgress;
			_onError = onError;
			_priority = priority;
			
			_textureUrl = GuiTheme.checkAddExtensionName(_textureUrl);
			
			if(GuiTheme.decodeURL != null)
			{
				_textureUrl = GuiTheme.decodeURL(_textureUrl);
			}
			
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
			if(GuiTheme.decodeURL != null)
			{
				infPath = GuiTheme.decodeURL(infPath);
			}
			
			_loadToken = new MultiLoadData(infPath, onInfLoad, onInfFileProgress, _onError, "", "", _priority, "binary");
			MultiUrlLoadManager.load(_loadToken);
			
//			MultiUrlLoadManager.load(new MultiLoadData(infPath, onInfLoad, _onProgress, _onError, "","",_priority, URLLoaderDataFormat.BINARY));
			CONFIG::Starling_Debug
				{
					tracing("load inf:", infPath);
				}
		}
		
		private function onInfLoad(ld : MultiLoadData, event : flash.events.Event) : void
		{
			var bytes:ByteArray = (event.currentTarget).data;
			if(_extensionName == FILE_INF )bytes.uncompress();
			var xml:XML = XML(bytes.readUTFBytes(bytes.length));
			_xml = xml;

			var texture:ConcreteTexture = new ConcreteTexture();
			texture.addEventListener(away3d.events.Event.COMPLETE,onTextureComplete);
			texture.addEventListener("loadProgress", onDataFileProgress);
			texture.load(_textureUrl);
		}
		
		private function onInfFileProgress(loader:MultiLoadData, event:ProgressEvent):void
		{
			_bytesLoaded = event.bytesLoaded;
			_infBytesTotal = event.bytesTotal;
			_bytesTotal = event.bytesTotal;
		}
		
		private function onDataFileProgress(event:TextureDataLoaderEvent):void
		{
			_bytesLoaded = (event.bytesLoaded + _infBytesTotal);
			_bytesTotal = (event.bytesTotal + _infBytesTotal);
			dispacthProgressEvent();
		}
		
		private function dispacthProgressEvent():void
		{
			if (_onProgress != null)
			{
				_onProgress(_bytesLoaded / _bytesTotal);
			}
		}
		
		private function onTextureComplete(e:away3d.events.Event):void
		{
			var texture:ConcreteTexture = e.currentTarget as ConcreteTexture;
			texture.removeEventListener(away3d.events.Event.COMPLETE,onTextureComplete);
			GuiTheme.ins.pushTexture(_url, texture, _xml);
			
			TimerServer.callAfterFrame(dispatchCompleteEvent);
		}
		
		private function dispatchCompleteEvent():void
		{
			if (_onResolver != null)
			{
				_onResolver(this);
			}
			_loadToken = null;
			_onResolver = null;
			_onProgress = null;
			_onError = null;
		}
		
		/**
		 * 获取文件名
		 */		
		public static function fileName(path:String):String
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
		
		public function dispose():void
		{
			if (_textureUrl)
			{
				MultiUrlLoadManager.cancelLoadByUrl(_textureUrl);
				_textureUrl = null;
			}
			if (_url)
			{
				GuiTheme.ins.popBitmapTexture(_url);
				_url = null;
			}
			TimerServer.remove(dispatchCompleteEvent);
			_onResolver = null;
			_onProgress = null;
			_onError = null;
			_xml = null;
			_loadToken = null;
		}
	}
}
