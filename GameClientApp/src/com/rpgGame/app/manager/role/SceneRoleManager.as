package com.rpgGame.app.manager.role
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.ClientMapAreaGridData;
	import com.rpgGame.app.graphics.AttackFaceSprite;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.graphics.StallHeadFace;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.app.state.role.control.RidingStateReference;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StallCfgData;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.role.ZhanCheData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.HeadBloodStateType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import app.message.StallTypeDataProto;
	
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
			role.attackFace=AttackFaceSprite.create(role);

			//执行主换装更新
			AvatarManager.callEquipmentChange(role);

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

			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			SceneManager.addSceneObjToScene(role, true, true, renderLimitable);

			CharAttributeManager.setCharHp(data, data.totalStat.hp);
			CharAttributeManager.setCharMaxLife(data, data.totalStat.life); //需要提供初始化方法,优化一下!
			if (!isMainChar)
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
			role.headFace = HeadFace.create(role);
			role.attackFace = AttackFaceSprite.create(role);
			var roleNameStr : String = (bornData ? bornData.q_name.toString() : "未知怪物");
			if (charType == SceneCharType.NPC && data.ownerName)
			{
				roleNameStr = roleNameStr + "(" + data.ownerName + ")";
			}
			role.name = data.name = roleNameStr;
			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
			data.avatarInfo.setBodyResID(bornData ? bornData.q_body_res : "", null);
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(bornData ? bornData.q_body_res : "");
			if (avatarResConfig)
			{
				data.avatarInfo.effectResID = avatarResConfig.idleEffect;
			}
			data.sizeScale = (bornData && bornData.q_scale > 0) ? (bornData.q_scale * 0.01) : 1;
//			data.totalStat.level = bornData ? bornData.q_grade : 0;
			data.bodyRadius = bornData ? bornData.q_body_radius_pixel : 0;
			data.direction = bornData ? bornData.q_direction : 0;
			data.immuneDeadBeat = /*bornData ? bornData.immuneDeadBeat :*/ false;

			var mountResID : String = bornData ? bornData.q_mount_res : "";
			if (mountResID)
			{
				var ref : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref.setParams(mountResID, null);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref);
			}
			else
			{
				//执行主换装更新
				AvatarManager.updateAvatar(role);
			}

			if (charType == SceneCharType.NPC)
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			else if(charType == SceneCharType.CLIENT_NPC)
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			else
			{
				if (data.totalStat.hp <= 0)
				{
					role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
				}
				else
				{
					role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
				}
			}

			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			if (charType == SceneCharType.NPC)
			{
				SceneManager.addSceneObjToScene(role, true, false, false);
			}
			else if(charType == SceneCharType.CLIENT_NPC)
			{
				SceneManager.addSceneObjToScene(role, true, data.needInViewDist, true);
			}
			else
			{
				SceneManager.addSceneObjToScene(role, true, true, true);
			}
			MainRoleSearchPathManager.trySetSearchRoleData(data);
			if (charType == SceneCharType.NPC)
			{
				TaskUtil.tryAddTaskIco(role);
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
			var stallType : StallTypeDataProto = StallCfgData.getStallTypeData(data.stallType);
			data.avatarInfo.setBodyResID(stallType ? stallType.stallRes : "", null);
			data.sizeScale = 1;
			data.totalStat.level = 0;
			data.bodyRadius = 0;
			data.direction = 0;
			//执行主换装更新
			AvatarManager.updateAvatar(role);
			var owner : SceneRole = SceneManager.getSceneObjByID(data.playerId) as SceneRole;
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
			role.setScale(data.sizeScale);
			if (stallAreaGrid && owner)
			{
				role.setGroundXY(stallAreaGrid.gridX, stallAreaGrid.gridY);
				owner.setCamouflageEntity(role);
			}
			else
				GameAlert.debugShow("没有找到这个人，没办法摆摊");
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true, true, true);
		}


		public function createZhanChe(data : ZhanCheData) : SceneRole
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.ZHAN_CHE);
			var role : SceneRole = SceneRole.create(SceneCharType.ZHAN_CHE, data.id);
			var monsterCfgID : int = CountryWarCfgData.getMonsterCfgIDOfZhanChe(data.modelID);
			var bornData : Q_monster = MonsterDataManager.getData(monsterCfgID);
			//设置VO
			role.data = data;
			role.headFace = HeadFace.create(role);
			var monsterNameStr : String = (bornData ? bornData.q_name.toString() : "未知怪物");
			var roleNameStr : String = monsterNameStr + "(" + data.ownerName + ")";
			role.name = data.name = roleNameStr;
			role.ownerIsMainChar = (data.ownerId == MainRoleManager.actorID);
			data.avatarInfo.setBodyResID(bornData ? bornData.q_body_res : "", null);
			data.sizeScale = (bornData && bornData.q_scale > 0) ? (bornData.q_scale * 0.01) : 1;
//			data.totalStat.level = bornData ? bornData.q_grade : 0;
			data.bodyRadius = bornData ? bornData.q_body_radius_pixel : 0;
			data.direction = bornData ? bornData.q_direction : 0;
			AvatarManager.updateAvatar(role);

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
			data.avatarInfo.setBodyResID(data.getModeRes(), null); //MainRoleManager.actorInfo.avatarInfo.bodyResID
			data.fixDirection = true;
			role.data = data;
			role.headFace = HeadFace.create(role);
			role.name = YunBiaoManager.setBiaoName(role);

			//执行主换装更新
			AvatarManager.updateAvatar(role);

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
			if (biaoCheData != null)
				biaoCheData.avatarInfo.setBodyResID(resPath, null);

			//执行主换装更新
			AvatarManager.updateAvatar(role);
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

		/**
		 * 创建掉落物
		 * @param data
		 *
		 */
		public function createDropGoods(data : SceneDropGoodsData) : void
		{
			//如果场景中存在此类型此ID的角色，则移除之
			removeSceneRoleByIdAndType(data.id, SceneCharType.DROP_GOODS);
			var role : SceneRole = SceneRole.create(SceneCharType.DROP_GOODS, data.id);
			//设置VO
			role.data = data;
			role.name = data.name;
			role.headFace = HeadFace.create(role);
			data.avatarInfo.setBodyResID(data.avatarRes, null);
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(data.avatarRes);
			if (avatarResConfig)
			{
				data.avatarInfo.effectResID = avatarResConfig.idleEffect;
			}

			//执行主换装更新
			AvatarManager.updateAvatar(role);
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.STAND, 1, data.isDroped ? int.MAX_VALUE : 0);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref, true); //切换到“播放状态”

			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true, false, false);
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
			data.avatarInfo.setBodyResID(data.avatarRes, null);
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(data.avatarRes);
			if (avatarResConfig)
			{
				data.avatarInfo.effectResID = avatarResConfig.idleEffect;
			}

			//执行主换装更新
			AvatarManager.updateAvatar(role);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”

			role.setScale(data.sizeScale);
			role.setGroundXY(data.x, data.y);
			role.rotationY = data.direction;
			SceneManager.addSceneObjToScene(role, true, false, false);
			ClientTriggerManager.addTriggerCollectEffect(role);
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
			role.headFace = HeadFace.create(role);
			data.avatarInfo.effectResID = data.effectRes;

			//执行主换装更新
			AvatarManager.updateAvatar(role);
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

			var effectRu : RenderUnit3D = RenderUnit3D.create(rud);
			effectRu.repeat = 0;
			effectRu.mouseEnable = true;
			effectRu.setGroundXY(x, y);
			effectRu.setScale(data.sizeScale > 0 ? (data.sizeScale * 0.01) : 1);
			effectRu.rotationY = data.direction;
			effectRu.data = data;
			SceneManager.addSceneObjToScene(effectRu, true, false, false);
			effectRu.play(0);
			return effectRu;
		}

		/**
		 * 角色离开视野
		 * @param roleID
		 *
		 */
		public function removeSceneRoleById(roleID : Number) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(roleID) as SceneRole;
			removeSceneRole(role);
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
	}
}
