package com.rpgGame.app.manager.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.ClientMapAreaGridData;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.graphics.BubbleDialogFace;
	import com.rpgGame.app.graphics.DropItemHeadFace;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.graphics.StallHeadFace;
	import com.rpgGame.app.graphics.TranportHeadFace;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.FightSoulFollowAnimator;
	import com.rpgGame.app.scene.animator.GirlPetFollowAnimator;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.app.state.role.control.RidingStateReference;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.core.events.role.RoleEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.FightsoulModeData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneJumpPointData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.role.SculptureData;
	import com.rpgGame.coreData.role.ZhanCheData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.EnumMonsterId;
	import com.rpgGame.coreData.type.EnumMonsterType;
	import com.rpgGame.coreData.type.HeadBloodStateType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 场景角色管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:02:16
	 *
	 */
	public class SceneRoleManager
	{
		private static var _instance : SceneRoleManager;
		
		public static function getInstance() : SceneRoleManager
		{
			if (!_instance)
			{
				_instance = new SceneRoleManager();
			}
			return _instance;
		}
		
		/**
		 * 玩家半径
		 */
		private static var radiusForHero : int = 25;
		
		public function SceneRoleManager()
		{
			EventManager.addEvent(MainPlayerEvent.PK_MODE_CHANGE, onPkModeChange);
			EventManager.addEvent(RoleEvent.UPDATE_NEEDLE, onUpdateNeedle);
			EventManager.addEvent(YunBiaoEvent.UPDATE_BIAOCHE_NAME, updateBiaoName);
		}
		
		private function onPkModeChange() : void
		{
			SceneRoleSelectManager.updateRoleRingEffect(SceneRoleSelectManager.selectedRole);
		}
		
		/**
		 * 创建英雄
		 * @param data
		 * @param isMainChar
		 * @return
		 *
		 */
		public function createHero(data : HeroData, isMainChar : Boolean = false) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.PLAYER);
			var role : SceneRole = SceneRole.create(SceneCharType.PLAYER, data.id);
			role.isMainChar = isMainChar;
			role.enableMask = true;
			//设置VO
			role.data = data;
			role.name = data.name;
			data.bodyRadius = radiusForHero;
			role.headFace = HeadFace.create(role);
			(role.headFace as HeadFace).bloodPercent= (data.totalStat.hp / data.totalStat.life);
			(role.headFace as HeadFace).showBloodStr(data.totalStat.hp +"/"+ data.totalStat.life);
			role.dialogFace=BubbleDialogFace.create(role);
			//执行主换装更新
			AvatarManager.resetAvatar(role, false, false, false);
			var renderLimitable : Boolean = false;
			if (!isMainChar)
			{
				renderLimitable = true;
				role.addAttachLimitable(AttachDisplayType.ROLE_HEAD_NAME);
				if (data.totalStat.hp <= 0)
				{
					role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
				}
				else
				{
					role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
				}
			}
			
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			if(sceneData.mapType==EnumMapType.MAP_TYPE_WCZB&&data.guildIsLeader==1){
				role.setScale(data.sizeScale*1.5);//帮会战统帅放大到1.5倍
			}else{
				role.setScale(data.sizeScale);
			}
			
			
			role.setGroundXY(data.x, data.y);
			role.rotationY = (270 + data.direction) % 360;
			SceneManager.addSceneObjToScene(role, true, true, renderLimitable);
			// 在换装时还未把role添加到场景 添加的buff无效
			if (data.buffList.length > 0) {
				role.buffSet.updateBuffEffects();
			}
			if (data.fightSoulLevel > 0)
			{
				createFightSoulRole(role);
			}
			
			if (role.headFace is HeadFace)
			{
				(role.headFace as HeadFace).updateTitle(data.junjieLv);
				(role.headFace as HeadFace).updateHuBaoTitle(data.baowuLv);
				(role.headFace as HeadFace).updateFuQiTitle(data.coupleName);
				(role.headFace as HeadFace).addAndUpdataRankTitle(data.topLeaderTypes)
			}
			
			CharAttributeManager.setCharHp(data, data.totalStat.hp);
			CharAttributeManager.setCharMaxLife(data, data.totalStat.life); //需要提供初始化方法,优化一下!
			if (!isMainChar)
				EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
			return role;
		}
		
		
		public function removeBornEffectAndShow(role:SceneRole,mountResID:String,obj:BaseObj3D):void
		{
			var objId : Number = obj.id;
			SceneManager.removeSceneObjFromScene(obj);
			
			if (mountResID)
			{
				var ref1 : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref1.setParams(mountResID, null);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref1);
			}
			else
			{
				//执行主换装更新
				//				AvatarManager.updateAvatar(role);
			}
		}
		/**
		 * 创建NPC
		 * @param data
		 * @param charType
		 *
		 */
		public function createNPC(data : MonsterData, charType : String) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, charType);
			var role : SceneRole = SceneRole.create(charType, data.id);
			var bornData : Q_monster = MonsterDataManager.getData(data.modelID);
			//设置VO
			role.data = data;
			role.enableMask = true;
			var roleNameStr : String = (bornData ? bornData.q_name.toString() : "未知怪物");
			if (data.ownerName)
			{
				roleNameStr = roleNameStr + "(" + data.ownerName + ")";
			}
			role.name = data.name = roleNameStr;
			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
			role.headFace = HeadFace.create(role);
			(role.headFace as HeadFace).bloodPercent= (data.totalStat.hp / data.totalStat.life);
			(role.headFace as HeadFace).showBloodStr(data.totalStat.hp +"/"+ data.totalStat.life);
			role.updateBody(bornData ? bornData.q_body_res : "", null);
			//			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(bornData ? bornData.q_body_res : "");
			//
			(role.headFace as HeadFace).probabilityMonserSpeakBar();//概率闲话
			if (bornData.q_animation>0)
			{
				role.updateBodyEft(AnimationDataManager.getData(bornData.q_animation).role_res);
				//				data.avatarInfo.effectResID = AnimationDataManager.getData(bornData.q_animation).role_res;
			}
			data.sizeScale = (bornData && bornData.q_scale > 0) ? (bornData.q_scale * 0.01) : 1;
			//			data.totalStat.level = bornData ? bornData.q_grade : 0;
			data.bodyRadius = bornData ? bornData.q_body_radius_pixel : 0;
			//data.direction = bornData ? bornData.q_direction : 0;
			data.immuneDeadBeat = bornData ? (bornData.q_immune_dead_beat==0): false;
			
			if(bornData.q_born_animation)//有出生特效
			{
				trace(data.x+"   "+data.y);
				SpellAnimationHelper.addBornEffect(role,data.x, data.y,bornData.q_born_animation);
			}
			var mountResID : String = bornData ? bornData.q_mount_res : "";
			if (mountResID)
			{
				var ref1 : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref1.setParams(mountResID, null);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref1);
			}
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = (270 + data.direction) % 360;
			SceneManager.addSceneObjToScene(role, true, false, true);
			MainRoleSearchPathManager.trySetSearchRoleData(data);
			TaskUtil.tryAddTaskMark(role);
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
			return role;
		}
		/**
		 * 创建怪物
		 * @param data
		 * @param charType
		 *
		 */
		public function createMonster(data : MonsterData, charType : String) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, charType);
			var role : SceneRole = SceneRole.create(charType, data.id);
			var bornData : Q_monster = MonsterDataManager.getData(data.modelID);
			//设置VO
			role.data = data;
			var roleNameStr : String = (bornData ? bornData.q_name.toString() : "未知怪物");
			role.name = data.name = roleNameStr;
			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
			role.headFace = HeadFace.create(role);
			(role.headFace as HeadFace).bloodPercent= (data.totalStat.hp / data.totalStat.life);
			(role.headFace as HeadFace).showBloodStr(data.totalStat.hp +"/"+ data.totalStat.life);
			role.updateBody(bornData ? bornData.q_body_res : "", null);
			//			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(bornData ? bornData.q_body_res : "");
			//
			(role.headFace as HeadFace).probabilityMonserSpeakBar();//概率闲话
			if (bornData.q_animation>0)
			{
				role.updateBodyEft(AnimationDataManager.getData(bornData.q_animation).role_res);
				//				data.avatarInfo.effectResID = AnimationDataManager.getData(bornData.q_animation).role_res;
			}
			data.sizeScale = (bornData && bornData.q_scale > 0) ? (bornData.q_scale * 0.01) : 1;
			//			data.totalStat.level = bornData ? bornData.q_grade : 0;
			data.bodyRadius = bornData ? bornData.q_body_radius_pixel : 0;
			//data.direction = bornData ? bornData.q_direction : 0;
			data.immuneDeadBeat = bornData ? (bornData.q_immune_dead_beat==0): false;
			
			if(bornData.q_born_animation)//有出生特效
			{
				trace(data.x+"   "+data.y);
				SpellAnimationHelper.addBornEffect(role,data.x, data.y,bornData.q_born_animation);
			}
			var mountResID : String = bornData ? bornData.q_mount_res : "";
			if (mountResID)
			{
				var ref1 : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref1.setParams(mountResID, null);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref1);
			}
			
			if (data.totalStat.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			else
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = (270 + data.direction) % 360;;
			SceneManager.addSceneObjToScene(role, true, false, true);
			MainRoleSearchPathManager.trySetSearchRoleData(data);
			//弓弩不要鼠标事件
			if ((data.modelID==EnumMonsterId.BOW1||data.modelID==EnumMonsterId.BOW2)) 
			{
				role.mouseEnable=false;
			}
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
			return role;
		}
		
		public function createStall(data : StallData) : void
		{
			removeSceneRoleByIdAndType(data.stallId, SceneCharType.STALL);
			var clientMapdatas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getStallAreas();
			if (!clientMapdatas || clientMapdatas.length == 0)
				return;
			var clientMapArea : ClientMapAreaData;
			var clientMapAreaGrid : ClientMapAreaGridData;
			var stallAreaGrid : ClientMapAreaGridData;
			for each (clientMapArea in clientMapdatas)
			{
				if (!clientMapArea)
					continue;
				for each (clientMapAreaGrid in clientMapArea.grids)
				{
					if (clientMapAreaGrid.id == data.stallId)
					{
						stallAreaGrid = clientMapAreaGrid;
						break;
						;
					}
				}
			}
			if (!stallAreaGrid)
			{
				trace("没有找到这个格子，用来放摊位的。")
				return;
			}
			var role : SceneRole = SceneRole.create(SceneCharType.STALL, data.stallId);
			//设置VO
			data.id == data.stallId;
			role.data = data;
			role.headFace = StallHeadFace.create(role);
			role.name = data.stallName;
			role.ownerIsMainChar = (data.playerId == MainRoleManager.actorID);
//			var stallType : StallTypeDataProto = StallCfgData.getStallTypeData(data.stallType);
//			data.avatarInfo.setBodyResID(stallType ? stallType.stallRes : "", null);
//			data.sizeScale = 1;
//			data.totalStat.level = 0;
//			data.bodyRadius = 0;
//			data.direction = 0;
//			//执行主换装更新
//			//AvatarManager.updateAvatar(role);
//			var owner : SceneRole = SceneManager.getSceneObjByID(data.playerId) as SceneRole;
//			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
//			role.setScale(data.sizeScale);
//			if (stallAreaGrid && owner)
//			{
//				role.setGroundXY(stallAreaGrid.gridX, stallAreaGrid.gridY);
//				owner.setCamouflageEntity(role);
//			}
//			else
//				GameAlert.debugShow("没有找到这个人，没办法摆摊");
//			role.rotationY = data.direction;
//			SceneManager.addSceneObjToScene(role, true, true, true);
		}
		
		
		public function createZhanChe(data : ZhanCheData) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.ZHAN_CHE);
			var role : SceneRole = SceneRole.create(SceneCharType.ZHAN_CHE, data.id);
//			var monsterCfgID : int = CountryWarCfgData.getMonsterCfgIDOfZhanChe(data.modelID);
//			var bornData : Q_monster = MonsterDataManager.getData(monsterCfgID);
//			//设置VO
//			role.data = data;
//			role.headFace = HeadFace.create(role);
//			var monsterNameStr : String = (bornData ? bornData.q_name.toString() : "未知怪物");
//			var roleNameStr : String = monsterNameStr + "(" + data.ownerName + ")";
//			role.name = data.name = roleNameStr;
//			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
//			//			data.avatarInfo.setBodyResID(bornData ? bornData.q_body_res : "", null);
//			role.updateBody(bornData ? bornData.q_body_res : "", null);
//			data.sizeScale = (bornData && bornData.q_scale > 0) ? (bornData.q_scale * 0.01) : 1;
//			//			data.totalStat.level = bornData ? bornData.q_grade : 0;
//			data.bodyRadius = bornData ? bornData.q_body_radius_pixel : 0;
			//data.direction = bornData ? bornData.q_direction : 0;
			//			AvatarManager.updateAvatar(role);
			
			if (data.totalStat.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			else
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true, true, true);
			//			if (CountryManager.isMyEnemyCountry(data.ownerCountry))
			//			{
			//				if (role.headFace)
			//					(role.headFace as HeadFace).bloodState = HeadBloodStateType.MONSTER;
			//			}
			//			else
			//			{
			if (role.headFace)
				(role.headFace as HeadFace).bloodState = HeadBloodStateType.MAIN_CHAR;
			//			}
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
			return role;
		}
		
		/*public function createNpc(data : SceneNpcData) : void
		{
		var role : SceneRole = SceneRole.create(SceneCharType.NPC, data.id);
		//设置VO
		role.data = data;
		role.name = data.name;
		data.avatarInfo.bodyResID = data.avatarRes;
		data.sizeScale = data.scale > 0 ? (data.scale * 0.01) : 1;
		
		//执行主换装更新
		AvatarManager.updateAvatar(role);
		role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
		
		role.setScale(data.sizeScale);
		role.setGroundXY(data.x, data.y);
		role.rotationY = data.direction;
		SceneManager.addSceneObjToScene(role, true, false, false);
		}*/
		
		/**
		 * 创建一台镖车
		 * @param data
		 *
		 */
		public function createBiaoChe(data : BiaoCheData) : void
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.BIAO_CHE);
			var role : SceneRole = SceneRole.create(SceneCharType.BIAO_CHE, data.id);
			//设置VO
			data.countryId = MainRoleManager.actorInfo.countryId;
			//data.avatarInfo.setBodyResID(data.getModeRes(), null); //MainRoleManager.actorInfo.avatarInfo.bodyResID
//			role.updateBody(data.getModeRes(), null);
			data.fixDirection = true;
			role.data = data;
			role.headFace = HeadFace.create(role);
			role.name = YunBiaoManager.setBiaoName(role);
			
			//执行主换装更新
			//			AvatarManager.updateAvatar(role);
			
			if (data.totalStat.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			else
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			SceneManager.addSceneObjToScene(role, true, true, true);
			
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
		}
		
		/**
		 * 镖车外观更新
		 * @param role 镖车
		 * @param resPath 外观资源路径
		 *
		 */
		public function updateBiaoche(role : SceneRole, resPath : String) : void
		{
			var biaoCheData : BiaoCheData = role.data as BiaoCheData;
			if (biaoCheData != null){
				role.updateBody(resPath, null);
			}
			//				biaoCheData.avatarInfo.setBodyResID(resPath, null);
			
			//执行主换装更新
			//			AvatarManager.updateAvatar(role);
		}
		
		/**
		 * 更新镖车名字颜色
		 * @param data
		 *
		 */
		private function updateBiaoName(data : BiaoCheData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(data.id) as SceneRole;
			if (role != null)
				role.name = YunBiaoManager.setBiaoName(role);
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateName();
		}
		
		/**创建一个美人*/
		public function createGirlPet(data:GirlPetData):void
		{
			removeSceneRoleByIdAndType(data.id, SceneCharType.GIRL_PET);
			var role : SceneRole = SceneRole.create(SceneCharType.GIRL_PET, data.id);
			//设置VO
			role.data = data;
			role.enableMask = true;
			role.name = data.name;
			role.headFace = HeadFace.create(role);
			role.headFace.show();
			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
			if(role.headFace is HeadFace)
			{
				(role.headFace as HeadFace).addAndUpdateGuiShu();
			}
			//			var q_gril_pet:Q_girl_pet=PetCfg.getPet(data.modId);
			//			role.updateBody(q_gril_pet ? q_gril_pet.q_panel_show_id : "", null);
			//执行主换装更新
			AvatarManager.updateBody(role);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			
			role.setScale(data.sizeScale);
			var p:Point=getPetPoint(data.x,data.y,data.direction);
			role.setGroundXY(p.x, p.y);
			role.rotationY = (270 + data.direction) % 360;
			SceneManager.addSceneObjToScene(role, true, false, false);
			//主角的才执行
			if (role.ownerIsMainChar) 
			{
				var girlPet:GirlPetFollowAnimator=new GirlPetFollowAnimator();
				girlPet.setOwner(role);
				role.setRenderAnimator(girlPet);
			}
			if(data.petData.q_born_animation)//有出生特效
			{
				trace(data.x+"   "+data.y);
				SpellAnimationHelper.addBornEffect(role,data.x, data.y,data.petData.q_born_animation);
			}
//			trace("美人创建成功_美人位子："+p.x+"_"+p.y);
			//			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
		}
		
		private static var arrX : Array = [0, -1, -1, -1, 0, 1, 1, 1];
		private static var arrY : Array = [1, 1, 0, -1, -1, -1, 0, 1];
		public function getPetPoint(pointX:Number,pointY:Number,rotationY:int=0):Point
		{
			var dirX:int= (int)((rotationY+180)/45);
			if(dirX<0) dirX=0;
			else if(dirX>7) dirX=7;
			var po:Point=new Point(pointX+arrX[dirX]*100,pointY+arrY[dirX]*100);
			return po;
		}
		/**
		 * 创建掉落物
		 * @param data
		 *
		 */
		public function createDropGoods(data : SceneDropGoodsData) : void
		{
			if (SceneManager.isSceneOtherRenderLimit){
				return;
			}
			
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.DROP_GOODS);
			var role : SceneRole = SceneRole.create(SceneCharType.DROP_GOODS, data.id);
			//设置VO
			role.data = data;
			role.name = data.name;
			role.headFace = DropItemHeadFace.create(role);
			role.updateBody(data.avatarRes, null);
			//			data.avatarInfo.setBodyResID(data.avatarRes, null);
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(data.avatarRes);
			if (avatarResConfig)
			{
				data.avatarInfo.effectResID = avatarResConfig.idleEffect;
			}
			
			//执行主换装更新
			//			AvatarManager.updateAvatar(role);
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.STAND, 0, data.isDroped ? int.MAX_VALUE : 0);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref, true); //切换到“播放状态”
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true,true, true);
			var qua:int=ItemConfig.getItemQuality(data.goodsDatas.itemModelId);
			if (qua>0) 
			{
				role.updateBodyEft(ClientConfig.getDropItemQuatityEffect(qua));
			}
			
			DropGoodsManager.getInstance().addDropGoods(role);
		}
		
		/**
		 * 创建采集物
		 * @param data
		 *
		 */
		public function createCollect(data : SceneCollectData) : void
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.COLLECT);
			var role : SceneRole = SceneRole.create(SceneCharType.COLLECT, data.id);
			//设置VO
			role.data = data;
			role.name = data.name;
			role.headFace = HeadFace.create(role);
			//role.headFace.show();
			//role.headFace.showHead();
			role.updateBody(data.avatarRes, null);
			//			data.avatarInfo.setBodyResID(data.avatarRes, null);
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(data.avatarRes);
			if (avatarResConfig)
			{
				data.avatarInfo.effectResID = avatarResConfig.idleEffect;
			}
			
			//执行主换装更新
			//			AvatarManager.updateAvatar(role);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = (270 + data.direction) % 360;
			SceneManager.addSceneObjToScene(role, true, true, false);
			ClientTriggerManager.addTriggerCollectEffect(role);
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_ADD, role);
		}
		
		/**
		 * 创建传送门
		 * @param data
		 * @return
		 *
		 */
		public function createTranport(data : SceneTranportData) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.TRANS);
			var role : SceneRole = SceneRole.create(SceneCharType.TRANS, data.id);
			//设置VO
			role.data = data;
			role.name = data.name;
			role.headFace = TranportHeadFace.create(role);
			//			data.avatarInfo.effectResID = data.effectRes;
			role.updateEffect(data.effectRes);
			
			//执行主换装更新
			//			AvatarManager.updateAvatar(role);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			role.offsetY = data.offsetUp;
			SceneManager.addSceneObjToScene(role, true, false, false);
			ClientTriggerManager.addTriggerCollectEffect(role);
			return role;
		}
		/**
		 * 创建跳跃点
		 * @param data
		 * @return
		 *
		 */
		public function createJumppoint(data : SceneJumpPointData) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.SCENE_JUMP);
			var role : SceneRole = SceneRole.create(SceneCharType.SCENE_JUMP, data.id);
			//设置VO
			role.data = data;
			role.name = data.name;
			role.headFace = HeadFace.create(role);
			//data.avatarInfo.effectResID = data.effectRes;
			//执行主换装更新
			role.updateEffect(data.effectRes);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			role.offsetY = data.offsetUp;
			SceneManager.addSceneObjToScene(role, true, false, false);
			//ClientTriggerManager.addTriggerCollectEffect(role);
			return role;
		}
		/**
		 * 创建场景特效
		 * @param data
		 * @return
		 *
		 */
		public function createSceneEffect(data : ClientSceneEffect, id : int, type : String, x : int, y : int) : RenderUnit3D
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(id, type);
			var rud : RenderParamData3D = new RenderParamData3D(id, type, ClientConfig.getEffect(data.effectRes));
			var effectRu : RenderUnit3D = RenderUnit3D.create(rud,true);
			effectRu.repeat = 0;
			effectRu.mouseEnable = false;
			effectRu.play(0);
			effectRu.visible = true;
			effectRu.setScale(data.sizeScale > 0 ? (data.sizeScale * 0.01) : 1);
			effectRu.rotationY = data.direction;
			effectRu.setGroundXY(x, y);
			effectRu.data = data;
			SceneManager.addSceneObjToScene(effectRu, true, false, false);
			return effectRu;
		}
		/**
		 * 移除场景特效
		 */
		public function removeSceneEffect(id : int, type : String) : void
		{
			var role : RenderUnit3D = SceneManager.getScene().getSceneObjByID(id, type) as RenderUnit3D;
			if (role && role.usable)
			{
				SceneManager.removeSceneObjFromScene(role);
			}
		}
		
		public function createFightSoulRole(owner:SceneRole):SceneRole
		{
			var fightSoulFollowAnimator:FightSoulFollowAnimator = null;
			var fightSoulRole:SceneRole = (SceneManager.getScene().getSceneObjByID(owner.id, SceneCharType.FIGHT_SOUL) as SceneRole);
			if (fightSoulRole)
			{
				return fightSoulRole;
			}
			fightSoulRole = SceneRole.create(SceneCharType.FIGHT_SOUL, owner.id);
			var roleData:RoleData = new RoleData(RoleType.TYPE_FIGHT_SOUL);
			roleData.ownerId = owner.id;
			roleData.id = owner.id;
			roleData.name = "";
			var fightSoulLevel:int = (owner.data as HeroData).fightSoulLevel;
			var model:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(fightSoulLevel);
			
			fightSoulRole.updateBody("pc/fightsoul/"+model.q_mode,null);
			fightSoulRole.updateBodyEft(model.q_effect,model.q_effect);
			
			fightSoulRole.ownerIsMainChar = (owner.id == MainRoleManager.actorID);
			fightSoulRole.data = roleData;
			fightSoulRole.mouseEnable = false;
			if (owner.isMainChar)
			{
				fightSoulRole.canRemoved = false;
			}
			fightSoulRole.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
			fightSoulRole.setScale(model.q_sceneScale/100);
			fightSoulRole.setGroundXY((owner.x + 100), owner.y);
			fightSoulRole.rotationY = 0;
			SceneManager.addSceneObjToScene(fightSoulRole, false);
			fightSoulFollowAnimator = new FightSoulFollowAnimator(fightSoulRole);
			fightSoulFollowAnimator.radius = model.q_radius;
			owner.setRenderAnimator(fightSoulFollowAnimator);
			return fightSoulRole;
		}
		
		/**创建雕塑*/
		public function createSculpture(data :SculptureData):void
		{
			removeSceneRoleByIdAndType(data.id, SceneCharType.SCULPTURE);
			var role : SceneRole = SceneRole.create(SceneCharType.SCULPTURE, data.id);
			//设置VO
			role.data = data;
			var name:String = data.name;
			if(name==null||name == "")
				name = "虚位以待";
			role.name = data.name= name;
			role.headFace = HeadFace.create(role);
			HeadFace(role.headFace).addAndUpdataRankTitle(data.topLeaderTypes);
			role.headFace.show();
			//			role.headFace.showHead();
			
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(data.avatarRes);
			if (avatarResConfig)
			{
				role.updateBody(data.avatarRes, avatarResConfig.idleEffect);
			}else{
				role.updateBody(data.avatarRes, null);
			}
			//执行主换装更新
			
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			
			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true, false, false);
		}
		
		/**创建战旗特效*/
		public function updateZhanQiRole(owner:SceneRole):SceneRole
		{
			if(owner.avatar.hasTypeRenderUnits(RenderUnitType.ZHANQI))
				owner.avatar.removeRenderUnitByID(RenderUnitType.ZHANQI,RenderUnitID.ZHANQI);
			var zhanqilv:int=(owner.data as HeroData).zhanqiLv;			
			var q_warflag:Q_warflag=ZhanQiConfigData.getZhanQiDataById(zhanqilv);
			var rud : RenderParamData3D = new RenderParamData3D(0, RenderUnitType.ZHANQI, ClientConfig.getEffect(q_warflag.q_panel_show_id));
			var effectRu : RenderUnit3D=owner.avatar.addRenderUnitToChild(RenderUnitType.BODY,RenderUnitID.BODY,BoneNameEnum.c_0_body_01,rud);
			effectRu.setScale(1.5);
			effectRu.play(1);
			effectRu.z=30;
			return owner;
		}
		
		/**
		 * 角色离开视野
		 * @param roleID
		 *
		 */
		public function removeSceneRoleById(roleID : Number) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(roleID) as SceneRole;
			if(roleID!=MainRoleManager.actorID){//不是主角自己
				removeSceneRole(role);
			}
		}
		
		public function removeSceneRoleByIdAndType(id : Number, type : String) : void
		{
			var role : SceneRole = SceneManager.getScene().getSceneObjByID(id, type) as SceneRole;
			removeSceneRole(role);
		}
		
		public function removeSceneRole(role : SceneRole) : void
		{
			if (role && role.usable)
			{
				if (SceneRoleSelectManager.mouseOverRole == role)
					SceneRoleSelectManager.mouseOverRole = null;
				if (SceneRoleSelectManager.selectedRole == role)
					SceneRoleSelectManager.selectedRole = null;
				EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE, (role.data as RoleData).type, (role.data as RoleData).id);
				//从场景中移除角色
				SceneManager.removeSceneObjFromScene(role);
			}
		}
		
		private static const needleRoleX : Array = [0, -20, 20, -40, 40];
		private static const needleRoleY : Array = [0, -20, -20, -40, -40];
		
		public function onUpdateNeedle(role : SceneRole, newVal : int, oldVal : int) : void {
			if (!(role.data is HeroData)) {
				return;
			}
			if (JobEnum.ROLE_4_TYPE != (role.data as HeroData).job) {
				return;
			}
			if (newVal==oldVal) 
			{
				return;
			}
			var i : int = 0;
			var tmp:RenderUnit3D
			if (newVal>oldVal) 
			{
				//				var add:int=newVal-oldVal;
				//				for (i = 0; i < add;i++) 
				//				{
				//					tmp=SpellAnimationHelper.addTargetEffect(role, oldVal+i, RenderUnitType.NEEDLEEFFECT, "tx_role_mieshijinzhen_01_5", BoneNameEnum.c_crossbow, 0);
				//					tmp.x = needleRoleX[oldVal+i];
				//					tmp.y =0;
				//					tmp.z = 0;
				//					var data:Object={y:needleRoleY[oldVal+i]-30,delay:i*0.3,ease:Sine.easeInOut};
				//					data["yoyo"] = true;
				//					data["repeat"] = -1;
				//					TweenMax.to(tmp,1.5,data);
				//				}
			}
			else
			{
				//				var dec:int=oldVal-newVal;	
				//				for (i = 0; i < dec; ++i) 
				//				{
				//					tmp=role.avatar.getRenderUnitByID(RenderUnitType.NEEDLEEFFECT,oldVal-1-i);
				//					TweenMax.killTweensOf(tmp);
				//					role.avatar.removeRenderUnit(tmp);
				//				}
				//				for (i = 0; i < newVal; ++i) 
				//				{
				//					tmp=role.avatar.getRenderUnitByID(RenderUnitType.NEEDLEEFFECT,i);
				//					tmp.x = needleRoleX[i];
				//				}
			}
			
		}
	}
}
