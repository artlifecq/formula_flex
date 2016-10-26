package com.rpgGame.app.process
{
    import com.game.engine3D.process.BaseProcess;
    import com.gameClient.log.GameLog;
    import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
    import com.rpgGame.coreData.info.MapDataManager;
    
    import flash.utils.ByteArray;
    
    import app.message.MonsterConfig;
    import app.message.MonsterDataProto;
    import app.message.SceneProto;
    
    public class LocalConfigData extends BaseProcess {
        public function LocalConfigData() {
            super();
        }
        
        public override function getState() : String {
            return ProcessState.STATE_LOCAL_CONFIG_DATA;
        }
        
        public override function startProcess() : void {
            super.startProcess();
            GameLog.addShow("制造假数据开始");
            GameLog.addShow("制造场景数据");
            var _6SceneData : SceneProto = new SceneProto();
            _6SceneData.sceneId = 6;
            _6SceneData.map = "yl_scene01_wcnc";
            var tmp : ByteArray = new ByteArray();
            tmp.writeUTFBytes("测试地图")
            _6SceneData.name = tmp;
            MapDataManager.addMapInfo(_6SceneData);
            GameLog.addShow("制造怪物数据");
            var monsterConfig : MonsterConfig = new MonsterConfig();
            monsterConfig.monsters = [];
            var _1MonsterData : MonsterDataProto = new MonsterDataProto();
            _1MonsterData.id = 1;
            _1MonsterData.level = 1;
            _1MonsterData.scale = 10;
            _1MonsterData.name = "普怪-奴5";
            _1MonsterData.bodyRes = "monster/1/m_ly05";
            monsterConfig.monsters.push(_1MonsterData);
            var _2MonsterData : MonsterDataProto = new MonsterDataProto();
            _2MonsterData.id = 2;
            _2MonsterData.level = 1;
            //_2MonsterData.scale = 10;
            _2MonsterData.name = "普怪-奴5";
            _2MonsterData.bodyRes = "role/17/male_fashi_animation";
            monsterConfig.monsters.push(_2MonsterData);
            MonsterDataManager.setConfig(monsterConfig);
            GameLog.addShow("制造假数据结束");
            this.completeProcess();
        }
    }
}