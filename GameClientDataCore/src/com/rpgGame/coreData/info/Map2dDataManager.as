package com.rpgGame.coreData.info
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine2D.scene.map.vo.MapTile;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.map.map2d.MapData;
	import com.rpgGame.coreData.info.map.map2d.MapDataInfo;
	import com.rpgGame.coreData.info.map.map2d.MapDynamicBlockAreaInfo;
	import com.rpgGame.coreData.info.map.map2d.MapInfo;
	import com.rpgGame.coreData.info.map.map2d.SceneInfo;
	import com.rpgGame.coreData.info.map.map2d.area.MapAreaResInfo;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.IMapData;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.NormalSceneData;
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	import away3d.events.Event;
	
	import gs.TweenLite;
	
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.loader.UrlLoader;
	import org.client.load.loader.multi.vo.LoadData;
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.utils.DisplayUtil;
	
	/**
	 *  
	 * @author bufanliu
	 * 
	 */	
	public class Map2dDataManager
	{
		private static var _configCmpFunMap:HashMap = new HashMap();
		private static var _miniMapCmpFunMap:HashMap = new HashMap();
		/**
		 * 存放mapinfo的，key为mapid，value为mapinfo 
		 */		
		private static var _mapInfoMap:HashMap = new HashMap();
		/**
		 * 根据map type来存放对应 mapinfo数组，key为map type，value为vector（里面存放mapinfo） 
		 */		
		private static var _mapTypeMap:HashMap = new HashMap();
		private static var _mapConfigMap:HashMap = new HashMap();
		private static var _scenenIdMapInfoDic:Dictionary = new Dictionary;
		
		private static var _mapDataInfoMap:HashMap = new HashMap();
		private static var _miniMapTextureMap:HashMap = new HashMap();
		private static var _fightTrialTypeDic:Dictionary;
		private static var _fightPracticeTypeDic:Dictionary;
		
		public static var checkGetLineInfoTime:Number = 0;//记录请求线路信息的时间点；
		private static const MAPDATA_CACHE_TM:uint = 5*60;//地图数据缓存时长，秒
		private static var _disposeMap:HashMap = new HashMap();
		
		private static var _dynamicBlockCanWalkAreas:Dictionary;
		private static var _dynamicBlockCanWalkAreaKeys:Vector.<String>;
		/**<场景弹跳点特效  key:sceneId, value:Vector.<EffectInfo> >*/
		private static var _sceneTeleportEffectInfoDic:Dictionary = new Dictionary();
		/**<地图 的边界区域空气墙 key:mapId,value:MapFenceBase>*/
		private static var _mapFenceBaseDic:Dictionary = new Dictionary();
		
		public function Map2dDataManager()
		{
		}
		
		private static var _colorTransMap:HashMap = new HashMap();
		private static function setupColorTransform():void
		{
			_colorTransMap.add(7,new ColorTransform(1,1,1,0.95,0,15,40));
		}
		
		public static function getColorTransform(mapID:uint):ColorTransform
		{
			var colorTrans:ColorTransform = _colorTransMap.getValue(mapID);
			return colorTrans;
		}
		
		public static function setSceneConfig(sceneInfo:SceneInfo):void
		{
			setupColorTransform();
			//
			parseSceneConfig(sceneInfo.scenes);
		}
		
		private static function parseSceneConfig(...args):void
		{
			var sData:* = args[0];
			if(sData is Array)//如果是数组,就是多份地图数据
			{
				for each(var mapProto:Object in sData)
				{
					addMapInfo(mapProto);
				}
			}
			else if(sData is Object)
			{
				addMapInfo(sData);
			}
		}
		
		public static function addMapInfo(mapProto:Object):void
		{
			var mapInfo:MapInfo;
			mapInfo = new MapInfo();
			mapInfo.setSceneData(mapProto);
			mapInfo.id = mapInfo.mapData.sceneId;
			_mapInfoMap.add(mapInfo.id,mapInfo);
			var mapData:IMapData = mapInfo.mapData;
			var type:int = mapData.mapType;
			var vec:Vector.<MapInfo> = _mapTypeMap.getValue(type);
			var dic:Dictionary = _scenenIdMapInfoDic[type];
			if (!dic) 
			{
				dic = new Dictionary()
				_scenenIdMapInfoDic[type] = dic;
			}
			
			dic[mapData.sceneId] = mapData;
			if(vec == null)
			{
				vec = new Vector.<MapInfo>();
				_mapTypeMap.add(type,vec);
			}
			vec.push(mapInfo);
		}
		
		public static function getMapInfo(id:uint):MapInfo
		{
			return _mapInfoMap.getValue(id);
		}
		
		public static function getMapName(id:uint):String
		{
			var mapInfo:MapInfo = getMapInfo(id);
			if(mapInfo)
			{
				return mapInfo.name;
			}
			return "";
		}
		
		public static function getMapType(id:uint):int
		{
			var mapInfo:MapInfo = getMapInfo(id);
			if(mapInfo)
			{
				return mapInfo.mapData.mapType;
			}
			return 0;
		}
		
		public static function getCacheMiniMapBmpData(mapID:uint):AsyncMapTexture
		{
			var mapInfo:MapInfo = Map2dDataManager.getMapInfo(mapID);
			var bmpData:AsyncMapTexture;
			if(mapInfo)
			{
				var url:String = ClientConfig.getSmallMap(mapInfo.mapData.mapPackName);
				bmpData = _miniMapTextureMap.getValue(url);
				if(bmpData && bmpData.isDispose)
				{
					_miniMapTextureMap.remove(url);
					bmpData = null;
				}
			}
			return bmpData;
		}
		
		
		private static function delayDisposeMap(mapResName:String):void
		{
			GameLog.add("##进入倒计时销毁 : ",mapResName);
			//
			cancelDelayDisposeMap(mapResName);
			//
			TweenLite.delayedCall(MAPDATA_CACHE_TM,disposeMapData,[mapResName]);
			_disposeMap.add(mapResName,disposeMapData);
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
		private static function isSameRes(mapInfo:MapInfo, mapPackName:String):Boolean
		{
			if (mapInfo && mapInfo.mapData.mapPackName == mapPackName) 
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
			var mapConfig:MapConfig = _mapConfigMap.getValue(url);
			if(mapConfig)
			{
				mapConfig.dispose();
			}
			_mapConfigMap.remove(url);
			var mapResInfo:MapDataInfo = _mapDataInfoMap.getValue(url);
			if(mapResInfo)
			{
				mapResInfo.dispose();
			}
//			dispseMapAreaResInfo(url);
			
			_mapDataInfoMap.remove(url);
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
		private static function cancelDelayDisposeMap(mapResName:String):void
		{
			var fun:Function = _disposeMap.getValue(mapResName);
			TweenLite.killDelayedCallsTo(fun);
		}
		
		/**
		 * 获取地图的缩略图位图数据 
		 * @param mapID
		 * @param onCmpFun (返回BitmapData对象)
		 * 
		 */		
		public static function getMiniMapBmpData(mapID:uint,onCmpFun:Function=null):void
		{
			var mapInfo:MapInfo = Map2dDataManager.getMapInfo(mapID);
			if(mapInfo)
			{
				
				var url:String = ClientConfig.getSmallMap(mapInfo.mapData.mapPackName);
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
						bmpData.addEventListener(Event.COMPLETE, onMiniMapLoaded);
						bmpData.load(url);
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
		
		private static function onMiniMapLoaded(e:Event):void
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
		
		/**
		 * 获取地图的配置文件数据 
		 * @param mapID
		 * @param onCmpFun (返回MapConfig对象)//对应MapManager中的onConfigLoaded方法
		 * 
		 */		
		public static function getMapConfigData(mapID:uint,onCmpFun:Function=null):void
		{
			var mapInfo:MapInfo = Map2dDataManager.getMapInfo(mapID);
			if(mapInfo)
			{
				var mapDataUrl:String = ClientConfig.getMapDataConfig(mapInfo.mapData.mapPackName);
				var mapConfig:MapConfig = _mapConfigMap.getValue(mapDataUrl);
				if(!mapConfig)//如果缓存里没有数据，表示这个数据要加载了a
				{
					loadMapConfigData(mapDataUrl,onCmpFun,mapID);
				}
				else
				{
					var mapDataInfo:MapDataInfo = _mapDataInfoMap.getValue(mapDataUrl);
					var lockAreaMap:IMapData = mapInfo.mapData;
					if(lockAreaMap.isMapLockAtrea() || mapConfig.mapSolidChanged)
					{
						//根据配置的可行走区域更新运行时障碍信息
						Map2dDataManager.resetMapConfigData(mapConfig,mapDataInfo);
					}
					if(onCmpFun != null)
					{
						onCmpFun(mapConfig,mapDataInfo);
					}
				}
			}
		}
		
		
		
		private static function loadMapConfigData(mapDataUrl:String,onConfigCmp:Function,mapID:uint):void
		{
			var isLoading:Boolean = false;
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
				var ld:LoadData = new LoadData(mapDataUrl,onMapConfigLoaded,null,null,"","",uint.MAX_VALUE,LoadData.URLLOADER_BINARY);
				ld.userData = {mapID:mapID}
				UrlLoadManager.load(ld);
			}
		}
		
		/** 解析map.cfg文件[合成data.dat及area.json文件 ] */
		private static function onMapConfigLoaded(ld:LoadData,e:Object):void
		{
			var loader:UrlLoader = e.currentTarget as UrlLoader;
			var byteArr:ByteArray = loader.data as ByteArray;
			var mapDataUrl:String = ld.url;
			var mapID:int = ld.userData.mapID;
            byteArr.endian = Endian.LITTLE_ENDIAN;
            
            parseMapConfigData(mapDataUrl, mapID, byteArr);
            parseOver(mapDataUrl);
			
//			byteArr.position = byteArr.length - 4;
//			var len:int = byteArr.readInt();
//			var dataLen:int = byteArr.length - 4 - len;
//			var areaBytes:ByteArray = new ByteArray();
//			
//			byteArr.position = dataLen;
//			byteArr.readBytes(areaBytes, 0, len);
//			areaBytes.uncompress();
//			
//			var dataBytes:ByteArray = new ByteArray();
//			byteArr.position = 0;
//			byteArr.readBytes(dataBytes, 0, dataLen);
//			
//			parseMapConfigData(mapDataUrl, mapID, dataBytes);
//			parseMapAreaConfigLoaded(mapDataUrl, mapID, areaBytes);
		}
		
		private static function parseMapConfigData(url:String, mapID:int,byteArr:ByteArray):void
		{
			//byteArr.uncompress();
			
			var md:MapData = new MapData(mapID);
			md.mergeFrom(byteArr);//解析地图数据
			
			var mapDataInfo:MapDataInfo = new MapDataInfo();
			_mapDataInfoMap.add(url,mapDataInfo);
			copyMapDataToMapDataInfo(mapDataInfo,md);
			
//			var mapInfo:MapInfo = _mapInfoMap.getValue(mapID);
			setMapConfigData(url, mapDataInfo);
		}
		
		private static function setMapConfigData(url:String,mapDataInfo:MapDataInfo):void
		{
			var mapConfig:MapConfig = new MapConfig();
			
			mapConfig.width = _numBlocksX*50;
			mapConfig.height = _numBlocksY*50;
			
			mapConfig.gridH = _numBlocksX;
			mapConfig.gridV = _numBlocksY;
			
			resetMapConfigData(mapConfig,mapDataInfo);
			_mapConfigMap.add(url,mapConfig);
			
		}
		
		private static function parseMapAreaConfigLoaded(url:String, mapID:int,byteArr:ByteArray):void
		{
			var areaInfos:String = byteArr.readUTFBytes(byteArr.length);
			var areaResInfo:Object = JSON.parse(areaInfos);
			var mapAreaResInfo:MapAreaResInfo = new MapAreaResInfo(areaResInfo, mapID);
			
//			MapAreaManager.addMapAreaResInfo(mapAreaResInfo);
			var mapConfig:MapConfig = _mapConfigMap.getValue(url); 
			var mapDataInfo:MapDataInfo = _mapDataInfoMap.getValue(url);
			
			mapConfig.smallWidth = mapAreaResInfo.mapWidth;
			mapConfig.smallHeight = mapAreaResInfo.mapHeight;
		}
        
        //======================================================================
        // 解析地图数据结束
        //======================================================================
        private static function parseOver(url : String) : void {
            var funs : Vector.<Function> = _configCmpFunMap.getValue(url);
            if (null == funs) {
                return;
            }
            var mapConfig:MapConfig = _mapConfigMap.getValue(url);
            var mapDataInfo:MapDataInfo = _mapDataInfoMap.getValue(url);
            for (var i : int = 0, len : int = funs.length; i < len; ++i) {
                funs[i](mapConfig, mapDataInfo);
            }
            _configCmpFunMap.remove(url);
        }
		
		private static var _numBlocksX:int;//宽
		private static var _numBlocksY:int;//高
		
		/**
		 * 保存格子数据(是否可走区域，遮挡区域,是否可PK区域)
		 */
		public static function copyMapDataToMapDataInfo(mapDataInfo:MapDataInfo,md:MapData):void
		{
			_numBlocksX = md.numBlocksX;
			_numBlocksY = md.numBlocksY;
			
//			var layers:Array = md.layers;
//			var len:int = layers.length;
//			var layer:Layer;
//			var i:uint = 0;
//			var j:uint = 0
//			for(i;i<len;i++)
//			{
//				layer = layers[i];
//				switch(layer.layerType)
//				{
//					case LayerType.MOVE:
//						mapDataInfo.mapMoveData = getMapData(layer.layerType,layer.data);
//						break;
//					case LayerType.SHADE:
//						mapDataInfo.mapShadeData = getMapData(layer.layerType,layer.data);
//						break;
//					case LayerType.PK_ABLE:
//						mapDataInfo.mapPKAbleData = getMapData(layer.layerType,layer.data);
//						break;
//					case LayerType.EXP_10X:
//						mapDataInfo.mapExp10XData = getMapData(layer.layerType,layer.data);
//						break;
//					case LayerType.EXP_20X:
//						mapDataInfo.mapExp20XData = getMapData(layer.layerType,layer.data);
//						break;
//				}
//			}
//			
//			if(mapDataInfo.mapMoveData == null)
//			{
//				mapDataInfo.mapMoveData = getMapData(-1,null,true,true);
//			}
//			if(mapDataInfo.mapShadeData == null)
//			{
//				mapDataInfo.mapShadeData = getMapData(-1,null,true,false);
//			}
//			if(mapDataInfo.mapPKAbleData == null)
//			{
//				mapDataInfo.mapPKAbleData = getMapData(-1,null,true,false);
//			}
//			if(mapDataInfo.mapExp10XData == null)
//			{
//				mapDataInfo.mapExp10XData = getMapData(-1,null,true,false);
//			}
//			if(mapDataInfo.mapExp20XData == null)
//			{
//				mapDataInfo.mapExp20XData = getMapData(-1,null,true,false);
//			}
//			var arr:Array = md.effects;
//			var effectInfoVec:Vector.<EffectInfo> = new Vector.<EffectInfo>();
//			for each (var efff:Effect in arr) 
//			{
//				var effectInfo:EffectInfo = new EffectInfo();
//				effectInfo.setEffectProto(efff);
//				effectInfoVec.push(effectInfo);
//			}
//			
//			mapDataInfo.mapEffects = effectInfoVec;
		}
		
		/**
		 * 根据MapInfo重置地图地形数据
		 * @param mapConfig
		 * @param mapInfo
		 * 
		 */
		public static function resetMapConfigData(mapConfig:MapConfig,mapDataInfo:MapDataInfo):void
		{
			var mapSolids:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>;
			var mapTiles:Vector.<Vector.<MapTile>> = new Vector.<Vector.<MapTile>>;
			var mapTile:MapTile;
			//
			var i:uint = 0;
			var j:uint = 0;
//			var lockAreaMap:IMapData = mapInfo.mapData;
			var isSolid:Boolean = false;
//			var url:String = ClientConfig.getMapDataConfig(mapInfo.mapData.mapPackName);
			if(mapDataInfo.mapMoveData && mapDataInfo.mapShadeData)
			{
				var yLen:int = mapDataInfo.mapMoveData.length;
				var xLen:int = mapDataInfo.mapMoveData[0].length;
				for (i=0; i<xLen; i++) 
				{
					mapTiles[i] = new Vector.<MapTile>(yLen);
					mapSolids[i] = new Vector.<uint>(yLen);
					for(j=0;j<yLen;j++)
					{
						mapTile = new MapTile(i,j);
						mapTiles[i][j] = mapTile;
					
						isSolid = mapDataInfo.mapMoveData[j][i];
						
						mapTile.isSolid = isSolid;
						mapSolids[i][j] = isSolid?1:0;
						mapTile.isMask = mapDataInfo.mapShadeData[j][i];
					}
				}
			}
			mapConfig.mapTiles = mapTiles;
			mapConfig.mapSolids = mapSolids;
		}
		
		private static var _showSoildGridList:Vector.<Sprite> = new Vector.<Sprite>;
		private static var _showMaskGridList:Vector.<Sprite> = new Vector.<Sprite>;
		private static var _hasShowSoildGrid:Boolean = false;
		private static var _hasShowMaskGrid:Boolean = false;
		private static var _rawMapMoveDataDic:Dictionary = new Dictionary();
		private static var _delayInitTween:TweenLite;
		/**<地图最外层的区域 限制空气墙的ID>*/
		public static var MAP_LOCK_AREA_FENCE_ID:int = int.MAX_VALUE;
		public static var MAP_LOCK_AREA_LAYER_STOSRY_FENCE_ID:int = MAP_LOCK_AREA_FENCE_ID - 1;
		
		public static function autoShowSoildGrid():void
		{
			var sp:Sprite;
			while(_showSoildGridList.length)
			{
				sp = _showSoildGridList.shift();
				DisplayUtil.removeForParent(sp);
			}
			if(_hasShowSoildGrid)
			{
				_hasShowSoildGrid = false;
				return;
			}
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.align = TextFormatAlign.CENTER;
			
			var mapTiles:Vector.<Vector.<MapTile>> =  Scene.scene.mapConfig.mapTiles;
			for each(var mapVec:Vector.<MapTile> in mapTiles)
			{
				for each(var mapTile:MapTile in mapVec)
				{
					if(mapTile.isSolid)
					{
						/*sp = UIUtil.getRect(50,50,0xff0000,0.6);
						Scene.scene.sceneStageLayer.addChild(sp);
						sp.x = mapTile.x;
						sp.y = mapTile.y;
						//
						var txt:TextField = new TextField();
						txt.textColor = 0x00ff00;
						txt.width = sp.width;
						txt.height = 20;
						txt.defaultTextFormat = txtFormat;
						txt.text = mapTile.tile_x + "/" + mapTile.tile_y;
						sp.addChild(txt);
						//
						_showSoildGridList.push(sp);*/
					}
				}
			}
			_hasShowSoildGrid = true;
		}
		
		public static function autoShowMaskGrid():void
		{
			var sp:Sprite;
			while(_showMaskGridList.length)
			{
				sp = _showMaskGridList.shift();
				DisplayUtil.removeForParent(sp);
			}
			
			if(_hasShowMaskGrid)
			{
				_hasShowMaskGrid = false;
				return;
			}
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.align = TextFormatAlign.CENTER;
			
			var mapTiles:Vector.<Vector.<MapTile>> =  Scene.scene.mapConfig.mapTiles;
			for each(var mapVec:Vector.<MapTile> in mapTiles)
			{
				for each(var mapTile:MapTile in mapVec)
				{
					if(mapTile.isMask)
					{
						/*sp = UIUtil.getRect(50,50,0xffffff,0.6);
						Scene.scene.sceneStageLayer.addChild(sp);
						sp.x = mapTile.x;
						sp.y = mapTile.y;
						//
						var txt:TextField = new TextField();
						txt.textColor = 0x00ff00;
						txt.width = sp.width;
						txt.height = 20;
						txt.defaultTextFormat = txtFormat;
						txt.text = mapTile.tile_x + "/" + mapTile.tile_y;
						sp.addChild(txt);
						//
						_showMaskGridList.push(sp);*/
					}
				}
			}
			_hasShowMaskGrid = true;
		}
		
		/**
		 * 获取地图数据
		 * @param type 数据类型
		 * @param data 地图数据
		 * @param isDefault 是否默认数据
		 * @param defaultData 默认数据的值
		 */
		/*private static function getMapData(type:int = -1,data:ByteArray = null,isDefault:Boolean = false,defaultData:Boolean = false):Vector.<Vector.<Boolean>>
		{
			var bitSetY:Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>(_numBlocksY);
			var bitSetX:Vector.<Boolean>;
			for (var i:int = 0; i < _numBlocksY; i++) 
			{
				bitSetX = new Vector.<Boolean>(_numBlocksX);
				
				for (var j:int = 0; j < _numBlocksX; j++) 
				{
					if(isDefault)
					{
						bitSetX[j] = defaultData;
					}
					else
					{
						bitSetX[j] = isBitSet(j, i, data);//为true时，可PK
					}
				}
				bitSetY[i] = bitSetX;
			}
			return bitSetY;
		}*/
		
		/**
		 * 获取场景里的传送点列表
		 * @param mapId   要获取的地图id
		 * @return 
		 * 
		 */		
		public static function getMapTransportArr(mapId:int):Array
		{
			var mapInfo:MapInfo = getMapInfo(mapId);
			if(mapInfo)
			{
				if(mapInfo.mapData is NormalSceneData)
				{
					return NormalSceneData(mapInfo.mapData).transports;
				}
			}
			return null;
		}
		
		private static function isBitSet(x:int,y:int,data:ByteArray):Boolean
		{
			var index:int = y * _numBlocksX + x;
			var b:int = data[int(index / 8)];
			var pos:int = index % 8;
			return ((b >>> pos) & 1) == 1;
		}
		
		public static function isNormalScene(mapId:int):Boolean
		{
			var mapInfo:MapInfo = getMapInfo(mapId);
			if(mapInfo)
			{
				return mapInfo.mapData.isNormalScene;
			}
			return false;
		}
		
		/**
		 * 得到某个类型场景的集合 
		 * @param type EnumMapType.xxx
		 * @return 
		 * 
		 */		
		public static function getMapInfosByType(type:int):Vector.<MapInfo>
		{
			return _mapTypeMap.getValue(type);
		}
		/**
		 * 
		 * @param type  EnumMapType.XXX
		 * @param sceneId
		 * @return 
		 * 
		 */		
		public static function getMapInfosBySceneId(type:int,sceneId:int):IMapData
		{ 
			var typeMapInfoDic:Dictionary = _scenenIdMapInfoDic[type];
			if (typeMapInfoDic) 
			{
				return typeMapInfoDic[sceneId];
			}
			return null;
		} 
		
		public static function getMapNamRes(id:int):String
		{
			var mapInfo:MapInfo = getMapInfo(id);
			if(mapInfo)
			{
				if(mapInfo.mapData.mapNameResource == null)
				{
					return "1";		
				}else
				{
					return mapInfo.mapData.mapNameResource;
				}
			}
			return id.toString();
		}
		
		public static function isCanUseMedicine(mapId:uint):Boolean
		{
			var mapInfo:MapInfo = getMapInfo(mapId);
			if(mapInfo)
			{
				return mapInfo.mapData.isCanUseMedicine;
			}
			return false;
		}
		
		private static function getDynamicBlockKey( ...arg ):String
		{
			return arg.join( "_" );
		}
		//		public static function addCanWalkAreaDynamicBlock( startX:int, startY:int, endX:int, endY:int, res:String = "ui_bianjietexiao_a_add" ):void
		public static function addCanWalkAreaDynamicBlock( startX:int, startY:int, endX:int, endY:int, res:String = "80007" ):void
		{
			if( _dynamicBlockCanWalkAreas == null )
			{
				_dynamicBlockCanWalkAreas = new Dictionary();
				_dynamicBlockCanWalkAreaKeys = new Vector.<String>();
			}
			var key:String = getDynamicBlockKey( startX, startY, endX, endY );
			var dynamicBlock:MapDynamicBlockAreaInfo = new MapDynamicBlockAreaInfo();
			dynamicBlock.startX = startX;
			dynamicBlock.startY = startY;
			dynamicBlock.endX = endX;
			dynamicBlock.endY = endY;
			dynamicBlock.res = res;
			if( _dynamicBlockCanWalkAreas[ key ] != null )
			{
				var index:int = _dynamicBlockCanWalkAreaKeys.indexOf( key );
				_dynamicBlockCanWalkAreaKeys.splice( index, 1 );
			}
			_dynamicBlockCanWalkAreas[ key ] = dynamicBlock;
			_dynamicBlockCanWalkAreaKeys.push( key );
		}
		
		public static function delCanWalkAreaDynamicBlock( startX:int, startY:int, endX:int, endY:int ):void
		{
			if( _dynamicBlockCanWalkAreas == null )
			{
				return;
			}
			var key:String = getDynamicBlockKey( startX, startY, endX, endY );
			if( _dynamicBlockCanWalkAreas[ key ] != null )
			{
				var index:int = _dynamicBlockCanWalkAreaKeys.indexOf( key );
				_dynamicBlockCanWalkAreaKeys.splice( index, 1 );
			}
			delete _dynamicBlockCanWalkAreas[ key ];
		}
		
		public static function clearAllCanWalkAreaDynamicBlock():void
		{
			if( _dynamicBlockCanWalkAreas == null )
			{
				return;
			}
			_dynamicBlockCanWalkAreaKeys.length = 0;
			_dynamicBlockCanWalkAreas = new Dictionary();
		}
		
		public static function getCanWalkAreaDynamicBlock():MapDynamicBlockAreaInfo
		{
			if( _dynamicBlockCanWalkAreaKeys == null || _dynamicBlockCanWalkAreaKeys.length == 0 )
			{
				return null;
			}
			return _dynamicBlockCanWalkAreas[ _dynamicBlockCanWalkAreaKeys[ _dynamicBlockCanWalkAreaKeys.length - 1 ] ];
		}
		
		public static function checkIsInCanWalkDynamicBlock( pixelX:int, pixelY:int ):Boolean
		{
			if( _dynamicBlockCanWalkAreas == null )
			{
				_dynamicBlockCanWalkAreas = new Dictionary();
			}
			var isInArea:Boolean = true;
			//必须在所有区域内，也就是小的区域必须是在大的区域里的，要是在外面，又不能走过去，没意义的
			for each( var dynamicBlock:MapDynamicBlockAreaInfo in _dynamicBlockCanWalkAreas )
			{
				if( pixelX < dynamicBlock.startX || pixelX > dynamicBlock.endX || pixelY < dynamicBlock.startY || pixelY > dynamicBlock.endY )
				{
					return false;
				}
			}
			return true;
		}
	}
}