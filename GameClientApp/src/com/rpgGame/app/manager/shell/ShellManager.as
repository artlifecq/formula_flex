package com.rpgGame.app.manager.shell
{
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.coreData.info.buff.BuffInfo;
    import com.rpgGame.coreData.role.MonsterData;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.utils.Dictionary;

    /*********************************************************************************************************
     * 单机版 指令管理
     ********************************************************************************************************/
    public class ShellManager {
        private static var _instance : ShellManager = new ShellManager();
        
        private var _funcs : Dictionary;
        
        private var _monsterID : uint = 0;
        
        public function ShellManager() {
            this._funcs = new Dictionary();
            this._funcs["help"] = this.help;
            this._funcs["gotomap"] = this.gotoMap;
            this._funcs["addMonster"] = this.addMonster;
        }
        
        private function help() : void {
            GameLog.addShow("Command Help");
        }
        
        private function gotoMap(mapID : uint, x : int, y : int) : void {
            MainRoleManager.actorInfo.mapID = mapID;
            SceneSwitchManager.changeMap();
            MainRoleManager.actorInfo.x = x;
            MainRoleManager.actorInfo.y = y;
        }
        
        private function addMonster(id : int, x : int, y : int) : void {
            var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
            data.modelID = id;
            data.id = ++this._monsterID;
            data.x = x;
            data.y = y;
            data.hp = 1000;
            data.totalStat.life = 1000;
            data.mp = 1000;
            data.totalStat.mana = 1000;
            data.buffList = new Vector.<BuffInfo>();
            var m : SceneRole = SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
        }
        
        private function handler(command : String, ...params) : void {
            var func : Function = this._funcs[command];
            if (null == func) {
                return;
            }
            try {
                func.apply(this, params);
            } catch(e) {
                GameLog.addError(e);
            }
        }
        
        public static function parse(content : String) : void {
            var params : Array = content.split(" ");
            _instance.handler.apply(_instance, params);
        }
    }
}