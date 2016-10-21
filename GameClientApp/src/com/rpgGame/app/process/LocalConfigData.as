package com.rpgGame.app.process
{
    import com.game.engine3D.process.BaseProcess;
    import com.gameClient.log.GameLog;
    import com.rpgGame.coreData.info.MapDataManager;
    
    import flash.utils.ByteArray;
    
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
            GameLog.addShow("制造假数据结束");
            this.completeProcess();
        }
    }
}