package com.rpgGame.coreData.cfg {
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    
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

        public function TransCfgData() {
        }
    }
}
