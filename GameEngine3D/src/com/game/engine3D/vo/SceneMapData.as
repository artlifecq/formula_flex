package com.game.engine3D.vo
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.game.engine3D.vo.share.CountShareData;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.loaders.multi.MultiUrlLoader;
	
	import starling.textures.IStarlingTexture;
	
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
		private var _completeHandlerSet : Vector.<Function>;
		private var _errorHandlerSet : Vector.<Function>;
		private var _mapData : ByteArray = null;
		private var _clientMapData : ClientMapData;
		private var _miniMapLoader : MapTextureLoader = null;
		private var _radarMapLoader : MapTextureLoader = null;
		private var _materialDescLoader : MapTextureLoader = null;
		
		public function SceneMapData(mapName : String, mapDataUrl : String, useBitmapData : Boolean = false)
		{
			_mapName = mapName;
			_mapDataUrl = mapDataUrl;
			_completeHandlerSet = new Vector.<Function>();
			_errorHandlerSet = new Vector.<Function>();
			_miniMapLoader = new MapTextureLoader(useBitmapData);
			_radarMapLoader = new MapTextureLoader(useBitmapData);
			_materialDescLoader = new MapTextureLoader(true);
		}
		
		public function load() : void
		{
			var url : String = _mapDataUrl;
			if (GlobalConfig.version != null)
			{
				url = GlobalConfig.version(url);
			}
			_mapDataUrl = url;
			var ld : MultiLoadData = new MultiLoadData(_mapDataUrl, onMapDataComplete, null, onMapDataError, "", "", 10000, MultiLoadData.URLLOADER_BINARY);
			MultiUrlLoadManager.load(ld);
		}
		
		private function onMapDataComplete(ld : MultiLoadData, e : flash.events.Event) : void
		{
			var loader : MultiUrlLoader = e.currentTarget as MultiUrlLoader;
			var byteArr : ByteArray = loader.data as ByteArray;
			byteArr.uncompress();
			_mapData = byteArr;
			_mapData.position = 0;
			_clientMapData = new ClientMapData();
			_clientMapData.readFrom(_mapData);
			loadComplete();
		}
		
		private function loadComplete() : void
		{
			if(_completeHandlerSet)
			{
				for each (var handler : Function in _completeHandlerSet)
				{
					handler(this);
				}
				_completeHandlerSet.length = 0;
			}
			if(_errorHandlerSet)
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
		
		private function onMapDataError(ld : MultiLoadData, e : flash.events.Event) : void
		{
			loadError();
		}
		
		public function loadMiniMap(miniMapUrl : String, rect : Rectangle) : void
		{
			_miniMapLoader.load(miniMapUrl, rect);
		}
		
		public function loadRadarMap(radarMapUrl : String, rect : Rectangle) : void
		{
			_radarMapLoader.load(radarMapUrl, rect);
		}
		
		public function loadMaterialDesc(materialDescUrl : String) : void
		{
			_materialDescLoader.load(materialDescUrl);
		}
		
		public function get isMiniMapLoaded() : Boolean
		{
			return _miniMapLoader.isLoaded;
		}
		
		public function get miniMapData() : BitmapData
		{
			return _miniMapLoader.bitmapData;
		}
		
		public function get miniMapLoader() : MapTextureLoader
		{
			return _miniMapLoader;
		}
		
		public function get miniMapTexture() : IStarlingTexture
		{
			return _miniMapLoader.subTexture;
		}
		
		public function get isRadarMapLoaded() : Boolean
		{
			return _radarMapLoader.isLoaded;
		}
		
		public function get radarMapData() : BitmapData
		{
			return _radarMapLoader.bitmapData;
		}
		
		public function get radarMapLoader() : MapTextureLoader
		{
			return _radarMapLoader;
		}
		
		public function get radarMapTexture() : IStarlingTexture
		{
			return _radarMapLoader.subTexture;
		}
		
		public function get isMaterialDescLoaded() : Boolean
		{
			return _materialDescLoader.isLoaded;
		}
		
		public function get materialDescData() : BitmapData
		{
			return _materialDescLoader.bitmapData;
		}
		
		public function get mapData() : ByteArray
		{
			return _mapData;
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
			_miniMapLoader.addCompleteHandler(handler);
		}
		
		public function addMiniMapErrorHandler(handler : Function) : void
		{
			_miniMapLoader.addErrorHandler(handler);
		}
		
		public function removeMiniMapCompleteHandler(handler : Function) : void
		{
			_miniMapLoader.removeCompleteHandler(handler);
		}
		
		public function removeMiniMapErrorHandler(handler : Function) : void
		{
			_miniMapLoader.removeErrorHandler(handler);
		}
		
		public function addRadarMapCompleteHandler(handler : Function) : void
		{
			_radarMapLoader.addCompleteHandler(handler);
		}
		
		public function addRadarMapErrorHandler(handler : Function) : void
		{
			_radarMapLoader.addErrorHandler(handler);
		}
		
		public function removeRadarMapCompleteHandler(handler : Function) : void
		{
			_radarMapLoader.removeCompleteHandler(handler);
		}
		
		public function removeRadarMapErrorHandler(handler : Function) : void
		{
			_radarMapLoader.removeErrorHandler(handler);
		}
		
		public function addMaterialDescCompleteHandler(handler : Function) : void
		{
			_materialDescLoader.addCompleteHandler(handler);
		}
		
		public function addMaterialDescErrorHandler(handler : Function) : void
		{
			_materialDescLoader.addErrorHandler(handler);
		}
		
		public function removeMaterialDescCompleteHandler(handler : Function) : void
		{
			_materialDescLoader.removeCompleteHandler(handler);
		}
		
		public function removeMaterialDescErrorHandler(handler : Function) : void
		{
			_materialDescLoader.removeErrorHandler(handler);
		}
		
		public function get isLoaded() : Boolean
		{
			return _mapData != null;
		}
		
		public function get isMiniMapLoading() : Boolean
		{
			return _miniMapLoader.isLoading;
		}
		
		public function get isRadarMapLoading() : Boolean
		{
			return _radarMapLoader.isLoading;
		}
		
		public function get isMaterialDescLoading() : Boolean
		{
			return _materialDescLoader.isLoading;
		}
		
		public function get mapName() : String
		{
			return _mapName;
		}
		
		/**释放*/
		override public function destroy() : void
		{
			if (_mapData)
			{
				_mapData.clear();
				_mapData = null;
			}
			if (_mapDataUrl)
			{
				MultiUrlLoadManager.cancelLoadByUrl(_mapDataUrl);
				_mapDataUrl = null;
			}
			_clientMapData = null;
			_mapName = null;
			_completeHandlerSet = null;
			_errorHandlerSet = null;
			if (_miniMapLoader)
			{
				_miniMapLoader.destroy();
				_miniMapLoader = null;
			}
			if (_radarMapLoader)
			{
				_radarMapLoader.destroy();
				_radarMapLoader = null;
			}
			if (_materialDescLoader)
			{
				_materialDescLoader.destroy();
				_materialDescLoader = null;
			}
			super.destroy();
		}
	}
}
