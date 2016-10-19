package com.rpgGame.coreData.info
{
	import com.rpgGame.coreData.info.map.SceneData;

	import app.message.SceneConfig;
	import app.message.SceneProto;

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

		public static function setSceneConfig(sceneConfig : SceneConfig) : void
		{
			parseSceneConfig(sceneConfig.scenes);
//			parseSceneConfig(sceneConfig.familyDungeon);
//			parseSceneConfig(sceneConfig.jailScene);
//			parseSceneConfig(sceneConfig.familyWarDungeon);
//			parseSceneConfig(sceneConfig.familyAnimalScene);
		}

		private static function parseSceneConfig(data : Object) : void
		{
			if (data is Array) //如果是数组,就是多份地图数据
			{
				for each (var mapProto : SceneProto in data)
				{
					addMapInfo(mapProto);
				}
			}
			else if (data is SceneProto)
			{
				addMapInfo(data as SceneProto);
			}
			else
			{
				trace("当前场景不存在");
			}
		}

		private static function addMapInfo(mapProto : SceneProto) : void
		{
			var sceneData : SceneData = new SceneData();
			sceneData.setData(mapProto);
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
