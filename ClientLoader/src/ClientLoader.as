package
{

	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.net.navigateToURL;
	import flash.system.IME;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 *
	 * 客户端载入的入口
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-3-31 上午10:15:32
	 *
	 */
	[SWF(width = "1600", height = "1000", backgroundColor = "0x000000", frameRate = "60", quality = "LOW")]
	public class ClientLoader extends Sprite
	{
		/** 加载的主程序地址 **/
		private const CLIENTSWF_PATH : String = "Client.swf";
		/**加载进度条**/
		private var _loadingView : LoadProgressView;
		private var _urlParmar : Object = null;
		private var _clientPathUrl : String = CLIENTSWF_PATH;
		private var _versionPath : String = "version#/version.swf";

		private var _decodeFun : Function;
		private var _versionMap : Object = null;
        
        private var _useVersion : Boolean = false;
        private var _isJson : Boolean = false;
        private var _useBpgFormat : Boolean = true;
        
        // web params
        /** 资源根目录*/
        private var _baseDir : String = "../";
        /** 客服端版本号*/
		private var _clientVersion : String = null;
		/** loader版本号*/
		private var _loaderVersion : String = "";
        /** 是否是正式版*/
		private var _isRelease : Boolean = false;
        /** 是否稳定版本*/
        private var _isStable : Boolean = false;
        /** 是否是版署版*/
        private var _isVersionDepartment : Boolean = false;
        /** 服务器ip*/
		private var _server : String = "";
        /** 服务器port*/
		private var _port : uint = 0;
        /** 服务器区服*/
        private var _areaId : uint = 1;
        /** 服务器policyPort*/
		private var _policyPort : uint = 0;
        /** 平台代理*/
        private var _agent : String = "37";
        /** 登录用户名*/
        private var _loginName : String = "";
        /** 登录用户Key*/
        private var _loginKey : String = "";
        /** 登录时间(s)*/
        private var _loginTime : uint = 0;
		/**
		 * 微端桥接
		 */
		public var GlobalBridge : Class = null;
		
		private var _key:String = "12,66,78";

		public function ClientLoader()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStg);
		}

		public function set baseDir(value : String) : void
		{
			_baseDir = value;
		}

		public function set clientVersion(value : String) : void
		{
			_clientVersion = value;
		}

		public function set loaderVersion(value : String) : void
		{
			_loaderVersion = value;
		}

		public function set isRelease(value : Boolean) : void
		{
			_isRelease = value;
		}

		public function set isJson(value : Boolean) : void
		{
			_isJson = value;
		}

		public function set policyPort(value : uint) : void
		{
			_policyPort = value;
		}

		public function set port(value : uint) : void
		{
			_port = value;
		}

		public function set server(value : String) : void
		{
			_server = value;
		}

		private function onAddToStg(e : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStg);

			_urlParmar = loaderInfo.parameters;
			if (ExternalInterface.available)
			{
				_urlParmar = ExternalInterface.call("config");
                if (null == _urlParmar) {
                    return;
                }
                if (_urlParmar["baseDir"]) {
                    _baseDir = _urlParmar["baseDir"];
                }
                if (_urlParmar["clientVersion"]) {
                    _clientVersion = _urlParmar["clientVersion"];
                }
                if (_urlParmar["loaderVersion"]) {
                    _loaderVersion = _urlParmar["loaderVersion"];
                }
                if (_urlParmar["isDebug"]) {
                    _isRelease = _urlParmar["isDebug"] != "true";
                }
                if (_urlParmar["isStable"]) {
                    _isStable = _urlParmar["isStable"] == "true";
                }
                if (_urlParmar["isVersionDepartment"]) {
                    _isVersionDepartment = _urlParmar["isVersionDepartment"] == "true";
                }
                if (_urlParmar["serverIp"]) {
                    _server = _urlParmar["serverIp"];
                }
                if (_urlParmar["serverPort"]) {
                    _port = uint(_urlParmar["serverPort"]);
                }
                if (_urlParmar["serverAreaId"]) {
                    _areaId = uint(_urlParmar["serverAreaId"]);
                }
                if (_urlParmar["serverPolicyPort"]) {
                    _policyPort = uint(_urlParmar["serverPolicyPort"]);
                }
                if (_urlParmar["auth"]) {
                    _loginName = _urlParmar["auth"];
                }
                if (_urlParmar["sign"]) {
                    _loginKey = _urlParmar["sign"];
                }
                if (_urlParmar["time"]) {
                    _loginTime = uint(_urlParmar["time"]);
                }
                if (_urlParmar["agent"]) {
                    _agent = _urlParmar["agent"];
                }
			}

			if (_loaderVersion)
			{
				_clientPathUrl = "loader_#/" + _clientPathUrl;
			}

			initStage();
			//initMenu();

			showLoadingUI();
			if (_clientVersion)
			{
				_useVersion = true;
				loadVersion();
			}
			else
			{
				_useVersion = false;
				startLoadClient();
			}
		}

		private function initStage() : void
		{
			//将黄色焦点框隐藏掉
			stage.stageFocusRect = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.LOW;
			stage.frameRate = 60;
			stage.focus = stage;
			IME.enabled = false;
			//
			//this.stage.addEventListener(MouseEvent.RIGHT_CLICK, onRightMosClick);
		}

		private function onRightMosClick(e : MouseEvent) : void
		{

		}

		private function initMenu() : void
		{
		/*var clearHcItem : ContextMenuItem = new ContextMenuItem("清空浏览器缓存");
		clearHcItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onSelectClearHc);
		var ver : String = Capabilities.version;
		contextMenu = new ContextMenu();
		contextMenu.hideBuiltInItems();
		contextMenu.customItems.push(new ContextMenuItem("Flash：" + ver));
		contextMenu.customItems.push(clearHcItem);*/
		}

		private function onSelectClearHc(e : Event) : void
		{
			navigateToURL(new URLRequest("http://清理缓存小常识.html"), "_blank");
		}

		private function showLoadingUI() : void
		{
			_loadingView = new LoadProgressView();
			_loadingView.show(stage);
			_loadingView.title = "Loading...";
			addChild(_loadingView);
		}

		private function loadVersion() : void
		{
			var loadingStream : URLStream = new URLStream();
			loadingStream.addEventListener(Event.COMPLETE, onVersionCmp);
			loadingStream.addEventListener(IOErrorEvent.IO_ERROR, onVersionIoError);
			loadingStream.addEventListener(ProgressEvent.PROGRESS, onFirstLoadingPrg);
			//
			var url : String = _versionPath.replace("#", _clientVersion);
			url = _baseDir + url;
			loadingStream.load(new URLRequest(url));
		}

		private function onVersionCmp(event : Event) : void
		{
			var loadingStream : URLStream = event.currentTarget as URLStream;
			loadingStream.removeEventListener(Event.COMPLETE, onVersionCmp);
			loadingStream.removeEventListener(IOErrorEvent.IO_ERROR, onVersionIoError);
			loadingStream.removeEventListener(ProgressEvent.PROGRESS, onFirstLoadingPrg);

			var bytes : ByteArray = new ByteArray();
			loadingStream.readBytes(bytes, 0, loadingStream.bytesAvailable);
			bytes.uncompress();
			bytes.endian = Endian.LITTLE_ENDIAN;
			_versionMap = readVersionsFromBuf(bytes);
			startLoadClient();
		}
		
		private function decodeFun(bytes:ByteArray):void
		{
			if (_isRelease)
			{
				bytes.uncompress();
				var key:String = bytes.readUTF();
				if (key == _key)
				{
					bytes.position = 10;
					var by:ByteArray = new ByteArray();
					bytes.readBytes(by);
					bytes.clear();
					bytes = by;
				}
				else
				{
					bytes.clear();
					bytes = null;
				}
			}
		}

		private function startLoadClient() : void
		{
			var loadingStream : URLStream = new URLStream();
			loadingStream.addEventListener(Event.COMPLETE, onClientLoadCmp);
			loadingStream.addEventListener(IOErrorEvent.IO_ERROR, onClientIoError);
			loadingStream.addEventListener(ProgressEvent.PROGRESS, onClientLoadingPrg);
			var clientPath : String = _decodeFun != null ? _clientPathUrl.replace(".swf", ".ml") : _clientPathUrl;
			var url : String = "";
			if (_loaderVersion)
			{
				clientPath = clientPath.replace("#", _loaderVersion);
				url = _baseDir + clientPath;
			}
			else
			{
				url = clientPath + "?" + Math.random().toFixed(5);
			}
			loadingStream.load(new URLRequest(url));
		}

		private function onFirstLoadingPrg(event : ProgressEvent) : void
		{
			_loadingView.percent = event.bytesLoaded / event.bytesTotal * 0.2;
		}

		private function onClientLoadingPrg(event : ProgressEvent) : void
		{
			_loadingView.percent = 0.2 + event.bytesLoaded / event.bytesTotal * 0.8;
		}

		private function onVersionIoError(event : IOErrorEvent) : void
		{
			_loadingView.title = "版本数据加载错误...";
		}

		private function onClientIoError(event : IOErrorEvent) : void
		{
			_loadingView.title = "程序加载错误...";
		}

		private function onIoError(event : IOErrorEvent) : void
		{
			_loadingView.title = "程序解析错误...";
		}

		private function onClientLoadCmp(event : Event) : void
		{
			var loadingStream : URLStream = event.currentTarget as URLStream;
			loadingStream.removeEventListener(Event.COMPLETE, onClientLoadCmp);
			loadingStream.removeEventListener(IOErrorEvent.IO_ERROR, onClientIoError);
			loadingStream.removeEventListener(ProgressEvent.PROGRESS, onFirstLoadingPrg);

			var bytes : ByteArray = new ByteArray();
			loadingStream.readBytes(bytes, 0, loadingStream.bytesAvailable);
			if (_decodeFun != null)
				bytes = _decodeFun(bytes);
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onClientLoaded);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			var context : LoaderContext = new LoaderContext();
			context.allowCodeImport = true;
			loader.loadBytes(bytes, context);
			loadingStream.close();
			loadingStream = null;
		}

		private function onClientLoaded(event : Event) : void
		{
			var loaderInfo : LoaderInfo = event.currentTarget as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, onClientLoaded);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			//
			var client : DisplayObject = loaderInfo.content;
            client["useVersion"] = _useVersion;
            client["versionMap"] = _versionMap;
            client["urlParmar"] = _urlParmar;
            client["useBpgFormat"] = _useBpgFormat;
            client["GlobalBridge"] = GlobalBridge;
            
            // web params
			client["baseDir"] = _baseDir;
			client["isRelease"] = _isRelease;
			client["isStable"] = _isStable;
            client["isBanShu"] = _isVersionDepartment;
			client["server"] = _server;
			client["port"] = _port;
            client["areaId"] = _areaId;
			client["policyPort"] = _policyPort;
			client["version"] = _clientVersion;
            client["agent"] = _agent;
            client["loginName"] = _loginName;
            client["loginKey"] = _loginKey;
            client["loginTime"] = _loginTime;
            
			this.stage.addChild(client);
			//
			loaderInfo.loader.unload();
			loaderInfo = null;

			if (_loadingView)
			{
				_loadingView.dispose();
				_loadingView = null;
			}
		}

		private function readString(buf : ByteArray) : String
		{
			var len : int = buf.readUnsignedByte();
			return buf.readMultiByte(len, "gb2312");
		}

		private function readVersionsFromBuf(buf : ByteArray) : Object
		{
			var ret : Object;
			if (_isJson)
			{
				var data : String = buf.readMultiByte(buf.bytesAvailable, "utf-8");
				ret = JSON.parse(data);
			}
			else
			{
				ret = {};
				var maxCountVer : int = buf.readUnsignedInt();
				ret.defaultVersion = maxCountVer;

				var rootPath : String = readString(buf);
				while (buf.bytesAvailable > 0)
				{
					var fileName : String = readString(buf);
					var fileVer : int = buf.readUnsignedInt();
					ret[rootPath + "/" + fileName] = fileVer;
				}
			}
			return ret;
		}
	}
}
