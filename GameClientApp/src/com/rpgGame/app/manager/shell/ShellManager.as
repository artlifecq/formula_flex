package com.rpgGame.app.manager.shell
{
    import com.game.engine2D.Scene;
    import com.game.engine3D.core.AreaMap;
    import com.game.engine3D.display.shapeArea.ShapeArea3D;
    import com.game.engine3D.loader.GlobalTexture;
    import com.game.engine3D.manager.Stage3DLayerManager;
    import com.game.engine3D.scene.render.RenderSet3D;
    import com.game.engine3D.scene.render.RenderUnit3D;
    import com.game.engine3D.scene.render.vo.IRenderAnimator;
    import com.game.engine3D.scene.render.vo.MethodData;
    import com.game.engine3D.scene.render.vo.RenderParamData3D;
    import com.game.engine3D.utils.EffectMethodUtil;
    import com.game.engine3D.utils.MathUtil;
    import com.game.engine3D.vo.AreaMapData;
    import com.game.engine3D.vo.BaseObj3D;
    import com.game.engine3D.vo.BaseRole;
    import com.game.mainCore.core.manager.LayerManager;
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
    import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
    import com.rpgGame.app.fight.spell.SpellAnimationHelper;
    import com.rpgGame.app.graphics.HeadFace;
    import com.rpgGame.app.manager.AreaMapManager;
    import com.rpgGame.app.manager.AvatarManager;
    import com.rpgGame.app.manager.ShortcutsManger;
    import com.rpgGame.app.manager.TrusteeshipManager;
    import com.rpgGame.app.manager.fight.FightManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleSelectManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.task.TaskAutoManager;
    import com.rpgGame.app.manager.task.TouJingManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.scene.animator.RibbonAnimator;
    import com.rpgGame.app.sender.SceneSender;
    import com.rpgGame.app.state.role.control.ShapeshiftingStateReference;
    import com.rpgGame.core.utils.ConsoleDesk;
    import com.rpgGame.coreData.cfg.AreaCfgData;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.cfg.TransCfgData;
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    import com.rpgGame.coreData.clientConfig.Q_skill_model;
    import com.rpgGame.coreData.enum.EnumAreaMapType;
    import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
    import com.rpgGame.coreData.info.buff.BuffData;
    import com.rpgGame.coreData.role.HeroData;
    import com.rpgGame.coreData.role.MonsterData;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.role.SceneTranportData;
    import com.rpgGame.coreData.role.TrapInfo;
    import com.rpgGame.coreData.type.RenderUnitID;
    import com.rpgGame.coreData.type.RenderUnitType;
    import com.rpgGame.coreData.type.RoleStateType;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.display.BitmapData;
    import flash.display.BlendMode;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import flash.utils.setTimeout;
    
    import away3d.core.math.Plane3D;
    import away3d.materials.methods.CorrodeMethod;
    
    import gs.TweenLite;
    import gs.easing.Linear;
    
    import org.game.netCore.data.long;
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
            this._funcs["addHero".toLowerCase()] = this.addHero;
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
			this._funcs["addBuff".toLocaleLowerCase()] = this.addBuff;
			this._funcs["setRenderFunc".toLocaleLowerCase()] = this.setRenderFunc;
            this._funcs["addTrap".toLowerCase()] = this.addTrap;
            this._funcs["changeTrap".toLowerCase()] = this.changeTrap;
			this._funcs["test".toLowerCase()] = this.test;
			this._funcs["removeTest".toLowerCase()] = this.removeTest;
			
			this._funcs["corred".toLowerCase()] = this.corredMethodTest;
			this._funcs["stopCorrode".toLowerCase()] = this.stopCorrode;
			this._funcs["tw".toLowerCase()] = this.twtest;

            this._funcs["playerCamerVibrate".toLowerCase()] = this.playerCamerVibrate;
			this._funcs["testRibbon".toLowerCase()] = this.testRibbon;
			this._funcs["&tasklevel".toLowerCase()] = this.testTaskLevel;
			this._funcs["&fight".toLowerCase()] = this.testStopFight;
        }
		
		private function testRibbon():void
		{
			var targetList:Vector.<SceneRole> = getNearestCanAtkRole();
			
			var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_RIBBON_SPELL, 100,true);
			effectSet.setGroundXY(MainRoleManager.actor.x,MainRoleManager.actor.z);
			
			SceneManager.addSceneObjToScene(effectSet);
			
			var ribbonAnimator : IRenderAnimator;
			if (!ribbonAnimator)
			{
				ribbonAnimator = new RibbonAnimator();
				(ribbonAnimator as RibbonAnimator).initRibbonData("shandian02",targetList,MainRoleManager.actor);
				effectSet.setRenderAnimator(ribbonAnimator);
			}
		}
		
		public static function getNearestCanAtkRole(count:uint = 5) : Vector.<SceneRole>
		{
			var result:Vector.<SceneRole> = new Vector.<SceneRole>();
			var list : Vector.<SceneRole> = SceneManager.getSceneRoleList();
			for each (var role : SceneRole in list)
			{
				if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					if (MainRoleManager.actor == role) 
					{
						// 自己
						continue;
					}
					var dis : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, role.x, role.z);
					if (dis < 250000) 
					{
						if (SceneCharType.MONSTER == role.type)
						{
							result.push(role);
							if(result.length >= count)
							{
								break;
							}
						}
					}
				}
			}
			
			return result;
		}

		
		private function twtest():void
		{
			TweenLite.to(MainRoleManager.actor,5,{x: 1000, z: -1000, ease: Linear.easeNone, overwrite: 0, onComplete: onMoveComplete});
		}
		
		private function onMoveComplete():void
		{
			trace("aaaaaa");
		}
		
		private function corredMethodTest():void
		{
			_valueObj = {alpha: 1};
			GlobalTexture.addTexture(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
		}
		
		private var _corrodeMethodData : MethodData;
		private var _corrodeTween : TweenLite;
		private var _valueObj : Object;
		private function onCorrodeTextureComplete(globalTexture : GlobalTexture) : void
		{
			GlobalTexture.removeTextureCallBack(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
			
			if (globalTexture.texture)
			{
				var corrodeMethod : CorrodeMethod = EffectMethodUtil.createCorrodeMethod(globalTexture.texture);
				_corrodeMethodData = new MethodData(corrodeMethod);
				var role : SceneRole = MainRoleManager.actor;
				role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.addMethod(_corrodeMethodData);
							break;
					}
				});
				corrodeMethod.corrodeAlpha = 1 - _valueObj.alpha;
			}
			
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.castsShadows = false;
						break;
				}
			});
			if (_corrodeMethodData)
			{
				role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.addMethod(_corrodeMethodData);
							break;
					}
				});
				CorrodeMethod(_corrodeMethodData.method).corrodeAlpha = 1 - _valueObj.alpha;
			}
			_corrodeTween = TweenLite.to(_valueObj, 2, {alpha: 0, onComplete: stopCorrode, onUpdate: function() : void
			{
				if (_corrodeMethodData)
					CorrodeMethod(_corrodeMethodData.method).corrodeAlpha = 1 - _valueObj.alpha;
			}, ease: Linear.easeNone});
		}
		
		private function stopCorrode() : void
		{
			
				var role : SceneRole = MainRoleManager.actor;
				role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.removeMethod(_corrodeMethodData);
							break;
					}
				});
				GlobalTexture.removeTextureCallBack(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
				if (_corrodeTween)
				{
					_corrodeTween.kill();
					_corrodeTween = null;
				}		
		}
		
		private function test(alpha:Number):void
		{
			if(alpha == 1)
			{
				MainRoleManager.actor.forEachRenderUnit(setFunc);
			}
			else
			{
				MainRoleManager.actor.forEachRenderUnit(setFunc1);
			}
		}
		
		private var layerType:int=0;
		//显示
		private function setFunc(role : BaseRole, render : RenderUnit3D):void
		{
			role.isHiding = false;
			render.castsShadows = true;
			switch(render.type)
			{
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.BODY:
					render.compositeAMesh.layerType = layerType;
					break;
			}
		}
		
		//隐藏
		private function setFunc1(role : BaseRole, render : RenderUnit3D):void
		{
			role.isHiding = true;
			render.castsShadows = false;
			switch(render.type)
			{
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
					render.visible = false;
					break;
				case RenderUnitType.BODY:
					layerType = render.compositeAMesh.layerType;
					render.compositeAMesh.layerType = 0;
					break;
			}
		}
		
		private function removeTest():void
		{
//			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_HIDDING);
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
        
        private var role : SceneRole;
        private var index : int = 0;
        private function addHero(id : int, x : int, y : int) : void {
            if (null == role) {
                var data : HeroData = new HeroData();
                data.id = ++this._monsterID;
                data.x = x;
                data.y = y;
                data.totalStat.hp = 1000;
                data.totalStat.life = 1000;
                data.totalStat.mp = 1000;
                data.totalStat.mana = 1000;
                data.buffList = new Vector.<BuffData>();
                //var m : SceneRole = SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
                
                role = SceneRole.create(SceneCharType.PLAYER, data.id);
                //设置VO
                role.data = data;
                role.headFace = HeadFace.create(role);
                
                role.name = data.name = "tttt";
                role.ownerIsMainChar = true;
                
                data.avatarInfo.clear();
                data.avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
                //data.avatarInfo.setBodyResID("pc/body/mojia_m_pl04_skin", "pc/body/mojia_m_pl04_animat");
                AvatarManager.updateAvatar(role);
                role.setGroundXY(data.x, data.y);
                SceneManager.addSceneObjToScene(role, true, true, true);
                role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
            } else {
                //(role.data as HeroData).avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
                if (0 == index++ % 2) {
                    (role.data as HeroData).avatarInfo.setBodyResID("pc/body/mojia_m_pl04_skin", "pc/body/mojia_m_pl04_animat");
                } else {
                    (role.data as HeroData).avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
                }
                
                AvatarManager.updateAvatar(role);
            }
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
            //var m : SceneRole = SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
            
            var role : SceneRole = SceneRole.create(SceneCharType.MONSTER, data.id);
            //设置VO
            role.data = data;
            role.headFace = HeadFace.create(role);
            
            role.name = data.name = "";
            role.ownerIsMainChar = true;
            data.avatarInfo.clear();
            data.avatarInfo.setBodyResID("monster/pt_bing_2/pt_bing_2", null);
            AvatarManager.updateAvatar(role);
            role.setGroundXY(data.x, data.y);
            SceneManager.addSceneObjToScene(role, true, true, true);
            role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
            data.avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
            AvatarManager.updateAvatar(role);
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
            info.readFrom(null);
            ReleaseSpellHelper.releaseSpell(info);
        }
        
        private function camera(angle : int) : void {
            var _angle : Number = ((90 - Math.abs(angle)) * Math.PI) / 180.0;
            var plane:Plane3D = new Plane3D(0,Math.cos(_angle), -Math.sin(_angle));
            SceneManager.getScene().sceneMapLayer.view3DAsset.cameraMode2DAngle = angle;
            Scene.scene.directionalLight.planarShadowPlane = plane;
//            PlanarContainer3D.updatePlanarRotation(-angle);
        }
        
        private function show() : void {
            RotateGizmo3D.instance().show(null);
            
            var buffRef : ShapeshiftingStateReference = MainRoleManager.actor.stateMachine.getReference(ShapeshiftingStateReference) as ShapeshiftingStateReference;
            var buffData : BuffData = new BuffData(MainRoleManager.actor.id);
            buffData.cfgId = 2002;
            buffData.disappearTime = 1000000;
            buffRef.setParams(buffData);
			buffData.buffData;
            MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_SHAPESHIFTING, buffRef);
        }
        
        private function hide() : void {
            RotateGizmo3D.instance().hide();
            MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_SHAPESHIFTING);
        }

        private function status() : void {
//            StatsUtil.showOrHideAwayStats(Stage3DLayerManager.stage,
//                                          Stage3DLayerManager.stage3DProxy);
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
		
		private function addBuff() : void {
			// bone = bone || "c_test_01";
			// SpellAnimationHelper.addBuffEffect(MainRoleManager.actor, 0, "buff1003", "tx_role_qianjibian_03", "c_0_body_01", 0);
            var role : BaseRole = MainRoleManager.actor;
            var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_FLY_SPELL/* + info.flySceneObjID*/, 1, true);
            var rud : RenderParamData3D = new RenderParamData3D(1, "effect", ClientConfig.getEffect("tx_role_qianjibian_03"), "tx_role_qianjibian_03");
            var pos : Vector3D = MainRoleManager.actor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, "b_r_wq_01");
            var effectRu : RenderUnit3D = effectSet.addRenderUnit(rud);
            effectRu.repeat = 0;
            effectRu.allowCameraAnimator = false;
            effectSet.x = pos.x; //MainRoleManager.actor.x;
            effectSet.y = pos.y; //MainRoleManager.actor.y;
            effectSet.z = pos.z; //MainRoleManager.actor.z;
            effectRu.rotationY = MainRoleManager.actor.rotationY;
            //effectRu.setScale(1);
            effectRu.play(1);
            SceneManager.addSceneObjToScene(effectSet);
            var rud : RenderParamData3D = new RenderParamData3D(2, "effect", ClientConfig.getEffect("tx_role_qianjibian_03"), "tx_role_qianjibian_03");
            var effectRu : RenderUnit3D = RenderUnit3D.create(rud, true);
            effectRu.repeat = 0;
            effectRu.mouseEnable = true;
            effectRu.x = pos.x; //MainRoleManager.actor.x;
            effectRu.z = pos.z; //MainRoleManager.actor.z;
            effectRu.y = pos.y; //MainRoleManager.actor.y;
            //effectRu.setGroundXY(role.x, role.z);
            effectRu.setScale(1);
            effectRu.rotationY = MainRoleManager.actor.rotationY;
            effectRu.play(1);
            SceneManager.addSceneObjToScene(effectRu/*, true, false, false*/);
            var pos : Vector3D = MainRoleManager.actor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, "b_r_wq_01");
            var rud : RenderParamData3D = new RenderParamData3D(3, "effect", ClientConfig.getEffect("tx_role_qianjibian_03"), "tx_role_qianjibian_03");
            var effectRu : RenderUnit3D = RenderUnit3D.create(rud, true);
            effectRu.repeat = 0;
            effectRu.mouseEnable = true;
            effectRu.x = pos.x; //MainRoleManager.actor.x;
            effectRu.z = pos.y; //MainRoleManager.actor.z;
            effectRu.y = 0;//pos.y; //MainRoleManager.actor.y;
            //effectRu.setGroundXY(role.x, role.z);
            effectRu.setScale(1);
            effectRu.rotationY = MainRoleManager.actor.rotationY;
            effectRu.play(1);
            SceneManager.addSceneObjToScene(effectRu/*, true, false, false*/);
            var rud : RenderParamData3D = new RenderParamData3D(4, "effect", ClientConfig.getEffect("tx_role_jishujian_03"), "tx_role_jishujian_03");
            var effectRu : RenderUnit3D = RenderUnit3D.create(rud, true);
            effectRu.repeat = 0;
            effectRu.mouseEnable = true;
            effectRu.x = MainRoleManager.actor.x;
            effectRu.z = MainRoleManager.actor.z;
            effectRu.y = 0;//MainRoleManager.actor.y;
            //effectRu.setGroundXY(role.x, role.z);
            effectRu.setScale(1);
            effectRu.rotationY = MainRoleManager.actor.rotationY;
            effectRu.rotationX = 35;
            effectRu.play(1);
            SceneManager.addSceneObjToScene(effectRu/*, true, false, false*/);
		}
		
		private function setRenderFunc(funcName : String, name : *, name2 : *, name3 : *) : void {
			MainRoleManager.actor.forEachRenderUnit(function (role : BaseRole, render : RenderUnit3D) : void {
				render.restoreTexture();
				if ("1" == funcName) {
					render.setIndependentTexture(ClientConfig.getDynTexture(name));
				} else if ("2" == funcName) {
					render.setIndependentMatarial(name, name2, name3);
				} else if ("3" == funcName) {
					render.addFadeAlpha(ClientConfig.getDynTexture(name));
				} else if ("4" == funcName) {
					render.setIndependentDiffuseColor(parseInt(name));
				} else if ("5" == funcName) {
					render.addBlend(ClientConfig.getDynTexture(name), ClientConfig.getDynTexture(name2));
				}
			});
		}
        
        private function addTrap(id : int) : void {
            var data : TrapInfo = new TrapInfo(new long(), id, id, 0, MainRoleManager.actor.x, MainRoleManager.actor.z);
            SceneManager.addSceneObjToScene(data.normalEffect, true, false, false);
            setTimeout(function () : void {
                changeTrap(id, 1);
            }, 456);
        }
        
        private function changeTrap(id : int, state : int) : void {
            var trap : RenderUnit3D = SceneManager.getSceneObjByID(id) as RenderUnit3D;
            if (null == trap) {
                return;
            }
            var info : TrapInfo = trap.data as TrapInfo;
            if (null == info || info.state == state) {
                return;
            }
            if (info.effect) {
                info.effect.stop();
                SceneManager.removeSceneObjFromScene(info.effect);
            }
            info.state = state;
            SceneManager.addSceneObjToScene(info.effect, true, false, false);
            setTimeout(function () : void {
                            // remove
                var unit : BaseObj3D = SceneManager.getSceneObjByID(id);
                if (null == unit) {
                    return;
                }
                if (unit is SceneRole) {
                    var sceneRole : SceneRole = unit as SceneRole;
                    if(sceneRole != null )
                    {
                        var data:MonsterData = sceneRole.data as MonsterData;
                        if( data != null )
                        {
                            TouJingManager.setHuGuoSiEffect(data.modelID, sceneRole, false);
                            var sceneClientRole:SceneRole = SceneManager.getSceneClientNpcByModelId( data.modelID);
                            if( sceneClientRole != null )
                            {
                                sceneClientRole.visible = true;
                                TouJingManager.setHuGuoSiEffect(data.modelID, sceneClientRole, true);						
                            }
                        }
                    }
                    SceneRoleManager.getInstance().removeSceneRoleById(id);
                    return;
                }
                if (unit is RenderUnit3D){
                    var trap : RenderUnit3D = unit as RenderUnit3D;
                    if (null != trap && (trap.data is TrapInfo)) {
                        GameLog.add("[onSceneRemoveObject]:" + getTimer());
                        var trapInfo : TrapInfo = trap.data as TrapInfo;
                        if (trapInfo.effect) {
                            trapInfo.effect.stop();
                        }
                        if (trapInfo.normalEffect) {
                            trapInfo.normalEffect.stop();
                        }
                        SceneManager.removeSceneObjFromScene(trapInfo.effect);
                        SceneManager.removeSceneObjFromScene(trapInfo.normalEffect);
                    }
                }
                SceneManager.removeSceneObjFromScene(unit);
            }, 376);
        }
        
        private function playerCamerVibrate() : void {
            var rud : RenderParamData3D = new RenderParamData3D(1, SceneCharType.SCENE_DEST_EFFECT, ClientConfig.getEffect("camerVibrate"));
            
            var effectRu : RenderUnit3D = RenderUnit3D.create(rud,true);
            effectRu.allowCameraAnimator = true;
            effectRu.repeat = 1;
            effectRu.x = MainRoleManager.actor.x;
            effectRu.z = MainRoleManager.actor.z;
            effectRu.rotationY = MainRoleManager.actor.rotationY;
            effectRu.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu, true);
            effectRu.play(0);
        }
		private function testTaskLevel(level:int=-1) : void {
			TaskAutoManager.getInstance().taskLevel(level);	
		} 
		private function testStopFight(level:int=-1) : void {
			TrusteeshipManager.getInstance().testStop();
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
