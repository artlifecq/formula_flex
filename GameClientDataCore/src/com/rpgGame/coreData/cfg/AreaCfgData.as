package com.rpgGame.coreData.cfg
{
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

        public static function setup(data : ByteArray) : void {
            var arr : Array = data.readObject();
			
			
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
    }
}