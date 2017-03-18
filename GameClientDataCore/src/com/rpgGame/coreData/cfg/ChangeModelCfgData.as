package com.rpgGame.coreData.cfg
{
    import com.rpgGame.coreData.clientConfig.ChangeModel;
    
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class ChangeModelCfgData
    {
        private static var _dataDic : Dictionary = new Dictionary();
        public static function setup(data : ByteArray) : void {
            var arr : Array = data.readObject();
            for each(var info : ChangeModel in arr) {
                _dataDic[info.id] = info;
            }
        }
        
        public static function getInfoById(id : int) : ChangeModel {
            return _dataDic[id];
        }
        
        public function ChangeModelCfgData()
        {
        }
    }
}