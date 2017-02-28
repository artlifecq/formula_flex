package com.rpgGame.app.manager
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.RidingStateReference;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarMountResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.cfg.model.HeroModelCfgData;
	import com.rpgGame.coreData.cfg.model.MountModelCfgData;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarHairRes;
	import com.rpgGame.coreData.clientConfig.AvatarMountRes;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.HeroModel;
	import com.rpgGame.coreData.clientConfig.MountModel;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 换装管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 上午10:03:17
	 *
	 */
	public class AvatarManager
	{
		public static function updateAvatar(role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			if (role.headFace)
				role.headFace.removeBodyRender();

			role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
			role.avatar.buildSyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
			role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);

			//无模型时添加血条
			if (role.headFace)
				role.headFace.addTemporaryBar();

			//上“坐骑”
			updateMount(role); //暂时先不搞坐骑。动作有问题
			//穿“主体”
			updateBody(role);
			//穿“头发”
			updateHair(role);
			//穿“武器”
			updateWeapon(role);
			//穿“副武器”
			updateDeputyWeapon(role);
			//穿“特效”
			updateEffect(role);

			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			role.buffSet.updateBuffEffects();
			RoleStateUtil.updateRoleBaseWalkActionSpeed(role);
		}

		private static function getUseVolume(resId : String) : Boolean
		{
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(resId);
			if (avatarResConfig)
				return avatarResConfig.useVolume;
			return false;
		}

		private static function updateBody(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData = avatarInfo.rpd_body;
			var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
			if (rpd_body != null)
			{
				var ru : RenderUnit3D;
				if (rpd_mount) //坐骑作为换装主体
				{
					if (rpd_mount.animatorSourchPath)
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.b_0_saddle_01, rpd_body);
					else
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.b_0_saddle_01, rpd_body);
				}
				else
				{
					ru = role.avatar.addRenderUnit(rpd_body);
				}
				if (ru)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru.addUnitAtComposite(ru);
					}
					ru.defalutStatus = RoleActionType.STAND;
					ru.setAddedCallBack(partAddedCallBack, role);
					if (role.isMainChar)
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
					ru.useLight = true;
					if (role.type != SceneCharType.DUMMY)
					{
						ru.castsShadows = true;
						var useVolume : Boolean = false;
						if (!rpd_mount)
						{
							useVolume = getUseVolume(avatarInfo.bodyResID);
						}
						role.setRenderUseVolume(RenderUnitType.BODY, RenderUnitID.BODY, useVolume);
					}
					role.avatar.applySyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			}

			var rpd_body_effect : RenderParamData = avatarInfo.rpd_body_effect;
			if (rpd_body_effect != null)
			{
				ru = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_body_effect);
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_0_body_01, rpd_body_effect);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_0_body_01, rpd_body_effect);
					}
				}
				if (ru)
				{
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
					ru.repeat = 0;
					ru.play(0);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY_EFFECT, RenderUnitID.BODY_EFFECT);
			}
		}

		private static function updateHair(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_hair : RenderParamData = avatarInfo.rpd_hair;
			if (rpd_hair != null)
			{
				var ru : RenderUnit3D;
				var rpd_body : RenderParamData = avatarInfo.rpd_body;
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToComposite(RenderUnitType.BODY, RenderUnitID.BODY, rpd_hair);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_0_head_01, rpd_hair);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.STAND;
					ru.setAddedCallBack(partAddedCallBack, role);
					if (role.isMainChar)
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
					ru.useLight = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.HAIR, RenderUnitID.HAIR);
			}
		}

		private static function updateWeapon(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var ru : RenderUnit3D;
			var rpd_weapon : RenderParamData = avatarInfo.rpd_weapon;
			var rpd_body : RenderParamData = avatarInfo.rpd_body;
			if (rpd_weapon != null)
			{
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.STAND;
					ru.setAddedCallBack(partAddedCallBack, role);
					if (role.isMainChar)
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
					ru.useLight = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			}

			var rpd_weapon_effect : RenderParamData = avatarInfo.rpd_weapon_effect;
			if (rpd_weapon_effect != null)
			{
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon_effect);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon_effect);
					}
				}
				if (ru)
				{
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
					ru.repeat = 0;
					ru.position = avatarInfo.weaponEffectOffset || new Vector3D();
					ru.setScale(avatarInfo.weaponEffectScale > 0 ? avatarInfo.weaponEffectScale * 0.01 : 1);
					ru.play(0);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON_EFFECT, RenderUnitID.WEAPON_EFFECT);
			}
		}

		private static function updateDeputyWeapon(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_deputy_weapon : RenderParamData = avatarInfo.rpd_deputy_weapon;
			if (rpd_deputy_weapon != null)
			{
				var ru : RenderUnit3D;
				var rpd_body : RenderParamData = avatarInfo.rpd_body;
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputy_weapon);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputy_weapon);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.STAND;
					ru.setAddedCallBack(partAddedCallBack, role);
					if (role.isMainChar)
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
					ru.useLight = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			}
			
			var rpd_deputyWeapon_effect : RenderParamData = avatarInfo.rpd_deputyWeapon_effect;
			if (rpd_deputyWeapon_effect != null)
			{
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputyWeapon_effect);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputyWeapon_effect);
					}
				}
				if (ru)
				{
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
					ru.repeat = 0;
					ru.position = avatarInfo.deputyWeaponEffectOffset || new Vector3D();
					ru.setScale(avatarInfo.deputyWeaponEffectScale > 0 ? avatarInfo.deputyWeaponEffectScale * 0.01 : 1);
					ru.play(0);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.DEPUTY_WEAPON_EFFECT, RenderUnitID.DEPUTY_WEAPON_EFFECT);
			}
		}

		private static function updateEffect(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_effect : RenderParamData = avatarInfo.rpd_effect;
			if (rpd_effect != null)
			{
				var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_effect);
				if (ru)
				{
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			}
		}

		private static function updateMount(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
			if (rpd_mount != null)
			{
				var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_mount);
				if (rpd_mount.animatorSourchPath)
				{
//					ru.addUnitAtComposite(ru);
				}
				ru.defalutStatus = RoleActionType.STAND;
				ru.setAddedCallBack(partAddedCallBack, role);
				if (role.isMainChar)
					ru.entityGlass = true;
				else
					ru.entityGlass = false;
				ru.useLight = true;
				if (role.type != SceneCharType.DUMMY)
				{
					ru.castsShadows = true;
					var useVolume : Boolean = getUseVolume(avatarInfo.mountResID);
					role.setRenderUseVolume(RenderUnitType.MOUNT, RenderUnitID.MOUNT, useVolume);
				}
				role.avatar.applySyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
			}
		}

		/**部件添加完成*/
		private static function partAddedCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			ru.removeAddedCallBack(partAddedCallBack);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData = avatarInfo.rpd_body;
			if (rpd_body)
			{
				var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
				if (rpd_mount)
				{
					if (ru.id == RenderUnitID.MOUNT && role.headFace)
						role.headFace.setBodyRender(ru);
				}
				else
				{
					if (ru.id == RenderUnitID.BODY && role.headFace)
						role.headFace.setBodyRender(ru);
				}
			}
			else
			{
				if (ru.id == RenderUnitID.EFFECT && role.headFace)
					role.headFace.setBodyRender(ru);
			}
		}
		
		
		/**
		 *  等以后确定了，这里的逻辑还是要改的，目前能知道的是，每个角色的不同形态可以用自己的一套骨骼。坐骑的话，还不确定。
		 * 但是可以确定的是不分男女
		 * @param role
		 * 
		 */		
		public static function callEquipmentChange(role : SceneRole) : void
		{
			if (!role || !role.usable)
				return;
			var roleData : HeroData = role.data as HeroData;
			var animatResID : String = null;
			var bodyResID : String = null;
			var hairResID : String = null;
			var mountResID : String = null;
			var mountAnimatResID : String = null;
			var weaponResID : String = null;
			var weaponEffectResID : String = "";
			var weaponEffectScale : int = 0;
			var weaponEffectOffset : Vector3D = null;
			var deputyWeaponResID : String = null;
			var deputyWeaponEffectResID : String = "";
			var deputyWeaponEffectScale : int = 0;
			var deputyWeaponEffectOffset : Vector3D = null;
			var bodyEffectResID : String = null;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(roleData.body);
			var mountModel : MountModel = MountModelCfgData.getInfo(0);
			
			
			var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(roleData.cloths);
			if (!clothesRes)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(roleData.job);
			}
			
			if (clothesRes)
			{
				bodyResID = clothesRes.bodyRes;
				bodyEffectResID = clothesRes.effectRes;

				var hairRes : AvatarHairRes = AvatarHairResCfgData.getInfo(roleData.hair);
				if (!hairRes)
				{
					hairRes = AvatarHairResCfgData.getInfo(clothesRes.hairResId);
				}
				hairResID = hairRes.hairRes;
				//					if (roleData.sex)
				//						hairResID = hairRes.hairRes_man;
				//					else
				//						hairResID = hairRes.hairRes_woman;				
				
				var mountRes : AvatarMountRes = AvatarMountResCfgData.getInfo(roleData.mount);
				if (mountRes)
				{
					mountResID = mountRes.mountRes;
				}
				switch (roleData.job)
				{
					case 1:
						animatResID = heroModel.animatRes_bingjia;	
						break;
					case 2:
						if(roleData.sex)
						{
							animatResID = heroModel.animatRes_mojia_man;
						}
						else
						{
							animatResID = heroModel.animatRes_mojia_woman;
						}
						break;
					case 3:
						if(roleData.sex)
						{
							animatResID = heroModel.animatRes_mojia_man;
						}
						else
						{
							animatResID = heroModel.animatRes_mojia_woman;
						}
						break;
					case 4:
						animatResID = heroModel.animatRes_yijia;
						break;
					case 5:
						animatResID = heroModel.animatRes_waibao;
						break;
				}
				
				if (mountModel)
				{
					mountAnimatResID = mountModel.animatRes;
				}
				
				var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(roleData.weapon);
				if (!weaponRes)
				{
					weaponRes = AvatarWeapontResCfgData.getInfo(clothesRes.weaponResId);
				}
				if (weaponRes)
				{
					weaponResID = weaponRes.res;
					weaponEffectResID = weaponRes.effectRes;
					weaponEffectScale = weaponRes.effectScale;
					weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
				}
				var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(roleData.deputyWeapon);
				if (deputyWeaponRes)
				{
					deputyWeaponResID = deputyWeaponRes.res;
					deputyWeaponEffectResID = deputyWeaponRes.effectRes;
					deputyWeaponEffectScale = deputyWeaponRes.effectScale;
					deputyWeaponEffectOffset = new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
				}
			}

			if (roleData.trailMount)
			{
				mountResID = roleData.trailMount;
				mountAnimatResID = roleData.trailMountAnimat;
			}
			roleData.avatarInfo.setBodyResID(bodyResID, animatResID);
			roleData.avatarInfo.hairResID = hairResID;
			roleData.avatarInfo.setMountResID(mountResID, mountAnimatResID);
			roleData.avatarInfo.bodyEffectID = bodyEffectResID;
			roleData.avatarInfo.weaponResID = weaponResID;
			roleData.avatarInfo.weaponEffectID = weaponEffectResID;
			roleData.avatarInfo.weaponEffectScale = weaponEffectScale;
			roleData.avatarInfo.weaponEffectOffset = weaponEffectOffset;
			roleData.avatarInfo.deputyWeaponResID = deputyWeaponResID;
			roleData.avatarInfo.deputyWeaponEffectID = deputyWeaponEffectResID;
			roleData.avatarInfo.deputyWeaponEffectScale = deputyWeaponEffectScale;
			roleData.avatarInfo.deputyWeaponEffectOffset = deputyWeaponEffectOffset;
			if (mountResID)
			{
				var ref : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref.setParams(mountResID, mountAnimatResID);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref);
			}
			else
			{
				if ((role.stateMachine as RoleStateMachine).isRiding)
				{
					role.stateMachine.removeState(RoleStateType.CONTROL_RIDING);
				}
				else
				{
					updateAvatar(role);
				}
			}
			EventManager.dispatchEvent(AvatarEvent.EQUIP_CHANGE, role);
		}
	}
}
