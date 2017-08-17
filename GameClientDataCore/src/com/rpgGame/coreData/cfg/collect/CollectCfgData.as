package com.rpgGame.coreData.cfg.collect
{
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	
	import org.client.mainCore.ds.HashMap;

	public class CollectCfgData
	{
		private static var _map : HashMap = new HashMap();
		private static var _sceneMap : HashMap = new HashMap();

		public function CollectCfgData()
		{
		}

//		public static function setConfig(cfg : CollectObjectConfig) : void
//		{
//			if (cfg == null)
//				return;
//
////				CollectObjectConfig
////				optional int32 start_type_id = 1; //by zgd 可采集物品起始ID，第一个物品就是这个ID，第二个为ID+1，依次类推
//			var startID : int = cfg.startTypeId;
//			for each (var dataProto : CollectObjectProto in cfg.collectObjects)
//			{
//				var objCnt : uint = 0;
//				for each (var id : uint in dataProto.objectId)
//				{
//					var info : CollectObjcetInfo = new CollectObjcetInfo();
//					info.objectID = id;
//					info.type = startID;
//					info.name = String(dataProto.name);
//					info.resource = dataProto.resource;
//					info.isReverse = dataProto.isReverse;
//					info.tileX = dataProto.posX[objCnt];
//					info.tileY = dataProto.posY[objCnt];
//					info.action = dataProto.action;
//					info.sceneID = dataProto.sceneId;
//					info.scale = dataProto.scale;
//					info.direction = dataProto.direction;
//					info.isDynamicCreate = dataProto.isDynamicCreate;
//					info.collectShow = dataProto.collectShow;
//					//
//					objCnt++;
//					//
//					_map.add(info.objectID, info);
//				}
//				startID++; //by zgd
//			}
//		}

		public static function addData(info : CollectObjcetInfo) : void
		{
			_map.add(info.objectID, info);
		}

		public static function getData(objectID : uint) : CollectObjcetInfo
		{
			var data : CollectObjcetInfo = _map.getValue(objectID);
			return data;
		}

		public static function getDataList() : Array
		{
			return _map.getValues();
		}

		public static function getListByType(type : uint) : Vector.<CollectObjcetInfo>
		{
			var list : Vector.<CollectObjcetInfo> = new Vector.<CollectObjcetInfo>;
			var datas : Array = getDataList();
			for each (var info : CollectObjcetInfo in datas)
			{
				if (info.type == type)
				{
					list.push(info);
				}
			}
			return list;
		}

		public static function getListBySceneID(sceneID : uint) : Vector.<CollectObjcetInfo>
		{
			var list : Vector.<CollectObjcetInfo> = _sceneMap.getValue(sceneID);
			if (list)
			{
				return list;
			}
			list = new Vector.<CollectObjcetInfo>;
			for each (var info : CollectObjcetInfo in getDataList())
			{
				if (info.sceneID == sceneID)
				{
					list.push(info);
				}
			}
			_sceneMap.add(sceneID, list);
			return list;
		}

		public static function getRandomColloct(type : uint) : CollectObjcetInfo
		{
			var list : Vector.<CollectObjcetInfo> = getListByType(type);
			var info : CollectObjcetInfo = list.length ? list[uint(list.length * Math.random())] : null;
			return info;
		}
	}
}
