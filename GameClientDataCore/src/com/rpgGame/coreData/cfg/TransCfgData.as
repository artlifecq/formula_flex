package com.rpgGame.coreData.cfg {
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.role.SceneTranportData;
    
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

        public function TransCfgData() {
        }
    }
}
