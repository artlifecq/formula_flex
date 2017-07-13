package com.rpgGame.coreData.cfg
{
    import com.game.engine3D.vo.map.ClientMapAreaData;
    import com.game.engine3D.vo.map.MapAreaTypeEnum;
    import com.rpgGame.coreData.clientConfig.Q_area;
    
    import flash.geom.Point;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class AreaCfgData
    {
        public function AreaCfgData()
        {
        }
        
        private static var _dataDic : Dictionary = new Dictionary();
        private static var _posDic : Dictionary = new Dictionary();
		private static var _arras:Vector.<ClientMapAreaData>=new Vector.<ClientMapAreaData>();
        public static function setup(data : ByteArray) : void {
            var arr : Array = data.readObject();
			
			var areaData:ClientMapAreaData;
            for each(var info : Q_area in arr) {
                _dataDic[info.q_area_id] = info;
                var points : Vector.<Point> = new Vector.<Point>();
                var allPoint : Array = info.q_pos.split(";");
                for (var i : int = 0, len : int = allPoint.length; i < len; ++i) {
                    var xy : Array = allPoint[i].split("=");
                    if (2 != xy.length) {
                        continue;
                    }
                    points.push(new Point(int(xy[0]), int(xy[1])));
                }
                _posDic[info.q_area_id] = points;
				
				
				if(info.q_type!=0)///加入不同类型区域数据      0是传送门 不用处理         ---yt
				{
					areaData=new ClientMapAreaData();
					areaData.id=info.q_area_id;
					areaData.mapid=info.q_map_id;
					areaData.type=info.q_type;
					areaData.points=points;
					_arras.push(areaData);
				}
            }
			
			
        }

        public static function getAreaByID(id : uint) : Q_area {
            return _dataDic[id];
        }
        
		public static function getAreaMapidByID(id : uint) : int {
			var adata:Q_area=_dataDic[id];
			if(adata!=null)
			{
				return adata.q_map_id;
			}
			return 0;
		}
		
		
        public static function getAreaPointsByID(id : uint) : Vector.<Point> {
            return _posDic[id];
        }
		/**计算多边形中点*/
		public static function getAreaPointsCenter(points:Vector.<Point>) : Point {
			
			if(points&&points.length>0)
			{
				var center:Point=new Point();
				var addX:Number=0,addY:Number=0;
				for(var i:int=0;i<points.length;i++)
				{
					addX+=points[i].x;
					addY+=points[i].y;
				}
				center.x=addX/points.length;
				center.y=addY/points.length;
				return center;
			}
			
			return null;
		}
		
		
		/**根据地图id返回阻挡点*/
		public static function getObstacleAreas(mid:int) : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in _arras)
			{
				if (areaData.mapid==mid&&areaData.type ==MapAreaTypeEnum.OBSTACLE)
				{
					areaSet.push(areaData);
				}
			}
			return areaSet;
		}
		/**根据id返回 动态阻挡点*/
		public static function getDynamicObstacleAreas(aid:int) : ClientMapAreaData
		{
			for each (var areaData : ClientMapAreaData in _arras)
			{
				if (areaData.id==aid&&areaData.type ==MapAreaTypeEnum.DYNAMIC_OBSTACLE)
				{
					return areaData;
				}
			}
			return null;
		}
		
		/**根据地图id返回触发点*/
		public static function getTriggerAreas(mid:int) : Vector.<ClientMapAreaData>
		{
			var areaSet : Vector.<ClientMapAreaData> = new Vector.<ClientMapAreaData>();
			for each (var areaData : ClientMapAreaData in _arras)
			{
				if (areaData.mapid==mid&&areaData.type ==MapAreaTypeEnum.TRIGGER_EVENT)
				{
					areaSet.push(areaData);
				}
			}
			return areaSet;
		}
    }
}