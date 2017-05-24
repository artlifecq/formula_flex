package com.editor.manager
{
	import com.editor.cfg.AvatarFileResConfig;
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.MonsterData;
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.enum.SceneCharType;
	import com.editor.events.AvatarFileListEvent;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.PlayActionStateReference;
	import com.editor.utils.RoleFaceMaskEffectUtil;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景角色管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-19 上午10:30:12
	 *
	 */
	public class SceneRoleManager
	{
		private static var _instance : SceneRoleManager;

		public function get selectedAvatarId() : String
		{
			return _selectedAvatarId;
		}

		public static function getInstance() : SceneRoleManager
		{
			if (!_instance)
				_instance = new SceneRoleManager();
			return _instance;
		}

		private var _previewEntity : SceneRole;
		
		private var _unitTestEntity : SceneRole;
		
		private var _scenePreviewEntity : SceneRole;
		
		/**
		 * 场景中的主角，用来做向导用的 
		 */		
		private var _targetPlayer : SceneRole;

		/**
		 * 右上角小窗口的角色，用来预览avatar，半身像的 
		 * @return 
		 * 
		 */		
		public function get previewEntity() : SceneRole
		{
			return _previewEntity;
		}

		public function get unitTestEntity() : SceneRole
		{
			return _unitTestEntity;
		}

		public function removeUnitTestEntity() : void
		{
			if (_unitTestEntity)
			{
				SceneManager.getInstance().removeSceneObjFromMainScene(_unitTestEntity);
				_unitTestEntity = null;
			}
		}

		public function get targetPos() : Vector3D
		{
			return _targetPlayer.position;
		}

		public function set targetPos(pos : Vector3D) : void
		{
			_targetPlayer.position = pos;
			_scenePreviewEntity.position = pos;
		}

		/**
		 * 场景中的主角，用来做向导用的 
		 */
		public function get targetPlayer() : SceneRole
		{
			return _targetPlayer;
		}

		public function get scenePreviewEntity() : SceneRole
		{
			return _scenePreviewEntity;
		}

		private var _selectedAvatarId : String;

		public function SceneRoleManager()
		{
		}

		public function init() : void
		{
			createCameraTarget();

			_previewEntity = SceneRole.create(SceneCharType.PREVIEW_PLAYER, int.MAX_VALUE);
			var data : RoleData = new RoleData();
			_previewEntity.data = data;
			_previewEntity.canRemoved = false;
			_previewEntity.needInViewDist = false;
			_previewEntity.isInViewDistance = true;

			//EventManager.addEvent(AvatarPreviewEvent.SELECTED_FILE, setPreviewAvatar);
			EventManager.addEvent(AvatarFileListEvent.UPDATE_AVATAR_FILE_LIST, updatePreviewAvatar);
		}

		public function initScenePreview() : void
		{
			_scenePreviewEntity = SceneRole.create(SceneCharType.PREVIEW_PLAYER, int.MAX_VALUE);
			var roleData : RoleData = new RoleData();
			_scenePreviewEntity.data = roleData;
			SceneManager.getInstance().addSceneObjToMainScene(_scenePreviewEntity, true);
			_scenePreviewEntity.canRemoved = false;
			_scenePreviewEntity.mouseEnable = false;
			_scenePreviewEntity.visible = false;
		}

		public static const DEFAULT_BODY_RES_ID : String = "pc/body/binjia_skin";//"cameraFocus/player"; //"jiruqianlong/jrql_finish_awd";//"cameraFocus/chushi";
		public static const DEFAULT_BODY_ANIMATOR_ID : String = "pc/body/binjia_animat";

		private function createCameraTarget() : void
		{
			var role : SceneRole = SceneRole.create(SceneCharType.PLAYER, 0);
            role.isMainChar = true;
			
			_targetPlayer = role;
			
			var data : RoleData = new RoleData();
			data.name = "";
			data.avatarInfo.setBodyResID(DEFAULT_BODY_RES_ID, DEFAULT_BODY_ANIMATOR_ID);
			data.sizeScale = 1;
			role.data = data;
			role.canRemoved = false;
			role.id = data.id;
			role.name = data.name;
			role.setScale(data.sizeScale);
			role.rotationY = 0;
			role.offsetY = 0;
			role.mouseEnable = false;
		}

		public function cancelSelect() : Boolean
		{
            var rs : Boolean = null != _selectedAvatarId;
			_selectedAvatarId = null;
			EventManager.dispatchEvent(AvatarFileListEvent.CANCEL_SELECTED_AVATAR);
			setPreviewAvatar(null);
            return rs;
		}

		public function setSelectedAvatarId(avatarId : String) : void
		{
			_selectedAvatarId = avatarId;
		}

		public function updatePreviewAvatar() : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
			if (!configDesc)
				return;
			if (configDesc.selectedData is AvatarFileResConfig)
			{
				setPreviewAvatar((configDesc.selectedData as AvatarFileResConfig).mRes, (configDesc.selectedData as AvatarFileResConfig).mHairRes, (configDesc.selectedData as AvatarFileResConfig).mWeaponRes, (configDesc.selectedData as AvatarFileResConfig).mMountRes, //
					(configDesc.selectedData as AvatarFileResConfig).mEffectRes, null, null, (configDesc.selectedData as AvatarFileResConfig).mAnimatRes);
			}
		}

		/**
		 * 设置预览换装
		 * @param bodyId
		 * @param hairId
		 * @param weaponId
		 * @param mountId
		 * @param effectId
		 * @param weaponEffectId
		 * @param weaponEffectScale
		 * @param animatRes
		 *
		 */
		public function setPreviewAvatar(bodyId : String = null, hairId : String = null, weaponId : String = null, mountId : String = null, effectId : String = null, //
			weaponEffectResIDs : Array = null, weaponEffectBindBones : Array = null, animatRes : String = null, bodyEffectResIDs : Array = null, bodyEffectBindBones : Array = null, bodyMethodTypeEffectResID : String = null) : void
		{
			var mountAnimatRes : String = null;
			if (bodyId)
			{
				var desc : ConfigDesc;
				var datas : Array;
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
				if (tabel)
				{
					desc = tabel.getConfigDesc();
					datas = ConfigData.getCfgByFieldValue(desc, desc.majorKey, bodyId);
					if (datas.length > 0)
					{
						var avatarResConfig : AvatarResConfig = datas[0] as AvatarResConfig;
						effectId = avatarResConfig.mIdleEffect;
					}
				}
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
				if (tabel)
				{
					desc = tabel.getConfigDesc();
					datas = ConfigData.getCfgByFieldValue(desc, desc.majorKey, mountId);
					if (datas.length > 0)
					{
						var avatarFileResConfig : AvatarFileResConfig = datas[0] as AvatarFileResConfig;
						mountAnimatRes = avatarFileResConfig.mAnimatRes;
					}
				}
			}

			var role : SceneRole = previewEntity;
			if (!role)
			{
				return;
			}
			role.avatar.removeRenderUnitByID(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			var data : RoleData = role.data as RoleData;
			data.name = "换装预览";
			data.avatarInfo.setBodyResID(bodyId, animatRes);
			data.avatarInfo.hairResID = hairId;
			data.avatarInfo.weaponResID = weaponId;
			data.avatarInfo.setMountResID(mountId, mountAnimatRes);
			data.avatarInfo.effectResID = effectId;
			data.avatarInfo.setBodyEffectResIDs(bodyEffectResIDs, bodyEffectBindBones);
			data.avatarInfo.bodyMethodTypeEffectResID = bodyMethodTypeEffectResID;
			data.avatarInfo.setWeaponEffectResIDs(weaponEffectResIDs, weaponEffectBindBones);
			data.sizeScale = 1;

			//设置VO
			role.data = data;
			role.name = data.name;
			role.setScale(data.sizeScale);
			role.rotationY = 0;
			role.offsetY = 0;
			role.startRender();

			role.avatar.shareMaterials = false;
			role.avatar.lightPicker = Stage3DLayerManager.screenLightPicker;
			//执行主换装更新
			AvatarManager.callEquipmentChange(role);

			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.IDLE);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);

			(_scenePreviewEntity.data as RoleData).avatarInfo.setBodyResID(bodyId, animatRes);
			(_scenePreviewEntity.data as RoleData).avatarInfo.weaponResID = weaponId;
			(_scenePreviewEntity.data as RoleData).avatarInfo.setMountResID(mountId, mountAnimatRes);
			(_scenePreviewEntity.data as RoleData).avatarInfo.hairResID = hairId;
			(_scenePreviewEntity.data as RoleData).avatarInfo.setBodyEffectResIDs(bodyEffectResIDs, bodyEffectBindBones);
			(_scenePreviewEntity.data as RoleData).avatarInfo.effectResID = effectId;
			(_scenePreviewEntity.data as RoleData).avatarInfo.setWeaponEffectResIDs(weaponEffectResIDs, weaponEffectBindBones);
			//执行主换装更新
			AvatarManager.callEquipmentChange(_scenePreviewEntity);
			_scenePreviewEntity.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”

			if (bodyId)
			{
				//暂时放一个攻击者到这边
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.setBodyResID(bodyId, animatRes);
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.weaponResID = weaponId;
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.setMountResID(mountId, mountAnimatRes);
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.hairResID = hairId;
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.setBodyEffectResIDs(bodyEffectResIDs, bodyEffectBindBones);
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.effectResID = effectId;
				(SpellFightManager.getInstance().attackEntity.data as RoleData).avatarInfo.setWeaponEffectResIDs(weaponEffectResIDs, weaponEffectBindBones);
				//执行主换装更新
				AvatarManager.callEquipmentChange(SpellFightManager.getInstance().attackEntity);
				SpellFightManager.getInstance().attackEntity.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
				//暂时放一个敌人到这边
				SpellFightManager.getInstance().updateEnemyEntities(bodyId, weaponId, mountId, mountAnimatRes, hairId, animatRes);
			}
			updatePreviewState();
		}

		public var previewOffsetX : int = 0;
		public var previewOffsetY : int = 0;
		public var previewMaskX : int = 0;
		public var previewMaskY : int = 0;
		public var previewMaskScale : Number = 0;
		public var previewMaskRotation : int = 0;

		private var showOffsetX : int = 0;
		private var showOffsetY : int = 0;

		public function updatePreviewState() : void
		{
			RoleFaceMaskEffectUtil.currAreaShapeX = 0;
			RoleFaceMaskEffectUtil.currAreaShapeY = 0;
			previewMaskX = 0;
			previewMaskY = 0;
			previewMaskScale = AvatarPreviewManager.scale;
			previewMaskRotation = AvatarPreviewManager.rotationY;

			if (RoleFaceMaskEffectUtil.faceMaskEffectType > 0)
			{
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
				var desc : ConfigDesc;
				var datas : Array;
				if (tabel)
				{
					desc = tabel.getConfigDesc();
					datas = ConfigData.getCfgByFieldValue(desc, "key", "DEFAULT_SETTING");
					if (datas.length > 0)
					{
						var setting : GlobalSettingConfig = datas[0];
						if (RoleFaceMaskEffectUtil.faceMaskEffectType == 1)
						{
							RoleFaceMaskEffectUtil.currAreaShapeX = setting.mDialogFaceOffsetX + RoleFaceMaskEffectUtil.fixAreaShapeX;
							RoleFaceMaskEffectUtil.currAreaShapeY = setting.mDialogFaceOffsetY + RoleFaceMaskEffectUtil.fixAreaShapeY;
						}
						else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 2)
						{
							RoleFaceMaskEffectUtil.currAreaShapeX = setting.mHeadFaceOffsetX + RoleFaceMaskEffectUtil.fixAreaShapeX;
							RoleFaceMaskEffectUtil.currAreaShapeY = setting.mHeadFaceOffsetY + RoleFaceMaskEffectUtil.fixAreaShapeY;
						}
						else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 3)
						{
							RoleFaceMaskEffectUtil.currAreaShapeX = setting.mBossHeadFaceOffsetX + RoleFaceMaskEffectUtil.fixAreaShapeX;
							RoleFaceMaskEffectUtil.currAreaShapeY = setting.mBossHeadFaceOffsetY + RoleFaceMaskEffectUtil.fixAreaShapeY;
						}
					}
				}
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
				if (tabel)
				{
					desc = tabel.getConfigDesc();
					datas = ConfigData.getCfgByFieldValue(desc, desc.majorKey, (_previewEntity.data as RoleData).avatarInfo.bodyResID);
					if (datas.length > 0)
					{
						var avatarResConfig : AvatarResConfig = datas[0] as AvatarResConfig;
						if (RoleFaceMaskEffectUtil.faceMaskEffectType == 1)
						{
							previewMaskX = avatarResConfig.mDialogFaceMaskX;
							previewMaskY = avatarResConfig.mDialogFaceMaskY;
							previewMaskScale = avatarResConfig.mDialogFaceMaskScale;
							previewMaskRotation = avatarResConfig.mDialogFaceMaskRotation;
						}
						else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 2)
						{
							previewMaskX = avatarResConfig.mHeadFaceMaskX;
							previewMaskY = avatarResConfig.mHeadFaceMaskY;
							previewMaskScale = avatarResConfig.mHeadFaceMaskScale;
							previewMaskRotation = avatarResConfig.mHeadFaceMaskRotation;
						}
						else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 3)
						{
							previewMaskX = avatarResConfig.mHeadFaceMaskX;
							previewMaskY = avatarResConfig.mHeadFaceMaskY;
							previewMaskScale = avatarResConfig.mHeadFaceMaskScale;
							previewMaskRotation = avatarResConfig.mHeadFaceMaskRotation;
						}
					}
				}
			}

			if (Stage3DLayerManager.screenView)
			{
				if (RoleFaceMaskEffectUtil.faceMaskEffectType == 1)
				{
					RoleFaceMaskEffectUtil.addDialogFaceMaskEffect(_previewEntity);
					previewOffsetX = previewMaskX;
					previewOffsetY = previewMaskY + Stage3DLayerManager.screenView.height;
					showOffsetX = RoleFaceMaskEffectUtil.currAreaShapeX;
					showOffsetY = RoleFaceMaskEffectUtil.currAreaShapeY;
				}
				else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 2)
				{
					RoleFaceMaskEffectUtil.addHeadFaceMaskEffect(_previewEntity);
					previewOffsetX = previewMaskX;
					previewOffsetY = previewMaskY + Stage3DLayerManager.screenView.height;
					showOffsetX = RoleFaceMaskEffectUtil.currAreaShapeX;
					showOffsetY = RoleFaceMaskEffectUtil.currAreaShapeY;
				}
				else if (RoleFaceMaskEffectUtil.faceMaskEffectType == 3)
				{
					RoleFaceMaskEffectUtil.addBossHeadFaceMaskEffect(_previewEntity);
					previewOffsetX = previewMaskX;
					previewOffsetY = previewMaskY + Stage3DLayerManager.screenView.height;
					showOffsetX = RoleFaceMaskEffectUtil.currAreaShapeX;
					showOffsetY = RoleFaceMaskEffectUtil.currAreaShapeY;
				}
				else
				{
					RoleFaceMaskEffectUtil.removeFaceMaskEffect(_previewEntity);
					previewOffsetX = 0;
					previewOffsetY = 0;
					showOffsetX = Stage3DLayerManager.screenView.width * 0.5;
					if ((_previewEntity.data as RoleData).avatarInfo.bodyResID)
					{
						showOffsetY = -100;
					}
					else
					{
						showOffsetY = -Stage3DLayerManager.screenView.height * 0.5;
					}
				}
				_previewEntity.setScale(previewMaskScale);
				_previewEntity.rotationY = previewMaskRotation;
				_previewEntity.x = previewOffsetX + showOffsetX;
				_previewEntity.z = previewOffsetY - showOffsetY;

				var ref : PlayActionStateReference = _previewEntity.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
				ref.setParams(RoleActionType.IDLE);
				_previewEntity.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref, true); //切换到“播放状态”

				RoleFaceMaskEffectUtil.updateFadeAlphaRectPos(_previewEntity, showOffsetX, showOffsetY);
			}
		}

		public function createUnitTestMonster(monsterData : MonsterData) : SceneRole
		{
			monsterData.id = 1000;
			var targetPos : Vector3D = SceneRoleManager.getInstance().targetPos;
			monsterData.x = targetPos.x;
			monsterData.y = targetPos.z;
			var role : SceneRole = SceneRole.create(SceneCharType.MONSTER, monsterData.id);
			//设置VO
			role.data = monsterData;
			role.name = "单元测试怪物";
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
			if (configDesc && (configDesc.selectedData is AvatarFileResConfig))
				monsterData.avatarInfo.setBodyResID((configDesc.selectedData as AvatarFileResConfig).mRes, (configDesc.selectedData as AvatarFileResConfig).mAnimatRes);
			else
				monsterData.avatarInfo.setBodyResID(null, null);

			//执行主换装更新
			AvatarManager.callEquipmentChange(role);

			if (monsterData.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			else
			{
				role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}

			role.setScale(monsterData.sizeScale);
			role.setGroundXY(monsterData.x, monsterData.y);
			SceneManager.getInstance().addSceneObjToMainScene(role, true);
			_unitTestEntity = role;
			return role;
		}

		public function createSceneEntityAvatar(index : int, id : int, bodyId : String, hairId : String, weaponId : String, mountId : String, effectId : String, sizeScale : int, cfg : ConfigData) : uint
		{
			var role : SceneRole = SceneRole.create(SceneCharType.MONSTER_TB + cfg.tabelName + index, id);
			var data : MonsterData = new MonsterData();
			data.id = id;
			data.name = "换装预览";
			data.avatarInfo.setBodyResID(bodyId, null);
			data.avatarInfo.hairResID = hairId;
			data.avatarInfo.weaponResID = weaponId;
			data.avatarInfo.setMountResID(mountId, null);
			data.avatarInfo.effectResID = effectId;
			data.sizeScale = sizeScale > 0 ? (sizeScale * 0.01) : 1;

			//设置VO
			role.data = data;
			role.cfg = cfg;
			role.name = data.name;
			role.setScale(data.sizeScale);
			role.mouseEnable = false;

			//执行主换装更新
			AvatarManager.callEquipmentChange(role);
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.IDLE);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);

			SceneManager.getInstance().addSceneObjToMainScene(role, true);

			return role.id;
		}
	}
}
