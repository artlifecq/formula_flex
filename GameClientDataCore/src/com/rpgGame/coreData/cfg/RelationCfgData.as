package com.rpgGame.coreData.cfg
{
    import com.rpgGame.coreData.clientConfig.Q_relation;
    import com.rpgGame.coreData.role.RoleData;
    
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class RelationCfgData
    {
        private static var _dataDic : Dictionary = new Dictionary();
        // 敌对关系
        private static var _enemyDic : Dictionary = new Dictionary();
        
        public static function setup(data : ByteArray) : void {
            var arr : Array = data.readObject();
            var index : int = -1;
            for each(var info : Q_relation in arr) {
                _dataDic[info.q_id] = info;
                
                if (info.q_enemy.length > 0 && (index = info.q_enemy.lastIndexOf("]")) > 1) {
                    var enemyArray : Array = info.q_enemy.substring(1, index).split(",");
                    _enemyDic[info.q_id] = enemyArray;
                }
            }
        }
        
        public static function getInfoById(id : int) : Q_relation {
            return _dataDic[id];
        }
        
        public static function isEnemy(attack : RoleData, target : RoleData) : Boolean {
            var relation : Array = _enemyDic[attack.relation];
            if (null == relation || 0 == relation.length) {
                return true;
            }
            for (var i : int = 0, len : int = relation.length; i < len; ++i) {
                if (attack.relation == relation[i]) {
                    return false;
                }
            }
            // 判断阵营关系
            return true;
        }
        
        public function RelationCfgData()
        {
        }
    }
}