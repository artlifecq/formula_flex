package com.rpgGame.coreData.cfg {
    import com.gameClient.utils.JSONUtil;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.role.SceneTranportData;
    
    import flash.geom.Point;
    import flash.geom.Vector3D;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class TransCfgData {
        private static var _dataDic : Dictionary = new Dictionary();

        public static function setup(data : ByteArray) : void {
            var arr : Array = data.readObject();
            var list : Vector.<Q_map_transfer>;
            for each(var info : Q_map_transfer in arr) {
                list = _dataDic[info.q_map_id];
                if (null == list) {
                    list = new Vector.<Q_map_transfer>();
                    _dataDic[info.q_map_id] = list;
                }
                list.push(info);
            }
        }

        public static function getTranBySceneID(sceneID : uint) : Vector.<Q_map_transfer> {
            return _dataDic[sceneID];
        }
        
        public static function getSceneTransportDatas(sceneID : uint) : Array
        {
            var arr : Array = new Array();
            var list : Vector3D.<Q_map_transfer> = _dataDic[sceneID];
            if (null == list) {
                return [];
            }
            for each (var data : Q_map_transfer in list)
            {
                if (data.q_map_id == sceneID)
                {
                    var tranportData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
                    tranportData.setConfigData(data);
                    arr.push(tranportData);
                }
            }
            return arr;
        }
		/**返回当前地图的所有传送点列表
		 * 数据为Obj  目的地 destMapId  x y
		 * */
		public static function getSceneTransportObj(sceneID : uint,job:int) : Array
		{
			var arr : Array = new Array();
			var list : Vector3D.<Q_map_transfer> = _dataDic[sceneID];
			if (null == list) {
				return [];
			}
			for each (var data : Q_map_transfer in list)
			{
				if (data.q_map_id == sceneID)
				{
					var did:int=getTransportSceneId(data,job);
					var sourceArea:Vector.<Point>=AreaCfgData.getAreaPointsByID(data.q_tran_source_area_id);//传送区域点
					var centerPoint:Point=AreaCfgData.getAreaPointsCenter(sourceArea);//传送区域中点
					if(did>0&&centerPoint)
					{
						var tranportData :Object=new Object();
						tranportData.destMapId=did;
						//tranportData.x=data.q_tran_res_x;
						//tranportData.y=data.q_tran_res_y;
						tranportData.x=centerPoint.x;
						tranportData.y=centerPoint.y;
						arr.push(tranportData);
					}
					
				}
			}
			return arr;
		}
		/**返回当前地图的所有传送点列表
		*/
		public static function getTransportSceneId(tranportData:Q_map_transfer,job:int) : int
		{
			var aid:int;
			if(tranportData.q_tran_dest_area_id==0)
			{
				var jobArea:Array=JSONUtil.decode(tranportData.q_tran_dest_area_by_job);
				var destAid:int=0;
				if(jobArea&&jobArea.length>0)
				{
					for(var i:int=0;i<jobArea.length;i++)
					{
						if(jobArea[i][0]==job)
						{
							aid= jobArea[i][1];
						}
					}
				}
			}
			else
			{
				aid= tranportData.q_tran_dest_area_id;
			}
			if(aid>0)
			{
				return AreaCfgData.getAreaMapidByID(aid);
			}
			
			return 0;
		}
        public function TransCfgData() {
        }
    }
}
