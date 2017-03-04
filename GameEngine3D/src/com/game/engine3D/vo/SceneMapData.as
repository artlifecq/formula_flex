package com.game.engine3D.vo
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.game.mainCore.libCore.share.CountShareData;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display3D.Context3DTextureFormat;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import away3d.events.Event;
	
	import org.client.load.loader.multi.DobjLoadManager;
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.loader.DobjLoader;
	import org.client.load.loader.multi.loader.UrlLoader;
	import org.client.load.loader.multi.vo.LoadData;
	
	import starling.textures.ConcreteTexture;
	import starling.textures.IStarlingTexture;
	import starling.textures.SubTexture;
	import starling.textures.TextureFactory;
	
	/**
	 *
	 * 场景地图数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-13 下午1:26:38
	 *
	 */
	public class SceneMapData extends CountShareData
	{
		private var _mapName : String = null;
		private var _mapDataUrl : String = null;
		private var _miniMapUrl : String = null;
		private var _radarMapUrl : String = null;
		private var _materialDescUrl : String = null;
		private var _useBitmapData : Boolean = false;
		private var _completeHandlerSet : Vector.<Function>;
		private var _errorHandlerSet : Vector.<Function>;
		private var _mapData : ByteArray = null;
		private var _miniMapData : BitmapData = null;
		private var _miniMapLoader : ConcreteTexture = null;
		private var _miniMapConcreteTexture : IStarlingTexture = null;
		private var _miniMapTexture : IStarlingTexture = null;
		private var _miniMapTextureRect : Rectangle = null;
		private var _miniMapCompleteFuncSet : Vector.<Function>;
		private var _miniMapErrorFuncSet : Vector.<Function>;
		private var _radarMapData : BitmapData = null;
		private var _radarMapLoader : ConcreteTexture = null;
		private var _radarMapConcreteTexture : IStarlingTexture = null;
		private var _radarMapTexture : IStarlingTexture = null;
		private var _radarMapTextureRect : Rectangle = null;
		private var _radarMapCompleteFuncSet : Vector.<Function>;
		private var _radarMapErrorFuncSet : Vector.<Function>;
		private var _materialDescCompleteFuncSet : Vector.<Function>;
		private var _materialDescErrorFuncSet : Vector.<Function>;
		private var _materialDescData : BitmapData = null;
		private var _clientMapData : ClientMapData;
		private var _isMiniMapLoading : Boolean = false;
		private var _isRadarMapLoading : Boolean = false;
		private var _isMaterialDescLoading : Boolean = false;
		
		public function SceneMapData(mapName : String, mapDataUrl : String, useBitmapData : Boolean = false)
		{
			_mapName = mapName;
			_mapDataUrl = mapDataUrl;
			_useBitmapData = useBitmapData;
			_completeHandlerSet = new Vector.<Function>();
			_errorHandlerSet = new Vector.<Function>();
			_miniMapCompleteFuncSet = new Vector.<Function>();
			_miniMapErrorFuncSet = new Vector.<Function>();
			_radarMapCompleteFuncSet = new Vector.<Function>();
			_radarMapErrorFuncSet = new Vector.<Function>();
			_materialDescCompleteFuncSet = new Vector.<Function>();
			_materialDescErrorFuncSet = new Vector.<Function>();
		}
		
		public function load() : void
		{
			var url : String = _mapDataUrl;
			if (GlobalConfig.version != null)
			{
				url = GlobalConfig.version(url);
			}
			_mapDataUrl = url;
			var ld : LoadData = new LoadData(_mapDataUrl, onMapDataComplete, null, onMapDataError, "", "", uint.MAX_VALUE, LoadData.URLLOADER_BINARY);
			UrlLoadManager.load(ld);
		}
		
		private function onMapDataComplete(ld : LoadData, e : flash.events.Event) : void
		{
			var loader : UrlLoader = e.currentTarget as UrlLoader;
			var byteArr : ByteArray = loader.data as ByteArray;
			byteArr.uncompress();
			_mapData = byteArr;
			_mapData.position = 0;
			_clientMapData = new ClientMapData();
			_clientMapData.readFrom(_mapData);
			loadComplete();
		}
		
		private function onMapDataError(ld : LoadData, e : flash.events.Event) : void
		{
			loadError();
		}
		
		public function loadMiniMap(miniMapUrl : String, rect : Rectangle) : void
		{
			_isMiniMapLoading = true;
			_miniMapUrl = miniMapUrl;
			_miniMapTextureRect = rect;
			if (_useBitmapData)
			{
				var ld : LoadData = new LoadData(_miniMapUrl, onMiniMapComplete, null, onMiniMapError, "", "", int.MAX_VALUE, LoadData.LOADER_DISPLAYOBJECT, GlobalConfig.decode);
				DobjLoadManager.load(ld);
			}
			else
			{
				_miniMapLoader = TextureFactory.fromUrl(_miniMapUrl, false, false, Context3DTextureFormat.COMPRESSED_ALPHA) as ConcreteTexture;
				_miniMapLoader.addEventListener(away3d.events.Event.COMPLETE, onMiniMapCompleteHandler);
			}
		}
		
		private function onMiniMapComplete(ld : LoadData, e : flash.events.Event) : void
		{
			_miniMapData = ((e.target as DobjLoader).content as Bitmap).bitmapData;
			for each (var handler : Function in _miniMapCompleteFuncSet)
			{
				handler(this);
			}
			_miniMapCompleteFuncSet.length = 0;
			_miniMapErrorFuncSet.length = 0;
			_isMiniMapLoading = false;
		}
		
		private function onMiniMapError(ld : LoadData, e : flash.events.Event) : void
		{
			for each (var handler : Function in _miniMapErrorFuncSet)
			{
				handler(this);
			}
			_miniMapCompleteFuncSet.length = 0;
			_miniMapErrorFuncSet.length = 0;
			_isMiniMapLoading = false;
		}
		
		private function onMiniMapCompleteHandler(e : away3d.events.Event) : void
		{
			_miniMapLoader.removeEventListener(away3d.events.Event.COMPLETE, onMiniMapCompleteHandler);
			if (_miniMapTextureRect)
			{
				_miniMapConcreteTexture = _miniMapLoader;
				_miniMapTexture = new SubTexture(_miniMapConcreteTexture, _miniMapTextureRect);
				
				for each (var handler : Function in _miniMapCompleteFuncSet)
				{
					handler(this);
				}
				_miniMapCompleteFuncSet.length = 0;
				_miniMapErrorFuncSet.length = 0;
			}
			else
			{
				onMiniMapErrorHandler();
			}
			_isMiniMapLoading = false;
		}
		
		private function onMiniMapErrorHandler() : void
		{
			for each (var handler : Function in _miniMapErrorFuncSet)
			{
				handler(this);
			}
			_miniMapCompleteFuncSet.length = 0;
			_miniMapErrorFuncSet.length = 0;
			_isMiniMapLoading = false;
		}
		
		public function loadRadarMap(radarMapUrl : String, rect : Rectangle) : void
		{
			_isRadarMapLoading = true;
			_radarMapUrl = radarMapUrl;
			_radarMapTextureRect = rect;
			if (_useBitmapData)
			{
				var ld : LoadData = new LoadData(_radarMapUrl, onRadarMapComplete, null, onRadarMapError, "", "", int.MAX_VALUE, LoadData.LOADER_DISPLAYOBJECT, GlobalConfig.decode);
				DobjLoadManager.load(ld);
			}
			else
			{
				_radarMapLoader = TextureFactory.fromUrl(_radarMapUrl, false, false, Context3DTextureFormat.COMPRESSED_ALPHA) as ConcreteTexture;
				_radarMapLoader.addEventListener(away3d.events.Event.COMPLETE, onRadarMapCompleteHandler);
			}
		}
		
		private function onRadarMapComplete(ld : LoadData, e : flash.events.Event) : void
		{
			_radarMapData = ((e.target as DobjLoader).content as Bitmap).bitmapData;
			for each (var handler : Function in _radarMapCompleteFuncSet)
			{
				handler(this);
			}
			_radarMapCompleteFuncSet.length = 0;
			_radarMapErrorFuncSet.length = 0;
			_isRadarMapLoading = false;
		}
		
		private function onRadarMapError(ld : LoadData, e : flash.events.Event) : void
		{
			for each (var handler : Function in _radarMapErrorFuncSet)
			{
				handler(this);
			}
			_radarMapCompleteFuncSet.length = 0;
			_radarMapErrorFuncSet.length = 0;
			_isRadarMapLoading = false;
		}
		
		private function onRadarMapCompleteHandler(e : away3d.events.Event) : void
		{
			_radarMapLoader.removeEventListener(away3d.events.Event.COMPLETE, onRadarMapCompleteHandler);
			if (_radarMapTextureRect)
			{
				_radarMapConcreteTexture = _radarMapLoader;
				_radarMapTexture = new SubTexture(_radarMapConcreteTexture, _radarMapTextureRect);
				
				for each (var handler : Function in _radarMapCompleteFuncSet)
				{
					handler(this);
				}
				_radarMapCompleteFuncSet.length = 0;
				_radarMapErrorFuncSet.length = 0;
			}
			else
			{
				onRadarMapErrorHandler();
			}
			_isRadarMapLoading = false;
		}
		
		private function onRadarMapErrorHandler() : void
		{
			for each (var handler : Function in _radarMapErrorFuncSet)
			{
				handler(this);
			}
			_radarMapCompleteFuncSet.length = 0;
			_radarMapErrorFuncSet.length = 0;
			_isRadarMapLoading = false;
		}
		
		public function loadMaterialDesc(materialDescUrl : String) : void
		{
			_isMaterialDescLoading = true;
			_materialDescUrl = materialDescUrl;
			var ld : LoadData = new LoadData(_materialDescUrl, onMaterialDescComplete, null, onMaterialDescError, "", "", int.MAX_VALUE, LoadData.LOADER_DISPLAYOBJECT, GlobalConfig.decode);
			DobjLoadManager.load(ld);
		}
		
		private function onMaterialDescComplete(ld : LoadData, e : flash.events.Event) : void
		{
			_materialDescData = ((e.target as DobjLoader).content as Bitmap).bitmapData;
			for each (var handler : Function in _materialDescCompleteFuncSet)
			{
				handler(this);
			}
			_materialDescCompleteFuncSet.length = 0;
			_materialDescErrorFuncSet.length = 0;
			_isMaterialDescLoading = false;
		}
		
		private function onMaterialDescError(ld : LoadData, e : flash.events.Event) : void
		{
			for each (var handler : Function in _materialDescErrorFuncSet)
			{
				handler(this);
			}
			_materialDescCompleteFuncSet.length = 0;
			_materialDescErrorFuncSet.length = 0;
			_isMaterialDescLoading = false;
		}
		
		private function loadComplete() : void
		{
			for each (var handler : Function in _completeHandlerSet)
			{
				handler(this);
			}
			_completeHandlerSet.length = 0;
			_errorHandlerSet.length = 0;
		}
		
		private function loadError() : void
		{
			for each (var handler : Function in _errorHandlerSet)
			{
				handler(this);
			}
			_completeHandlerSet.length = 0;
			_errorHandlerSet.length = 0;
		}
		
		public function get clientMapData() : ClientMapData
		{
			return _clientMapData;
		}
		
		public function get isMiniMapLoaded() : Boolean
		{
			return _miniMapData || _miniMapTexture;
		}
		
		public function get miniMapData() : BitmapData
		{
			return _miniMapData;
		}
		
		public function get miniMapTexture() : IStarlingTexture
		{
			return _miniMapTexture;
		}
		
		public function get isRadarMapLoaded() : Boolean
		{
			return _radarMapData || _radarMapTexture;
		}
		
		public function get radarMapData() : BitmapData
		{
			return _radarMapData;
		}
		
		public function get radarMapTexture() : IStarlingTexture
		{
			return _radarMapTexture;
		}
		
		public function get isMaterialDescLoaded() : Boolean
		{
			return _materialDescData;
		}
		
		public function get materialDescData() : BitmapData
		{
			return _materialDescData;
		}
		
		public function get mapData() : ByteArray
		{
			return _mapData;
		}
		
		private function clearMapData() : void
		{
			if (_mapData)
			{
				_mapData.clear();
				_mapData = null;
			}
			if (_mapDataUrl)
			{
				UrlLoadManager.cancelLoadByUrl(_mapDataUrl);
				_mapDataUrl = null;
			}
			_completeHandlerSet.length = 0;
			_errorHandlerSet.length = 0;
			_clientMapData = null;
		}
		
		private function clearMiniMap() : void
		{
			if (_miniMapData)
			{
				_miniMapData.dispose();
				_miniMapData = null;
			}
			if (_miniMapTexture)
			{
				_miniMapTexture.dispose();
				_miniMapTexture = null;
			}
			_miniMapTextureRect = null;
			if (_miniMapConcreteTexture)
			{
				_miniMapConcreteTexture.dispose();
				_miniMapConcreteTexture = null;
			}
			if (_miniMapUrl)
			{
				if (_useBitmapData)
				{
					DobjLoadManager.cancelLoadByUrl(_miniMapUrl);
				}
				_miniMapUrl = null;
			}
			if (_miniMapLoader)
			{
				_miniMapLoader.removeEventListener(away3d.events.Event.COMPLETE, onMiniMapCompleteHandler);
				_miniMapLoader.dispose();
				_miniMapLoader = null;
			}
			_miniMapCompleteFuncSet.length = 0;
			_miniMapErrorFuncSet.length = 0;
			_isMiniMapLoading = false;
		}
		
		private function clearRadarMap() : void
		{
			if (_radarMapData)
			{
				_radarMapData.dispose();
				_radarMapData = null;
			}
			if (_radarMapTexture)
			{
				_radarMapTexture.dispose();
				_radarMapTexture = null;
			}
			_radarMapTextureRect = null;
			if (_radarMapConcreteTexture)
			{
				_radarMapConcreteTexture.dispose();
				_radarMapConcreteTexture = null;
			}
			if (_radarMapUrl)
			{
				if (_useBitmapData)
				{
					DobjLoadManager.cancelLoadByUrl(_radarMapUrl);
				}
				_radarMapUrl = null;
			}
			if (_radarMapLoader)
			{
				_radarMapLoader.removeEventListener(away3d.events.Event.COMPLETE, onRadarMapCompleteHandler);
				_radarMapLoader.dispose();
				_radarMapLoader = null;
			}
			_radarMapCompleteFuncSet.length = 0;
			_radarMapErrorFuncSet.length = 0;
			_isRadarMapLoading = false;
		}
		
		private function clearMaterialDesc() : void
		{
			if (_materialDescData)
			{
				_materialDescData.dispose();
				_materialDescData = null;
			}
			if (_materialDescUrl)
			{
				DobjLoadManager.cancelLoadByUrl(_materialDescUrl);
				_materialDescUrl = null;
			}
			_materialDescCompleteFuncSet.length = 0;
			_materialDescErrorFuncSet.length = 0;
			_isMiniMapLoading = false;
		}
		
		public function addCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _completeHandlerSet.indexOf(handler);
			if (index < 0)
			{
				_completeHandlerSet.push(handler);
			}
		}
		
		public function addErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _errorHandlerSet.indexOf(handler);
			if (index < 0)
			{
				_errorHandlerSet.push(handler);
			}
		}
		
		public function removeCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _completeHandlerSet.indexOf(handler);
			if (index > -1)
			{
				_completeHandlerSet.splice(index, 1);
			}
		}
		
		public function removeErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _errorHandlerSet.indexOf(handler);
			if (index > -1)
			{
				_errorHandlerSet.splice(index, 1);
			}
		}
		
		public function addMiniMapCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _miniMapCompleteFuncSet.indexOf(handler);
			if (index < 0)
			{
				_miniMapCompleteFuncSet.push(handler);
			}
		}
		
		public function addMiniMapErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _miniMapErrorFuncSet.indexOf(handler);
			if (index < 0)
			{
				_miniMapErrorFuncSet.push(handler);
			}
		}
		
		public function removeMiniMapCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _miniMapCompleteFuncSet.indexOf(handler);
			if (index > -1)
			{
				_miniMapCompleteFuncSet.splice(index, 1);
			}
		}
		
		public function removeMiniMapErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _miniMapErrorFuncSet.indexOf(handler);
			if (index > -1)
			{
				_miniMapErrorFuncSet.splice(index, 1);
			}
		}
		
		public function addRadarMapCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _radarMapCompleteFuncSet.indexOf(handler);
			if (index < 0)
			{
				_radarMapCompleteFuncSet.push(handler);
			}
		}
		
		public function addRadarMapErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _radarMapErrorFuncSet.indexOf(handler);
			if (index < 0)
			{
				_radarMapErrorFuncSet.push(handler);
			}
		}
		
		public function removeRadarMapCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _radarMapCompleteFuncSet.indexOf(handler);
			if (index > -1)
			{
				_radarMapCompleteFuncSet.splice(index, 1);
			}
		}
		
		public function removeRadarMapErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _radarMapErrorFuncSet.indexOf(handler);
			if (index > -1)
			{
				_radarMapErrorFuncSet.splice(index, 1);
			}
		}
		
		public function addMaterialDescCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _materialDescCompleteFuncSet.indexOf(handler);
			if (index < 0)
			{
				_materialDescCompleteFuncSet.push(handler);
			}
		}
		
		public function addMaterialDescErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _materialDescErrorFuncSet.indexOf(handler);
			if (index < 0)
			{
				_materialDescErrorFuncSet.push(handler);
			}
		}
		
		public function removeMaterialDescCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _materialDescCompleteFuncSet.indexOf(handler);
			if (index > -1)
			{
				_materialDescCompleteFuncSet.splice(index, 1);
			}
		}
		
		public function removeMaterialDescErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _materialDescErrorFuncSet.indexOf(handler);
			if (index > -1)
			{
				_materialDescErrorFuncSet.splice(index, 1);
			}
		}
		
		public function get isLoaded() : Boolean
		{
			return _mapData != null;
		}
		
		public function get isMiniMapLoading() : Boolean
		{
			return _isMiniMapLoading;
		}
		
		public function get isRadarMapLoading() : Boolean
		{
			return _isRadarMapLoading;
		}
		
		public function get isMaterialDescLoading() : Boolean
		{
			return _isMaterialDescLoading;
		}
		
		public function get mapName() : String
		{
			return _mapName;
		}
		
		/**释放*/
		override public function destroy() : void
		{
			clearMapData();
			clearMiniMap();
			clearRadarMap();
			_mapName = null;
			_useBitmapData = false;
			_completeHandlerSet = null;
			_errorHandlerSet = null;
			_miniMapCompleteFuncSet = null;
			_miniMapErrorFuncSet = null;
			_radarMapCompleteFuncSet = null;
			_radarMapErrorFuncSet = null;
			_materialDescCompleteFuncSet = null;
			_materialDescErrorFuncSet = null;
			super.destroy();
		}
	}
}
