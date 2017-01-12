package com.rpgGame.app.manager.shell
{
    import com.game.engine2D.Scene;
    import com.game.engine3D.core.AreaMap;
    import com.game.engine3D.display.shapeArea.ShapeArea3D;
    import com.game.engine3D.manager.Stage3DLayerManager;
    import com.game.engine3D.utils.MathUtil;
    import com.game.engine3D.utils.StatsUtil;
    import com.game.engine3D.vo.AreaMapData;
    import com.game.mainCore.core.manager.LayerManager;
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
    import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
    import com.rpgGame.app.manager.AreaMapManager;
    import com.rpgGame.app.manager.ShortcutsManger;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.sender.SceneSender;
    import com.rpgGame.core.utils.ConsoleDesk;
    import com.rpgGame.coreData.cfg.AreaCfgData;
    import com.rpgGame.coreData.cfg.TransCfgData;
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    import com.rpgGame.coreData.enum.EnumAreaMapType;
    import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
    import com.rpgGame.coreData.info.buff.BuffData;
    import com.rpgGame.coreData.role.MonsterData;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.role.SceneTranportData;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    
    import away3d.containers.PlanarContainer3D;
    import away3d.core.math.Plane3D;
    
    import gameEngine2D.NetDebug;
    
    import org.game.netCore.net_protobuff.ByteBuffer;

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
            this._funcs["status".toLowerCase()] = this.status;
            this._funcs["addLog".toLowerCase()] = this.addLog;
            this._funcs["showTrans".toLowerCase()] = this.showTrans;
            this._funcs["addTrans".toLowerCase()] = this.addTrans;
            this._funcs["showAreaFlag".toLowerCase()] = this.showAreaFlag;
			this._funcs["addSkillToBar".toLowerCase()] = this.addSkillToBar;
			this._funcs["shape".toLocaleLowerCase()] = this.shapeFunc;
        }
		
		private var arr:Vector.<ShapeArea3D> = new Vector.<ShapeArea3D>();	
		private function shapeFunc(type:int,x:Number,y:Number,width:Number):void
		{
			var _measureShapeArea3D:ShapeArea3D;
			if(type == 0)
			{
				for(var i:uint=0;i<arr.length;i++)
				{
					if(arr[i])
					{
						arr[i].dispose();
						arr[i]=null;
					}
				}
			}
			else
			{
                var role : SceneRole = MainRoleManager.actor;
                var dist : Number = MathUtil.getDistance(role.x, role.z, x, y);
                var angle : Number = MathUtil.getAngle(role.x, role.z, x, y);
				_measureShapeArea3D = new ShapeArea3D(SceneManager.getScene().sceneRenderLayer);
				_measureShapeArea3D.updateFill(role.x, 0, role.z, 0xff0000, type,width,1);
				arr.push(_measureShapeArea3D);
                GameLog.addShow("[Shape][x:" + role.x + ",z:" + role.z + "]");
			}
		}
		
		private function addSkillToBar(shortcutPos:int,id:int):void
		{
			ShortcutsManger.getInstance().setShortData(shortcutPos,ShortcutsTypeEnum.SKILL_TYPE,id);
		}
        
        private function help() : void {
            GameLog.addShow("Command Help");
        }
        
        private function gotoMap(mapID : uint, x : int, y : int) : void 
		{
           	SceneSender.sceneMapTransport(mapID,x,y);
        }
        
        private function addMonster(id : int, x : int, y : int) : void {
            var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
            data.modelID = id;
            data.id = ++this._monsterID;
            data.x = x;
            data.y = y;
            data.totalStat.hp = 1000;
            data.totalStat.life = 1000;
            data.totalStat.mp = 1000;
            data.totalStat.mana = 1000;
            data.buffList = new Vector.<BuffData>();
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
            info.readFrom(1, null);
            ReleaseSpellHelper.releaseSpell(info);
        }
        
        private function camera(angle : int) : void {
            var _angle : Number = ((90 - Math.abs(angle)) * Math.PI) / 180.0;
            var plane:Plane3D = new Plane3D(0,Math.cos(_angle), -Math.sin(_angle));
            SceneManager.getScene().sceneMapLayer.view3DAsset.cameraMode2DAngle = angle;
            Scene.scene.directionalLight.planarShadowPlane = plane;
            PlanarContainer3D.updatePlanarRotation(-angle);
        }
        
        private function show() : void {
            RotateGizmo3D.instance().show(null);
        }
        
        private function hide() : void {
            RotateGizmo3D.instance().hide();
        }

        private function status() : void {
            StatsUtil.showOrHideAwayStats(Stage3DLayerManager.stage,
                                          Stage3DLayerManager.stage3DProxy);
            LayerManager.showOrHideMM();
            ConsoleDesk.showOrHide(Stage3DLayerManager.stage);
        }

        private function addLog(...args) : void {
            CONFIG::netDebug {
                NetDebug.LOG.apply(null, args);
            }
        }

        private function showTrans(sceneID : int) : void {
            var trans : Vector.<Q_map_transfer> = TransCfgData.getTranBySceneID(sceneID);
            if (null == trans) {
                this.addLog("[ShowTrans] SceneID:", sceneID, " Trans is null");
            } else {
                for each(var tran : Q_map_transfer in trans) {
                    var points : Vector.<Point> = AreaCfgData.getAreaPointsByID(tran.q_tran_source_area_id);
                    var str : String = "[";
                    for each(var p : Point in points) {
                        str += "(" + p.x + "," + p.y + "),";
                    }
                    str += "]";
                    this.addLog("[ShowTrans] ID:", sceneID,
                        "[ID]:", tran.q_tran_id,
                        "[Name]:", tran.q_name,
                        "[SourceAreaID]:", tran.q_tran_source_area_id,
                        "[DestAreaID]:", tran.q_tran_dest_area_id,
                        "[ResDirection]:", tran.q_tran_res_direction,
                        "[ResX]:", tran.q_tran_res_x,
                        "[ResY]:", tran.q_tran_res_y,
                        "[Point]:", str,
                        "[SceneID]:", tran.q_map_id);
                }
            }
        }

        private function addTrans(sceneID : int) : void {
            var trans : Vector.<Q_map_transfer> = TransCfgData.getTranBySceneID(sceneID);
            if (null == trans) {
                this.addLog("[ShowTrans] SceneID:", sceneID, " Trans is null");
            } else {
                for each(var tran : Q_map_transfer in trans) {
                    var tranData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
                    tranData.id = tran.q_tran_id;
                    tranData.name = "传送门";
                    tranData.effectRes = tran.q_tran_res;
                    tranData.x = tran.q_tran_res_x;
                    tranData.y = tran.q_tran_res_y;
                    tranData.offsetUp = 0;
                    tranData.direction = tran.q_tran_res_direction;
                    tranData.sizeScale = 1;
                    //tranData.destScene = tran.q_tran_dest_area_id;
                    tranData.showInSmallMapType = 0;
                    tranData.polygon = new Vector.<Point>();
                    tranData.polygon.push(new Point(tran.q_tran_res_x, tran.q_tran_res_y));
                    SceneRoleManager.getInstance().createTranport(tranData);
                }
                AreaMapManager.updateTransportAreaMap();
            }
        }
        
        private function showAreaFlag(x : int, y : int) : void {
            var area : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
            var temp : AreaMapData = area.getFlag(x, y);
            var color : uint = area.getColor(x, y);
            var bitmapData : BitmapData = area.getBitmapData();
            
            this.addLog("[ShellManager] [showAreaFlag] areaMapData:" + temp + ", color:" + color);
            var tt : String = "";
            for (var i : int = 0, len : int = bitmapData.height; i < len; ++i) {
                for (var j : int = 0, wlen : int = bitmapData.width; j < wlen; ++j) {
                    tt += bitmapData.getPixel(i, j) + " ";
                }
                this.addLog("[ShellManager] [showAreaFlag] line:" + tt);
                tt = "";
            }
        }
      
        private function handler(command : String, ...params) : Boolean {
            var func : Function = this._funcs[command.toLowerCase()];
            if (null == func) {
                return false;
            }
            try {
                func.apply(this, params);
                return true;
            } catch(e) {
                GameLog.addError(e);
            }
            return false;
        }
        
        public static function parse(content : String) : Boolean {
            var params : Array = content.split(" ");
            return _instance.handler.apply(_instance, params);
        }
    }
}
