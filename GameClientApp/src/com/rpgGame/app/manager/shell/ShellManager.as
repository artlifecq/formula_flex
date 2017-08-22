package com.rpgGame.app.manager.shell
{
    import com.game.engine2D.Scene;
    import com.game.engine3D.config.GlobalConfig;
    import com.game.engine3D.core.AreaMap;
    import com.game.engine3D.display.EffectObject3D;
    import com.game.engine3D.display.Inter3DContainer;
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
    import com.game.engine3D.utils.PathFinderUtil;
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
    import com.rpgGame.app.manager.FunctionOpenManager;
    import com.rpgGame.app.manager.MainUIManager;
    import com.rpgGame.app.manager.ShortcutsManger;
    import com.rpgGame.app.manager.TrusteeshipManager;
    import com.rpgGame.app.manager.chat.ChatManager;
    import com.rpgGame.app.manager.role.DropGoodsManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.task.TaskAutoManager;
    import com.rpgGame.app.manager.task.TouJingManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.scene.animator.RibbonAnimator;
    import com.rpgGame.app.sender.SceneSender;
    import com.rpgGame.app.state.role.control.HiddingStateReference;
    import com.rpgGame.app.state.role.control.RidingStateReference;
    import com.rpgGame.app.state.role.control.ShapeshiftingStateReference;
    import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
    import com.rpgGame.core.utils.ConsoleDesk;
    import com.rpgGame.coreData.cfg.AreaCfgData;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.cfg.TransCfgData;
    import com.rpgGame.coreData.cfg.item.ItemConfig;
    import com.rpgGame.coreData.clientConfig.Q_map_transfer;
    import com.rpgGame.coreData.enum.BoneNameEnum;
    import com.rpgGame.coreData.enum.EnumAreaMapType;
    import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
    import com.rpgGame.coreData.info.buff.BuffData;
    import com.rpgGame.coreData.role.HeroData;
    import com.rpgGame.coreData.role.MonsterData;
    import com.rpgGame.coreData.role.RoleType;
    import com.rpgGame.coreData.role.SceneDropGoodsData;
    import com.rpgGame.coreData.role.SceneTranportData;
    import com.rpgGame.coreData.role.TrapInfo;
    import com.rpgGame.coreData.type.EffectUrl;
    import com.rpgGame.coreData.type.RenderUnitID;
    import com.rpgGame.coreData.type.RenderUnitType;
    import com.rpgGame.coreData.type.RoleStateType;
    import com.rpgGame.coreData.type.SceneCharType;
    import com.rpgGame.netData.backpack.bean.TempItemInfo;
    import com.rpgGame.netData.drop.bean.RollItemInfo;
    import com.rpgGame.netData.map.bean.DropGoodsInfo;
    
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    import flash.net.URLRequest;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import flash.utils.setTimeout;
    
    import away3d.core.math.Plane3D;
    import away3d.events.AssetEvent;
    import away3d.events.LoaderEvent;
    import away3d.library.assets.AssetType;
    import away3d.library.assets.IAsset;
    import away3d.loaders.AssetLoader;
    import away3d.loaders.parsers.AWD2Parser;
    import away3d.materials.methods.CorrodeMethod;
    import away3d.pathFinding.DistrictWithPath;
    
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
            this._funcs["&help".toLowerCase()] = this.help;
            this._funcs["&gotomap".toLowerCase()] = this.gotoMap;
            this._funcs["&addMonster".toLowerCase()] = this.addMonster;
            this._funcs["&addHero".toLowerCase()] = this.addHero;
            this._funcs["&skill".toLowerCase()] = this.skill;
            this._funcs["&camera".toLowerCase()] = this.camera;
            this._funcs["&show".toLowerCase()] = this.show;
            this._funcs["&hide".toLowerCase()] = this.hide;
            this._funcs["&status".toLowerCase()] = this.status;
            this._funcs["&addLog".toLowerCase()] = this.addLog;
            this._funcs["&showTrans".toLowerCase()] = this.showTrans;
            this._funcs["&addTrans".toLowerCase()] = this.addTrans;
            this._funcs["&showAreaFlag".toLowerCase()] = this.showAreaFlag;
			this._funcs["&addSkillToBar".toLowerCase()] = this.addSkillToBar;
			this._funcs["&shape".toLocaleLowerCase()] = this.shapeFunc;
			this._funcs["&addBuff".toLocaleLowerCase()] = this.addBuff;
			this._funcs["&setRenderFunc".toLocaleLowerCase()] = this.setRenderFunc;
            this._funcs["&addTrap".toLowerCase()] = this.addTrap;
            this._funcs["&changeTrap".toLowerCase()] = this.changeTrap;
			this._funcs["&test".toLowerCase()] = this.test;
			this._funcs["&addhide".toLowerCase()] = this.addHideTest;
			this._funcs["&removeTest".toLowerCase()] = this.removeTest;
			
			this._funcs["&corred".toLowerCase()] = this.corredMethodTest;
			this._funcs["&stopCorrode".toLowerCase()] = this.stopCorrode;
			this._funcs["&tw".toLowerCase()] = this.twtest;

            this._funcs["&playerCamerVibrate".toLowerCase()] = this.playerCamerVibrate;
			this._funcs["&testRibbon".toLowerCase()] = this.testRibbon;
            this._funcs["&addRoleMask".toLowerCase()] = this.addRoleMask;
            this._funcs["&addMount".toLowerCase()] = this.addMount;
            this._funcs["&showCd".toLowerCase()] = this.showCd;
            this._funcs["&showSameEffect".toLowerCase()] = this.showSameEffect;
            this._funcs["&addGroods".toLowerCase()] = this.addGroods;
            this._funcs["&testHeatLayer".toLowerCase()] = this.testHeatLayer;
            this._funcs["&getView".toLowerCase()] = this.getView;
			this._funcs["&tasklevel".toLowerCase()] = this.testTaskLevel;
			this._funcs["&autofight".toLowerCase()] = this.testStopFight;
			this._funcs["&Whosyourdaddy".toLowerCase()] = this.whosyourdaddy;
			this._funcs["&testRoll".toLowerCase()] = this.testRoll;
            
            // cross
            this._funcs["&enterCross".toLowerCase()] = this.enterCross;
			this._funcs["&showDistrictWireframe".toLowerCase()] = this.showDistrictWireframe;
        }
		
		private function testRoll():void
		{
			var info:RollItemInfo=new RollItemInfo();
			info.uniqueId=new long(1);
			var temp:TempItemInfo=new TempItemInfo();
			temp.isbind=0;
			temp.itemId=new long(10000);
			temp.job=0;
			temp.mod=10000;
			temp.num=10;
			temp.ltime=SystemTimeManager.curtTm/1000+10000;
			info.tempItemInfo=temp;
			
			DropGoodsManager.getInstance().addRollGoods(info);
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
				(ribbonAnimator as RibbonAnimator).initRibbonData("lv",targetList,MainRoleManager.actor);
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
			GlobalTexture.addTexture(ClientConfig.getDynTexture("corrode"),0, onCorrodeTextureComplete);
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
		
		private function eachUnVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			role.isHiding = true;
			render.castsShadows = false;
			switch(render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
				case RenderUnitType.ZHANQI:
				case RenderUnitType.EFFECT:
				case RenderUnitType.HURT:
					render.isHiding = true;
					break;
			}
		}
		
		private function eachVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			role.isHiding = false;
			render.castsShadows = true;
			switch(render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
				case RenderUnitType.ZHANQI:
				case RenderUnitType.EFFECT:
				case RenderUnitType.HURT:
					render.isHiding = false;
					break;
			}
		}
		
		private function test(alpha:Number):void
		{
			if(alpha == 9)
			{
				MainRoleManager.actor.forEachRenderUnit(eachVisible);
				return;
			}
			if(alpha == 8)
			{
				MainRoleManager.actor.forEachRenderUnit(eachUnVisible);
				return;
			}
			if(alpha == 7)
			{
				SpellAnimationHelper.addTargetEffect(MainRoleManager.actor, RenderUnitID.TASKMARK, RenderUnitType.TASKMARK, EffectUrl.UI_WENHAO, BoneNameEnum.c_0_name_01, 0, null, false);
				return;
			}
			if(alpha > 0)
			{	
				SceneManager.scene.view3d.colorFilter.adjustSaturation(-1);
			}
			if(alpha > 1)
			{
//				MainRoleManager.actor.forEachRenderUnit(setFunc);
//				SceneManager.scene.addGrayScene();
				SceneManager.scene.view3d.colorFilter.adjustContrast(alpha-1);
			}
			else if(alpha > 2)
			{
//				MainRoleManager.actor.forEachRenderUnit(setFunc1);
//				SceneManager.scene.removeGrayScene();
//				SceneManager.scene.view3d.colorFilter.adjustSaturation(alpha);
				SceneManager.scene.view3d.colorFilter.adjustBrightness(alpha-2);
			}
			else if(alpha > 3)
			{
				SceneManager.scene.view3d.colorFilter.adjustHue(alpha-3);
			}
			else if(alpha > 4)
			{
				SceneManager.scene.view3d.colorFilter.tint(0xff0000,alpha - 4);
			}
			else if(alpha < 0)
			{
//				SceneManager.scene.view3d.colorFilter.invert();
				SceneManager.scene.view3d.colorFilter.reset();
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
//					render.compositeMesh.layerType = layerType;
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
//					layerType = render.compositeMesh.layerType;
//					render.compositeMesh.layerType = 0;
					break;
			}
		}
		
		private function addHideTest():void
		{
			var ref:HiddingStateReference = MainRoleManager.actor.stateMachine.getReference(HiddingStateReference) as HiddingStateReference;
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_HIDDING,ref);
		}
		
		private function removeTest():void
		{
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_HIDDING);
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
//                data.avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
				role.updateBody("monster/pt_bing_1/pt_bing_1", null);
                //data.avatarInfo.setBodyResID("pc/body/mojia_m_pl04_skin", "pc/body/mojia_m_pl04_animat");
//                AvatarManager.updateAvatar(role);
                role.setGroundXY(data.x, data.y);
                SceneManager.addSceneObjToScene(role, true, true, true);
                role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
            } else {
                //(role.data as HeroData).avatarInfo.setBodyResID("monster/pt_bing_1/pt_bing_1", null);
                if (0 == index++ % 2) {
					role.updateBody("pc/body/mojia_m_pl04_skin", "pc/body/mojia_m_pl04_animat");
                } else {
					role.updateBody("monster/pt_bing_1/pt_bing_1", null);
                }
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
			role.updateBody("monster/pt_bing_2/pt_bing_2", null);
            role.setGroundXY(data.x, data.y);
            SceneManager.addSceneObjToScene(role, true, true, true);
            role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
			role.updateBody("monster/pt_bing_1/pt_bing_1", null);
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
					render.setIndependentTexture(ClientConfig.getDynTexture(name),0);
				} else if ("2" == funcName) {
					render.setIndependentMatarial(name, name2, name3);
				} else if ("3" == funcName) {
					render.addFadeAlpha(ClientConfig.getDynTexture(name),0);
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
        
        private function addMount(on : int) : void {
            var heroData : HeroData = MainRoleManager.actor.data as HeroData;
            //heroData.avatarInfo.setBodyResID("pc/body/binjia_skin", "pc/body/binjia_animat");
            
            if (on) {
                var ref1 : RidingStateReference = MainRoleManager.actor.stateMachine.getReference(RidingStateReference) as RidingStateReference;
                //ref1.setParams(null, null);
                ref1.setParams("pc/mount/mount_zhanma_01", "pc/mount/mount_zhanma_animat");
                MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref1);
                //heroData.avatarInfo.setMountResID("pc/mount/mount_zhanma_01", "pc/mount/mount_zhanma_animat");
            } else {
                heroData.avatarInfo.setMountResID(null, null);
                MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_RIDING);
            }
            AvatarManager.updateMount(MainRoleManager.actor);
        }
        
        private function showCd() : void {
            var cd1 : Inter3DContainer = new Inter3DContainer();
            cd1.x = 100;
            cd1.y = 500;
            var cd2 : Inter3DContainer = new Inter3DContainer();
            cd2.x = 200;
            cd2.y = 500;
            var cd3 : Inter3DContainer = new Inter3DContainer();
            cd3.x = 400;
            cd3.y = 500;
            
            var ef1 : EffectObject3D = cd1.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
            var ef2 : EffectObject3D = cd2.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
            var ef3 : EffectObject3D = cd3.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
            
            MainUIManager.mainui.addChild(cd1);
            MainUIManager.mainui.addChild(cd2);
            MainUIManager.mainui.addChild(cd3);
            
            var rud1 : RenderParamData3D = new RenderParamData3D(1, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            var rud2 : RenderParamData3D = new RenderParamData3D(2, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            var rud3 : RenderParamData3D = new RenderParamData3D(3, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            
            var effectRu1 : RenderUnit3D = RenderUnit3D.create(rud1,true);
            effectRu1.allowCameraAnimator = true;
            effectRu1.repeat = 1;
            effectRu1.x = MainRoleManager.actor.x;
            effectRu1.z = MainRoleManager.actor.z;
            //effectRu1.rotationY = MainRoleManager.actor.rotationY;
            effectRu1.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu1, true);
            
            
            var effectRu2 : RenderUnit3D = RenderUnit3D.create(rud2,true);
            effectRu2.allowCameraAnimator = true;
            effectRu2.repeat = 1;
            effectRu2.x = MainRoleManager.actor.x + 300;
            effectRu2.z = MainRoleManager.actor.z;
            //effectRu2.rotationY = MainRoleManager.actor.rotationY;
            effectRu2.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu2, true);
            
            var effectRu3 : RenderUnit3D = RenderUnit3D.create(rud3,true);
            effectRu3.allowCameraAnimator = true;
            effectRu3.repeat = 1;
            effectRu3.x = MainRoleManager.actor.x + 500;
            effectRu3.z = MainRoleManager.actor.z;
            //effectRu2.rotationY = MainRoleManager.actor.rotationY;
            effectRu3.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu3, true);
            
            setTimeout(function() : void {
                ef1.playEffect(0, 0.01);
                ef2.playEffect(0, 0.02);
                //ef3.playEffect(0, 0.03);
                
                effectRu1.play(0, 0.04);
                effectRu2.play(0, 0.05);
                //effectRu3.play(0, 0.06);
            }, 2000);
        }
        
        private function showSameEffect() : void {
            var rud1 : RenderParamData3D = new RenderParamData3D(1, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            var rud2 : RenderParamData3D = new RenderParamData3D(2, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            var rud3 : RenderParamData3D = new RenderParamData3D(3, "1", ClientConfig.getEffect("ui_jinengkuang_mj"));
            
            var effectRu1 : RenderUnit3D = RenderUnit3D.create(rud1,true);
            effectRu1.allowCameraAnimator = true;
            effectRu1.repeat = 1;
            effectRu1.x = MainRoleManager.actor.x;
            effectRu1.z = MainRoleManager.actor.z;
            //effectRu1.rotationY = MainRoleManager.actor.rotationY;
            effectRu1.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu1, true);
            
            
            var effectRu2 : RenderUnit3D = RenderUnit3D.create(rud2,true);
            effectRu2.allowCameraAnimator = true;
            effectRu2.repeat = 1;
            effectRu2.x = MainRoleManager.actor.x + 300;
            effectRu2.z = MainRoleManager.actor.z;
            //effectRu2.rotationY = MainRoleManager.actor.rotationY;
            effectRu2.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu2, true);
            
            var effectRu3 : RenderUnit3D = RenderUnit3D.create(rud3,true);
            effectRu3.allowCameraAnimator = true;
            effectRu3.repeat = 1;
            effectRu3.x = MainRoleManager.actor.x + 500;
            effectRu3.z = MainRoleManager.actor.z;
            //effectRu2.rotationY = MainRoleManager.actor.rotationY;
            effectRu3.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu3, true);
            
            
            setTimeout(function() : void {
                effectRu1.play(0, 0.04);
                //effectRu2.play(0, 0.05);
                //effectRu3.play(0, 0.06);
            }, 2000);
        }
        
        private function addRoleMask() : void {
            RoleFaceMaskEffectUtil.removeFaceMaskEffect(MainRoleManager.actor);
            RoleFaceMaskEffectUtil.addDialogFaceMaskEffect(MainRoleManager.actor);
        }
        
        private function addGroods(goodsId : String) : void {
            var data:SceneDropGoodsData=new SceneDropGoodsData();
			var info:DropGoodsInfo=new DropGoodsInfo();
			info.ownerId=new long();
			info.itemModelId=5088;
			info.dropGoodsId=new long();
			info.x=MainRoleManager.actor.x;
			info.y=MainRoleManager.actor.z;
			data.updateWithGoodsData(info);
            data.avatarRes=goodsId;
            //data.avatarRes=AvatarUrl.BAO_XIANG;
            data.x=MainRoleManager.actor.x;
            data.y=MainRoleManager.actor.z;
            data.isDroped=true;
            SceneRoleManager.getInstance().createDropGoods(data);
        }
        
        private function testHeatLayer() : void {
            var rud1 : RenderParamData3D = new RenderParamData3D(1, "1", "../res/map/common/tx_YJ_shuimian_01.awd");
            var effectRu1 : RenderUnit3D = RenderUnit3D.create(rud1,true);
            effectRu1.allowCameraAnimator = true;
            effectRu1.repeat = 0;
            effectRu1.x = MainRoleManager.actor.x;
            effectRu1.z = MainRoleManager.actor.z;
            //effectRu1.rotationY = MainRoleManager.actor.rotationY;
            effectRu1.completeWhenInvisible = true;
            SceneManager.addSceneObjToScene(effectRu1);
            effectRu1.play(0);
        }
        
        private function getView() : void {
            while (true) {
                Scene.scene.view3d;
            }
        }
      
		private function testTaskLevel(level:int=-1) : void {
			TaskAutoManager.getInstance().taskLevel(level);	
		} 
		
		private function whosyourdaddy() : void {
			TaskAutoManager.getInstance().taskLevel(-1);	
			FunctionOpenManager.needShowOpenMode = false;
			ChatManager.sendGMMsg("&level 100");
			ChatManager.sendGMMsg("&gold 9999999");
			ChatManager.sendGMMsg("&money 9999999");
		}
		private function testStopFight(level:int=-1) : void {
			TrusteeshipManager.getInstance().testStop();
		}
		
		private function enterCross() : void {
//            var  message : ReqEnterCrossClientToGameMessage = new ReqEnterCrossClientToGameMessage();
//            SocketConnection.send(message);
            var _district : DistrictWithPath;
            var _loader : AssetLoader = new AssetLoader();
            _loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, function() : void {
            });
            _loader.addEventListener(AssetEvent.ASSET_COMPLETE, function onAssetComplete(e : AssetEvent) : void {
                if (e.type == AssetEvent.ASSET_COMPLETE)
                {
                    var obj : IAsset = e.asset as IAsset;
                    switch (e.asset.assetType)
                    {
                        case AssetType.DISTRICT:
                            _district = obj as DistrictWithPath;
                            _district.showWireframe = true;
                            _district.radiusForEntity = GlobalConfig.radiusForEntity;
                            _district.generateNavMesh(function():void{
                                var _districtWithPath : DistrictWithPath = SceneManager.getDistrict(MainRoleManager.actor.sceneName);
                                var targetPos : Vector3D = new Vector3D(2559, -5029, 0);
                                var temp : Boolean = PathFinderUtil.isPointInSide(_district, targetPos);
                                GameLog.add(temp);
                            });
                            break;
                        default:
                            break;
                    }
                }
            });
            _loader.load(new URLRequest("../res/map/xqj_scene01_bj_cfys/xqj_scene01_bj_cfys.awd"), null, null, new AWD2Parser(), 100);
        }
		private function showDistrictWireframe() : void {
			SceneManager.getScene().sceneMapLayer.showDistrictWireframe = true;
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
