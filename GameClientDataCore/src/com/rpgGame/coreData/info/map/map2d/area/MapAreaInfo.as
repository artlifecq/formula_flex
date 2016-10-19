package com.rpgGame.coreData.info.map.map2d.area
{
	import flash.geom.Point;

	/**
	 * @author liangsong
	 * 创建时间:2016-2-17 上午11:06:49
	 * 地图区域信息
	 */
	public class MapAreaInfo
	{
		
		/**<MapAreaType.XXX>*/
		private var _type:String;
		private var _name:String;
		private var _linkNodes:Vector.<Point> = new Vector.<Point>();
		private var _clouds:Vector.<MapCloudInfo>;
		public var index:int;
		private var _mapId:int;
		public function MapAreaInfo(areaObj:Object, mapId:int)
		{
			_mapId = mapId;
			if (areaObj) 
			{
				parseObj(areaObj);
			}
		}
		public function toString():String
		{
			return _mapId + "_" + type + "_" + name;
		}
		public function get mapId():int
		{
			return _mapId;
		}

		public function get clouds():Vector.<MapCloudInfo>
		{
			return _clouds;
		}

		public function get name():String
		{
			return _name;
		}

		/**<MapAreaType.XXX>*/
		public function get type():String
		{
			return _type;
		}

		public function get linkNodes():Vector.<Point>
		{
			return _linkNodes;
		}

		private function parseObj(areaObj:Object):void
		{
			if (areaObj) 
			{
				var points:Array = areaObj.points;
				if (points) 
				{
					var ilen:int = points.length;
					for (var i:int = 0; i < ilen; i++) 
					{
						var pointObj:Object = points[i];
						_linkNodes.push(new Point(pointObj.x,pointObj.y));
					}
				}
				_type = areaObj.type;
				_name = areaObj.name;
				if (areaObj.hasOwnProperty("clouds")) 
				{
					_clouds = new Vector.<MapCloudInfo>();
					var clouds:Array = areaObj.clouds;
					var jlen:int = clouds.length;
					for (var j:int = 0; j < jlen; j++) 
					{
						var cloudInfoObj:Object = clouds[j];
						var cloudInfo:MapCloudInfo = new MapCloudInfo();
						cloudInfo.imageName = cloudInfoObj.imageName;
						cloudInfo.x = cloudInfoObj.x;
						cloudInfo.y = cloudInfoObj.y;
						_clouds.push(cloudInfo);
					}
					
				}
			}
		}
	}
}