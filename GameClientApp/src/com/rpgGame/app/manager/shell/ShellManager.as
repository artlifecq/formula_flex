package com.rpgGame.app.manager.shell
{
    import com.game.engine2D.Scene;
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
    import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.coreData.info.buff.BuffInfo;
    import com.rpgGame.coreData.role.MonsterData;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.utils.Dictionary;
    
    import away3d.containers.PlanarContainer3D;
    import away3d.core.math.Plane3D;
    
    import org.game.netCore.net.ByteBuffer;

    /*********************************************************************************************************
     * 单机版 指令管理
     ********************************************************************************************************/
    public class ShellManager {
        private static var _instance : ShellManager = new ShellManager();
        
        private var _funcs : Dictionary;
        
        private var _monsterID : uint = 0;
        
        public function ShellManager() {
            this._funcs = new Dictionary();
            this._funcs["help".toLowerCase()] = this.help;
            this._funcs["gotomap".toLowerCase()] = this.gotoMap;
            this._funcs["addMonster".toLowerCase()] = this.addMonster;
            this._funcs["skill".toLowerCase()] = this.skill;
            this._funcs["camera".toLowerCase()] = this.camera;
            this._funcs["show".toLowerCase()] = this.show;
            this._funcs["hide".toLowerCase()] = this.hide;
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
        
        private function skill(id : int) : void {
            var m : SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
            var buffer : ByteBuffer = new ByteBuffer();
            buffer.writeVarint32(1);
            buffer.writeVarint32(0);
            buffer.writeVarint64(m.id);
            buffer.writeVarint32(m.x);
            buffer.writeVarint32(m.z);
            buffer.writeVarint64(0);
            buffer.writeVarint32(m.x);
            buffer.writeVarint32(m.z);
            buffer.position = 0;
            var info : ReleaseSpellInfo = new ReleaseSpellInfo();
            info.readFrom(1, buffer);
            ReleaseSpellHelper.releaseSpell(info);
        }
        
        private function camera(angle : int) : void {
            var _angle : Number = ((90 - Math.abs(angle)) * Math.PI) / 180.0;
            var plane:Plane3D = new Plane3D(0,Math.cos(_angle), -Math.sin(_angle));
            SceneManager.getScene().sceneMapLayer.view3DAsset.cameraMode2DAngle = angle;
            Scene.scene.directionalLight.planarShadowPlane = plane;
            PlanarContainer3D.planarRotationX = -angle;
        }
        
        private function show() : void {
            RotateGizmo3D.instance().show(null);
        }
        
        private function hide() : void {
            RotateGizmo3D.instance().hide();
        }
        
        private function handler(command : String, ...params) : void {
            var func : Function = this._funcs[command.toLowerCase()];
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