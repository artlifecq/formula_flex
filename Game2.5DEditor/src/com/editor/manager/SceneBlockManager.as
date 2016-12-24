package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.TabelData;
	import com.editor.enum.FeaturesType;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.loaders.ResourceBundleInstance;
	
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.loader.UrlLoader;
	import org.client.load.loader.multi.vo.LoadData;
	import org.client.mainCore.ds.HashMap;

	public class SceneBlockManager
	{
		public static const minMapID:int = 10000;
		private const blockNamePrefix:String = "block";
		private const monsterTabelName:String = "怪物表";
		private const blockMonsterTabelName:String = "地图块场景怪";
		private const blockCustomTabelName:String = "地图块剧情怪";
		
		/** 拼接地图块 **/
		private var _linkMaps:Vector.<ResourceBundleInstance> = new Vector.<ResourceBundleInstance>();
		private var _clientMapData:EditorClientMapData;
		/** 当前加载地图块 **/
		private var _curContainer3d:ResourceBundleInstance;
		private var _cmpFun:Function;
		private static var _instance:SceneBlockManager;
		public function SceneBlockManager()
		{
		}
		
		/**
		 * @author 杨剑明  2016-1-8
		 */
		public static function getInstance():SceneBlockManager
		{
			return _instance == null ? _instance = new SceneBlockManager() : _instance; 
		}
		
		/**
		 * 导出地图块配置
		 * @author 杨剑明  2016-1-11
		 */
		public function exportMapArea(cmpFun:Function):Boolean
		{
			_cmpFun = cmpFun;
			var islinkMap:Boolean = false;
			var mapBlock:HashMap = SceneManager.getInstance().mainScene.sceneMapLayer.rootObjectByName;
			if(mapBlock == null)
			{
				return islinkMap;
			}
			_linkMaps.length = 0;;
			var objConts:Array = mapBlock.getValues();
			for each (var container3d:ObjectContainer3D in objConts) 
			{
				if(container3d.name.search(blockNamePrefix) != -1)
				{
					islinkMap = true;
					_linkMaps.push(ResourceBundleInstance(container3d));
				}
			}
			_clientMapData = SceneManager.getInstance().mapData;
			if(islinkMap && _clientMapData)
			{
				_clientMapData.areaDatas = [];
				loadLinkMapData();
			}
			return islinkMap;
		}
		
		
		/**
		 * 加载地图块数据
		 * @author 杨剑明  2016-1-11
		 */
		private function loadLinkMapData():void
		{
			if(_linkMaps.length == 0)
			{
				_cmpFun.apply();
				return;
			}
			_curContainer3d = _linkMaps.shift();
			var mapDataUrl : String = getDataUrl();
			var ld : LoadData = new LoadData(mapDataUrl, onMapDataComplete, null, onMapDataError, "", "", uint.MAX_VALUE, LoadData.URLLOADER_BINARY);
			UrlLoadManager.load(ld);
		}
		
		private function onMapDataComplete(ld:LoadData, e:Event):void
		{
			var loader : UrlLoader = e.currentTarget as UrlLoader;
			var byteArr : ByteArray = loader.data as ByteArray;
			byteArr.uncompress();
			var clientMapData:EditorClientMapData = new EditorClientMapData();
			clientMapData.readFrom(byteArr);
			var areaDatas:Array = clientMapData.areaDatas;
			for (var index:int = 0; index < areaDatas.length; index++) 
			{
				var areaData:ClientMapAreaData = areaDatas[index];
				var points:Vector.<Point> = areaData.getPoints();
				var pointsInfo : Array = [];
				for (var subIndex : int = 0; subIndex < points.length; subIndex++)
				{
					var point:Point = points[subIndex];
					var px : int = point.x + _curContainer3d.x;
					var py : int = point.y + _curContainer3d.z;
					pointsInfo.push(px + "=" + py);
				}
				areaData.mArea = pointsInfo.join(";");
				_clientMapData.areaDatas.push(areaData);
			}
			loadLinkMapData();
		}
		
		private function onMapDataError(ld:LoadData, e:Event):void
		{
			loadLinkMapData();
//			Alert.show("加载地图数据" + getDataUrl() + "出错！");
		}
		
		/**
		 * 保存连接地图怪物配置（只是客户端配置）
		 * @author 杨剑明	 2016-1-6
		 */
		public function saveBlockSceneMonster():Boolean
		{
			var islinkMap:Boolean = false;
			var mapBlock:HashMap = SceneManager.getInstance().mainScene.sceneMapLayer.rootObjectByName;
			if(mapBlock == null)
			{
				return islinkMap;
			}
			var objConts:Array = mapBlock.getValues();
			var serverTabel:TabelData = getTabel(FeaturesType.DECORATE_TYPE,FeaturesType.DECORATE_TYPE,SceneManager.getInstance().mapId,monsterTabelName);
			if(serverTabel == null)
			{
				return islinkMap;
			}
			var hasClear:Boolean = false;
			var configDesc : ConfigDesc = serverTabel.getConfigDesc();
			for each (var container3d:ObjectContainer3D in objConts) 
			{
				if(container3d.name.search(blockNamePrefix) != -1)
				{
					islinkMap = true;
					if(!hasClear)
					{
						removeAllData(configDesc);
						hasClear = true;
					}
					var blockID:int = getBlockID(container3d.name);
					if(blockID == 0)
					{
						continue;
					}
					var clientTabel:TabelData = getTabel(FeaturesType.SCENE_BLOCK_DECORATE_TYPE,FeaturesType.SCENE_BLOCK_DECORATE_TYPE,blockID,blockMonsterTabelName,true);
					var clientConfig:ConfigDesc = clientTabel.getConfigDesc();
					var datas:Dictionary = clientConfig.cacheDic;
					for each (var data:ConfigData in datas) 
					{
						var cfg : ConfigData = ConfigData.create(configDesc, null, null, serverTabel.dataConstructor, true);
						copyTabel(cfg,data);
						cfg.setValue("x",int(cfg.properties["x"]) + int(container3d.x));
						cfg.setValue("y",int(cfg.properties["y"]) + int(container3d.z));
					}
				}
			}
			if(islinkMap)
			{
				var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(serverTabel.mFileDire, SceneManager.getInstance().mapId);
				DataStructuresManager.getInstance().saveTabelConfigData(serverTabel, cfgPath);
			}
			return islinkMap;
		}
		
		/**
		 * 是否为地图块
		 * @author 杨剑明  2016-1-11
		 */
		public function isSceneBlock(mapID:int):Boolean
		{
			return mapID >= minMapID;
		}
		
		/**
		 * 获得地图块对应表中id
		 * @author 杨剑明  2016-1-8
		 */
		private function getBlockID(blockName:String):int
		{
			var id:int;
			var tabels : Array = DataStructuresManager.getInstance().getTabelsByFeature(FeaturesType.SCENE_BLOCK_TYPE);
			for each (var tabel : TabelData in tabels)
			{
				var cacheDic:Dictionary = tabel.desc.cacheDic;
				for each (var data:ConfigData in cacheDic) 
				{
					var str:String = data.properties["blockInfo"].substring(data.properties["blockInfo"].lastIndexOf("/") + 1);
					if( str == blockName)
					{
						id = data.id;
						return id;
					}
				}
			}
			return id;
		}
		
		/**
		 * 获得一张表 
		 * @param featureType
		 * @param mapID
		 * @author 杨剑明  2016-1-8
		 */
		private function getTabel(featureType:String,featureSubType:String,mapID:int,tabelName:String,needLoad:Boolean = false):TabelData
		{
			var serverTabel:TabelData;
			var tabels : Array = DataStructuresManager.getInstance().getTabelsByFeature(featureType);
			
			for each (var tabel : TabelData in tabels)
			{
				if(tabel.name == tabelName && tabel.mSubFeatureType == featureSubType)
				{
					var cfgPath : String = ProjectConfig.getSceneMonsterCfgPath(tabel.mFileDire, mapID);
					if (cfgPath && needLoad)
					{
						DataStructuresManager.getInstance().loadTableConfigData(tabel, cfgPath);
					}
					serverTabel = tabel;
					break;
				}
			}
			
			return serverTabel;
		}
		
		
		/**
		 * 复制表2到表1
		 * @param tabel1
		 * @param tabel2
		 * @author 杨剑明  2016-1-8
		 */
		private function copyTabel(tabel1:ConfigData,tabel2:ConfigData):void
		{
			for (var key:String in tabel2.properties) 
			{
				tabel1.setValue(key,tabel2.properties[key]);
			}
		}
		
		/**
		 * @author 杨剑明  2016-1-8
		 */
		private function removeAllData(configDesc:ConfigDesc):void
		{
			var datas:Dictionary = configDesc.cacheDic;
			for each (var data:ConfigData in datas) 
			{
				ConfigData.remove(configDesc, data.id);
			}
		}
		
		/**
		 *  获得配置数据地址
		 * @author 杨剑明  2016-1-13
		 */
		private function getDataUrl():String
		{
			var url:String = _curContainer3d.resourceBundle.url;
			url = url.substring(0,url.lastIndexOf("/")) + url.substring(url.lastIndexOf("/")) +".data";
			return url;
		}
		
	}
}