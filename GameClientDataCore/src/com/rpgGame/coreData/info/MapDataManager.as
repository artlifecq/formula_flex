package com.rpgGame.coreData.info
{
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine3D.config.GlobalConfig;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.map.map2d.MapData;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.enum.LoadPriorityType;
	import away3d.events.Event;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.loaders.multi.MultiUrlLoader;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 地图数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-07-27 上午10:05:12
	 *
	 */
	public class MapDataManager
	{
		private static var _mapDataMap : HashMap = new HashMap();
		private static var _mapTypeMap : HashMap = new HashMap();
		/**保存玩家当前所在的场景信息*/
		private static var _currentScene : SceneData;
		private static var _lastScene : SceneData;

		public function MapDataManager()
		{
		}

		public static function setSceneConfig(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			parseSceneConfig(arr);
//			parseSceneConfig(sceneConfig.familyDungeon);
//			parseSceneConfig(sceneConfig.jailScene);
//			parseSceneConfig(sceneConfig.familyWarDungeon);
//			parseSceneConfig(sceneConfig.familyAnimalScene);
		}

		private static function parseSceneConfig(arr : Array) : void
		{
			if (arr) //如果是数组,就是多份地图数据
			{
				for each (var scene : Q_map in arr)
				{
					addMapInfo(scene);
				}
			}
			/*else if (data is SceneProto)
			{
				addMapInfo(data as SceneProto);
			}*/
			else
			{
				trace("当前场景不存在");
			}
		}
		
		/*****************************************************************************************************
		 * 2d场景相关操作
		 ****************************************************************************************************/
		private static var _configCmpFunMap:HashMap = new HashMap();
		private static var _mapConfigMap:HashMap = new HashMap();
		private static var _numBlocksX:int;//宽
		private static var _numBlocksY:int;//高
		/**
		 * 获取地图的配置文件数据 
		 * @param mapID
		 * @param onCmpFun (返回MapConfig对象)//对应MapManager中的onConfigLoaded方法
		 * 
		 */		
		public static function getMapConfigData(mapID:uint,onCmpFun:Function=null):void
		{
			var mapInfo:SceneData = getMapInfo(mapID);
			if(mapInfo)
			{
				var mapDataUrl:String = ClientConfig.getMapDataConfig(mapInfo.mapNameResource);
				var mapConfig:MapConfig = _mapConfigMap.getValue(mapDataUrl);
				if(!mapConfig)//如果缓存里没有数据，表示这个数据要加载了a
				{
					loadMapConfigData(mapDataUrl,onCmpFun,mapID);
				}
				else
				{
					if(onCmpFun != null)
					{
						onCmpFun(mapConfig);
					}
				}
			}
		}
		
		private static function loadMapConfigData(mapDataUrl:String,onConfigCmp:Function,mapID:uint):void
		{
			var isLoading:Boolean = false;
			
			var url : String = mapDataUrl;
			if (GlobalConfig.version != null)
			{
				url = GlobalConfig.version(url);
			}
			mapDataUrl = url;
			
			if(onConfigCmp != null)
			{
				var list:Vector.<Function> = _configCmpFunMap.getValue(mapDataUrl);
				if(!list)
				{
					list = new Vector.<Function>;
					_configCmpFunMap.add(mapDataUrl,list);
				}
				if(list.length)
				{
					isLoading = true;
				}
				list.push(onConfigCmp);
			}
			
			if(!isLoading)
			{
				var ld : MultiLoadData = new MultiLoadData(mapDataUrl, onMapConfigLoaded, null,onMapError, "", "", LoadPriorityType.LEVEL_CUSTOM_4, MultiLoadData.URLLOADER_BINARY);
				ld.userData = {mapID:mapID};
				MultiUrlLoadManager.load(ld);
			}
		}
		
		private static function onMapError(ld : MultiLoadData, e : flash.events.Event):void
		{
			trace("加载异常了************************************");
		}
		
		/** 解析map.cfg文件[合成data.dat及area.json文件 ] */
		private static function onMapConfigLoaded(ld : MultiLoadData, e : flash.events.Event):void
		{
			var loader : MultiUrlLoader = e.currentTarget as MultiUrlLoader;
			var byteArr:ByteArray = loader.data as ByteArray;
			var mapDataUrl:String = ld.url;
			var mapID:int = ld.userData.mapID;
			byteArr.endian = Endian.LITTLE_ENDIAN;
			
			parseMapConfigData(mapDataUrl, mapID, byteArr);
			parseOver(mapDataUrl);
		}
		
		//======================================================================
		// 解析地图数据
		//======================================================================
		private static function parseMapConfigData(url:String, 
												   mapID:int,
												   byteArr:ByteArray) : void {
			var md:MapData = new MapData(mapID);
			md.mergeFrom(byteArr);//解析地图数据
			
			//			var mapInfo:MapInfo = _mapInfoMap.getValue(mapID);
			setMapConfigData(url, md);
		}
		
		private static function setMapConfigData(url:String, mapData : MapData):void
		{
			var mapConfig:MapConfig = new MapConfig();
			mapConfig.width = mapData.width;
			mapConfig.height = mapData.height;

			_numBlocksX = Math.ceil(mapData.width / 50);
			_numBlocksY = Math.ceil(mapData.height / 50);
			
			mapConfig.gridH = _numBlocksX;
			mapConfig.gridV = _numBlocksY;
			
			mapConfig.smallWidth = mapData.thumbnailWidth;
			mapConfig.smallHeight = mapData.thumbnailHeight;
			
			_mapConfigMap.add(url,mapConfig);
			
		}
		
		//======================================================================
		// 解析地图数据结束
		//======================================================================
		private static function parseOver(url : String) : void
		{
			var funs : Vector.<Function> = _configCmpFunMap.getValue(url);
			if (null == funs)
			{
				return;
			}
			var mapConfig:MapConfig = _mapConfigMap.getValue(url);

			for (var i : int = 0, len : int = funs.length; i < len; ++i) 
			{
				funs[i](mapConfig);
			}
			_configCmpFunMap.remove(url);
		}
		
		/////////////////////////////////////////////加载图相关的////////////////////////////////////////////////
		
		private static var _miniMapTextureMap:HashMap = new HashMap();
		private static var _miniMapCmpFunMap:HashMap = new HashMap();
		
		
		public static function getCacheMiniMapBmpData(mapID:uint):AsyncMapTexture
		{
			var mapInfo:SceneData = getMapInfo(mapID);
			var bmpData:AsyncMapTexture;
			if(mapInfo)
			{
				var url:String = ClientConfig.getSmallMap(mapInfo.mapNameResource);
				bmpData = _miniMapTextureMap.getValue(url);
				if(bmpData && bmpData.isDispose)
				{
					_miniMapTextureMap.remove(url);
					bmpData = null;
				}
			}
			return bmpData;
		}
		
		/**
		 * 获取地图的缩略图位图数据 
		 * @param mapID
		 * @param onCmpFun (返回BitmapData对象)
		 * 
		 */		
		public static function getMiniMapBmpData(mapID:uint,onCmpFun:Function=null):void
		{
			var mapInfo:SceneData = getMapInfo(mapID);
			if(mapInfo)
			{
				
				var url:String = ClientConfig.getSmallMap(mapInfo.mapNameResource);
				var bmpData:AsyncMapTexture = _miniMapTextureMap.getValue(url);
				var isLoading:Boolean = false;
				if(!bmpData)
				{
					if(onCmpFun != null)
					{
						var list:Vector.<Function> = _miniMapCmpFunMap.getValue(url);
						if(!list)
						{
							list = new Vector.<Function>;
							_miniMapCmpFunMap.add(url,list);
						}
						if(list.length)
						{
							isLoading = true;
						}
						list.push(onCmpFun);
					}
					//
					if(!isLoading)
					{
						bmpData = new AsyncMapTexture();
						bmpData.userData = mapID;
						bmpData.addEventListener(away3d.events.Event.COMPLETE, onMiniMapLoaded);
						bmpData.load(url,LoadPriorityType.LEVEL_CUSTOM_4);
					}
				}
				else//已经有了,直接返回撒
				{
					if(!bmpData.isDispose)
					{
						if(onCmpFun != null)
						{
							onCmpFun(bmpData,mapID);
						}
					}else
					{
						_miniMapTextureMap.remove(url);
						getMiniMapBmpData(mapID,onCmpFun);
					}
				}
			}
		}
		
		private static function onMiniMapLoaded(e:away3d.events.Event):void
		{
			var texture:AsyncMapTexture = e.currentTarget as AsyncMapTexture;
			
			_miniMapTextureMap.add(texture.url,texture);
			
			var list:Vector.<Function> = _miniMapCmpFunMap.getValue(texture.url);
			if(list)
			{
				for each(var fun:Function in list)
				{
					fun(texture,texture.userData);
				}
			}
			_miniMapCmpFunMap.remove(texture.url);
		}
		
		////////////////////////////////////////////////销毁相关/////////////////////////////////////////////////////
		private static const MAPDATA_CACHE_TM:uint = 5*6;//地图数据缓存时长，秒
		private static var _disposeMap:HashMap = new HashMap();
		
		private static function delayDisposeMap(mapResName:String):void
		{
			GameLog.add("##进入倒计时销毁 : ",mapResName);
			//
			cancelDelayDisposeMap(mapResName);
			//
			var delayedTween:TweenLite=TweenLite.delayedCall(MAPDATA_CACHE_TM,disposeMapData,[mapResName]);
			_disposeMap.add(mapResName,delayedTween);
		}
		/**
		 *检查是否可以延时释放地图资源,当存在资源引用的情况下， 不释放  
		 * @param mapResName
		 * 
		 */		
		public static function checkDelayDisposeMap(mapPackName:String):void
		{
			if (checkMapResUsing(mapPackName)) 
			{
				return;
			}
			delayDisposeMap(mapPackName);
		}
		/**<查检地图资源是否正在使用中>*/
		private static function checkMapResUsing(mapPackName:String):Boolean
		{
			//			var smallMapInfo:MapInfo = SceneSwitchManager.curtMapInfo;
			//			if (isSameRes(smallMapInfo, mapPackName)) 
			//			{
			//				cancelDelayDisposeMap(mapPackName);
			//				return true;
			//			}
			/*var worldMapInfo:MapInfo = WorldMapManager.currShowMapInfo;
			if (isSameRes(worldMapInfo, mapResName)) 
			{
			cancelDelayDisposeMap(mapResName);
			return true;
			}*/
			return false;
		}
		/**
		 * mapInfo的资源是不是和指定资源名字(mapResName)相同
		 * @param mapInfo
		 * @param mapResName
		 * @return 
		 * 
		 */		
		private static function isSameRes(mapInfo:SceneData, mapPackName:String):Boolean
		{
			if (mapInfo && mapInfo.mapNameResource == mapPackName) 
			{
				return true;
			}
			return false;
		}
		private static function disposeMapData(mapResName):void
		{
			if (checkMapResUsing(mapResName)) 
			{
				return;
			}
			var url:String = ClientConfig.getMapDataConfig(mapResName);
			if (GlobalConfig.version != null)
			{
				url = GlobalConfig.version(url);
			}
			var mapConfig:MapConfig = _mapConfigMap.getValue(url);
			if(mapConfig)
			{
				mapConfig.dispose();
			}
			_mapConfigMap.remove(url);
			
			var miniUrl:String = ClientConfig.getSmallMap(mapResName);
			var bmpData:AsyncMapTexture = _miniMapTextureMap.getValue(miniUrl);
			if(bmpData)
			{
				bmpData.dispose();
			}
			_miniMapTextureMap.remove(miniUrl);
			GameLog.add("##销毁地图数据-------> : ",mapResName);
		}
		
		/**
		 *取消延时dispose 地图资源 
		 * @param mapResName
		 * 
		 */		
		public static function cancelDelayDisposeMap(mapResName:String):void
		{
			var delayedTween:TweenLite = _disposeMap.getValue(mapResName);
            if (delayedTween) {
				delayedTween.kill();
                _disposeMap.remove(mapResName);
            }
		}
		
		

        /*****************************************************************************************************
         * 添加单个场景信息
         ****************************************************************************************************/
		public static function addMapInfo(scene : Q_map) : void
		{
			var sceneData : SceneData = new SceneData();
			sceneData.setData(scene);
			_mapDataMap.add(sceneData.sceneId, sceneData);
			var type : int = sceneData.mapType;
			var vec : Vector.<SceneData> = _mapTypeMap.getValue(type);
			if (vec == null)
			{
				vec = new Vector.<SceneData>();
				_mapTypeMap.add(type, vec);
			}
			vec.push(sceneData);
		}

		/**
		 * 获取所有的地图信息
		 * @return 返回所有的地图信息
		 */
		public static function getAllMapInfo() : Vector.<SceneData>
		{
			var ret : Vector.<SceneData> = new Vector.<SceneData>();
			var arr : Array = _mapDataMap.getValues();
			for each (var mapInfo : SceneData in arr)
			{
				ret.push(mapInfo);
			}
			return ret;
		}

		public static function getMapInfo(id : uint) : SceneData
		{
			return _mapDataMap.getValue(id);
		}

		public static function getMapName(id : uint) : String
		{
			var mapInfo : SceneData = getMapInfo(id);
			if (mapInfo)
			{
				return mapInfo.name;
			}
			return "";
		}

		public static function getMapType(id : uint) : int
		{
			var mapInfo : SceneData = getMapInfo(id);
			if (mapInfo)
			{
				return mapInfo.mapType;
			}
			return 0;
		}

		/**
		 * 玩家当前所在的场景数据
		 * @param value
		 */
		public static function set currentScene(value : SceneData) : void
		{
			_currentScene = value;
		}

		public static function get currentScene() : SceneData
		{
			return _currentScene;
		}

		/**
		 * 玩家上次所在的场景数据
		 * @param value
		 */
		public static function set lastScene(value : SceneData) : void
		{
			_lastScene = value;
		}

		public static function get lastScene() : SceneData
		{
			return _lastScene;
		}

		/**
		 * 得到某个类型场景的集合
		 * @return
		 *
		 */
		public static function getMapInfosByType(type : int) : Vector.<SceneData>
		{
			return _mapTypeMap.getValue(type);
		}
	}
}
