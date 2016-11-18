package com.rpgGame.app.process
{
    import com.game.engine3D.process.BaseProcess;
    import com.gameClient.log.GameLog;
    import com.rpgGame.coreData.cfg.AnimationDataManager;
    import com.rpgGame.coreData.cfg.SpellEffectDataManager;
    import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.coreData.type.SpellBlinkType;
    
    import flash.utils.ByteArray;
    
    import app.message.AnimationConfig;
    import app.message.AnimationProto;
    import app.message.MonsterConfig;
    import app.message.MonsterDataProto;
    import app.message.SceneProto;
    import app.message.SpellEffectProto;
    
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
            var _8SceneData : SceneProto = new SceneProto();
            _8SceneData.sceneId = 8;
            _8SceneData.map = "yl_scene01_wc";
            tmp = new ByteArray();
            tmp.writeUTFBytes("测试地图")
            _8SceneData.name = tmp;
            MapDataManager.addMapInfo(_8SceneData);
            GameLog.addShow("制造怪物数据");
            var monsterConfig : MonsterConfig = new MonsterConfig();
            monsterConfig.monsters = [];
            var _1MonsterData : MonsterDataProto = new MonsterDataProto();
            _1MonsterData.id = 1;
            _1MonsterData.level = 1;
            //_1MonsterData.scale = 10;
            _1MonsterData.name = "普怪-奴5";
            _1MonsterData.bodyRes = "monster/1/m_ly_05";
            monsterConfig.monsters.push(_1MonsterData);
            var _2MonsterData : MonsterDataProto = new MonsterDataProto();
            _2MonsterData.id = 2;
            _2MonsterData.level = 1;
            //_2MonsterData.scale = 10;
            _2MonsterData.name = "普怪-奴5";
            _2MonsterData.bodyRes = "role/17/male_fashi_animation";
            monsterConfig.monsters.push(_2MonsterData);
            var _3MonsterData : MonsterDataProto = new MonsterDataProto();
            _3MonsterData.id = 3;
            _3MonsterData.level = 1;
            //_2MonsterData.scale = 10;
            _3MonsterData.name = "普怪-奴5";
            _3MonsterData.bodyRes = "role/18/xqj-bingjia-10s";
            monsterConfig.monsters.push(_3MonsterData);
            var _4MonsterData : MonsterDataProto = new MonsterDataProto();
            _4MonsterData.id = 4;
            _4MonsterData.level = 1;
            //_2MonsterData.scale = 10;
            _4MonsterData.name = "普怪-奴5";
            _4MonsterData.bodyRes = "role/19/main_man_char";
            monsterConfig.monsters.push(_4MonsterData);
            MonsterDataManager.setConfig(monsterConfig);
            GameLog.addShow("制造技能动画数据");
            var animationConfig : AnimationConfig = new AnimationConfig();
            animationConfig.animations = [];
            var _1singleAnimation : AnimationProto = new AnimationProto();
            _1singleAnimation.id = 1;
            _1singleAnimation.roleRes = "tx_suit_knife1_570_pugong";
            animationConfig.animations.push(_1singleAnimation);
            var _2singleAnimation : AnimationProto = new AnimationProto();
            _2singleAnimation.id = 2;
            _2singleAnimation.roleRes = "skill/zadi";
            animationConfig.animations.push(_2singleAnimation);
            AnimationDataManager.setConfig(animationConfig);
            var spellEffect : SpellEffectProto = new SpellEffectProto();
            spellEffect.id = 1;
            spellEffect.attackMotionId = 215;
            spellEffect.breakFrameTime = 100;
            spellEffect.castAnimation = 2;
            SpellEffectDataManager.addData(spellEffect);
            spellEffect = new SpellEffectProto();
            spellEffect.id = 2;
            spellEffect.attackMotionId = 215;
            spellEffect.caromStartFrameTime = 100;
            spellEffect.castAnimation = 1;
            SpellEffectDataManager.addData(spellEffect);
            spellEffect = new SpellEffectProto();
            spellEffect.id = 3;
            spellEffect.blinkType = SpellBlinkType.TIAO_PI;
            spellEffect.blinkSpeed = 200;
            spellEffect.blinkHeight = 1000;
            spellEffect.soarFrameTime = 200;
            spellEffect.attackMotionId = 220;
            SpellEffectDataManager.addData(spellEffect);
            GameLog.addShow("制造假数据结束");
            this.completeProcess();
        }
    }
}
