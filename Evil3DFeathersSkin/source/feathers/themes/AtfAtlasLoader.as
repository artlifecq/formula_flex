package feathers.themes
{
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import away3d.events.Event;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.log.Log;
	import away3d.textures.ATFData;
	
	import starling.textures.AsyncStarlingTexture;
	import starling.textures.ConcreteTexture;
	import starling.textures.IStarlingTexture;
	
	import utils.TimerServer;
	
	/**
	 *
	 * atfx文件加载器
	 * atfx由两个文件组成，一: *.xml记录贴图信息; 二:*.atf( bpg, png)为贴图文件,二者打包为一个ByteArray
	 * @author wewell@163.com
	 */
	public class AtfAtlasLoader
	{
		private static const UI_ATF_ATLAS_HEAD:int = 3721;
		private static const FILE_ATFX:String = ".atfx";
		private static const QUESTION_MARK:String = "?";
		
		private var _url : String;
		private var _xml:XML;
		private var _textureUrl:String;
		private var _texture:IStarlingTexture;
		
		private var _onProgress:Function;
		private var _onError:Function;
		private var _onResolver : Function;
		
		public function AtfAtlasLoader()
		{
		}
		
		public function load(url : String, onLoad : Function = null, onProgress : Function=null, onError:Function=null, priority:int = 6000) : void
		{
			_textureUrl = _url = url;
			_onResolver = onLoad;
			_onProgress = onProgress;
			_onError = onError;
			
			var i:int = _textureUrl.indexOf(QUESTION_MARK);
			
			if(i > 0)
			{
				_textureUrl = _textureUrl.replace(QUESTION_MARK, FILE_ATFX+QUESTION_MARK);
			}
			else
			{
				_textureUrl += FILE_ATFX;
			}
			
			var loadToken:MultiLoadData = new MultiLoadData(_textureUrl, onAtfLoad, _onProgress, _onError, "","",priority, URLLoaderDataFormat.BINARY);
			MultiUrlLoadManager.load(loadToken);
			CONFIG::Starling_Debug
				{
					trace("load atfxPath:", _textureUrl);
				}
		}
		
		private function onAtfLoad(ld : MultiLoadData, event : *) : void
		{
			var bytes:ByteArray = (event.currentTarget).data;
			bytes.position = 0;
			var head:int = bytes.readInt();
			if(head == UI_ATF_ATLAS_HEAD)
			{
				var len:int = bytes.readInt();
				var fileBytes:ByteArray = new ByteArray();
				bytes.readBytes(fileBytes, 0, len);
				fileBytes.uncompress();
				
				_xml = XML(fileBytes.readUTFBytes(fileBytes.length));
				
				len = bytes.readInt();
				fileBytes.clear();
				var atfBytes:ByteArray = new ByteArray();
				bytes.readBytes(atfBytes, 0, len);
				
				fileBytes.position = 0;
				var atfTexture:IStarlingTexture;
				if(GuiTheme.ATF_ASYNC_UPLOAD)
				{
					atfTexture = new AsyncStarlingTexture(atfBytes, ld.url, false, true);
					_texture = atfTexture;
					if(!AsyncStarlingTexture(atfTexture).isReady)
						atfTexture.addEventListener(Event.TEXTURE_READY, onTextureReady);
						
				}else{
					var atfData:ATFData = new ATFData(atfBytes, false);
					var concreteTexture:ConcreteTexture = new ConcreteTexture(false, atfData.compressed, atfData.hasAlpha, false); 
					concreteTexture.textureData = atfData;
					_texture = concreteTexture;
					onTextureReady();
				}
			}else
			{
				var message:String = "AtfAtlasLoader  Error! invalid file：" + ld.url;
				trace(message );
				CONFIG::Debug
					{
						Log.error(message);
					}
			}
		}
		
		private function onATFTextureComplete(e:away3d.events.Event):void
		{
			var texture:ConcreteTexture = e.currentTarget as ConcreteTexture;
			texture.removeEventListener(away3d.events.Event.COMPLETE,onATFTextureComplete);
			GuiTheme.ins.pushTexture(_url, texture, _xml);
			TimerServer.callAfterFrame(dispatchCompleteEvent);
		}
		
		private function onTextureReady(e:away3d.events.Event = null):void
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
			
			_onResolver = null;
			_onProgress = null;
			_onError = null;
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
			
			_onResolver = null;
			_onProgress = null;
			_onError = null;
		}
	}
}

