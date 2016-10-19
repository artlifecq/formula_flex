package com.rpgGame.coreData.info.map.map2d.area
{
	import flash.utils.Dictionary;

	/**
	 * @author liangsong
	 * 创建时间:2016-2-17 上午11:24:52
	 * 地图区域资源信息
	 */
	public class MapAreaResInfo
	{
		/**<key:MapAreaType.XXX,value:Vector.<MapAreaInfo>>*/
		private var _areaDic:Dictionary = new Dictionary();
		private var _allAreas:Vector.<MapAreaInfo> = new Vector.<MapAreaInfo>();
		private var _mapWidth:int;
		private var _mapHeight:int;
		private var _areaTypes:Vector.<String> = new Vector.<String>();
		private var _mapId:int;
		public function MapAreaResInfo(areaResInfo:Object, mapId:int)
		{
			_mapId = mapId;
			var linkPaths:Array = areaResInfo.linkPaths;
			if (linkPaths) 
			{
				var ilen:int = linkPaths.length;
				for (var i:int = 0; i < ilen; i++) 
				{
					var pathInfo:Object = linkPaths[i];
					var mapAreaInfo:MapAreaInfo = new MapAreaInfo(pathInfo, mapId);
					var mapAreaInfos:Vector.<MapAreaInfo> = _areaDic[mapAreaInfo.type];
					if (mapAreaInfos == null) 
					{
						mapAreaInfos = new Vector.<MapAreaInfo>();
						_areaDic[mapAreaInfo.type] = mapAreaInfos;
						_areaTypes.push(mapAreaInfo.type);
					}
					
					mapAreaInfos.push(mapAreaInfo);
					_allAreas.push(mapAreaInfo);
				} 


				/**<如果有战争迷雾区域，对区别进行排行，以便服务器记录走过的区域ID>*/
				/*mapAreaInfos = getMapAreaInfos(MapAreaType.AREA);
				if (mapAreaInfos) 
				{
					mapAreaInfos.sort(sortMapAreaInfo);
					var jlen:int = mapAreaInfos.length;
					for (var j:int = 0; j < jlen; j++) 
					{
						mapAreaInfos[j].index = j;
					}
				}*/
 
				_mapWidth = areaResInfo.mapWidth;
				_mapHeight = areaResInfo.mapHeight;
			}
		}

		public function get mapId():int
		{
			return _mapId;
		}

	 

		public function get areaTypes():Vector.<String>
		{
			return _areaTypes;
		}
		
		public function set areaTypes(value:Vector.<String>):void
		{
			_areaTypes = value;
		}
		public function get allAreas():Vector.<MapAreaInfo>
		{
			return _allAreas;
		}

		/**
		 *划分区域时，编辑的图片宽度 
		 * @return 
		 * 
		 */		
		public function get mapWidth():int
		{
			return _mapWidth;
		}
		/**
		 *划分区域时，编辑的图片高度 
		 * @return 
		 * 
		 */		
		public function get mapHeight():int
		{
			return _mapHeight;
		}
		private function sortMapAreaInfo(a:MapAreaInfo,b:MapAreaInfo):int
		{
			if (a.name > b.name) 
			{
				return 1;
			}
			else if (a.name < b.name) 
			{
				return -1;
			}
			return 0;
		}
		/**
		 *根据获得所有 指定类型的区域
		 * @param mapAreaType MapAreaType.XXX
		 * @return 
		 * 
		 */
		public function getMapAreaInfos(mapAreaType:String):Vector.<MapAreaInfo>
		{
			return _areaDic[mapAreaType];
		}
		public function dispose():void
		{
			_areaDic = null;
		}
	}
}