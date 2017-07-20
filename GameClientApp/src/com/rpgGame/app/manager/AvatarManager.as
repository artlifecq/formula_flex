package com.rpgGame.app.manager
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.BaseObjChild;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderUnitChild;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.RidingStateReference;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.cfg.model.HeroModelCfgData;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarHairRes;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.HeroModel;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
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
	 *换装管理器 
	 * @author dik（整理）
	 * 2017-07-18
	 */
	public class AvatarManager
	{
		private static const simpleShadowBaseScale : Number = 0.01;
		
		public function AvatarManager()
		{
		}
		
		/**
		 *根据角色数据重置avatar
		 * @param role
		 * @param isUseforAvatar
		 * @param isMountBlank
		 * @param updateBuff
		 * 
		 */
		public static function resetAvatar(role : SceneRole, isUseforAvatar : Boolean = false, isMountBlank : Boolean = false, updateBuff : Boolean = true) : void
		{
			if (!role || !role.usable)
				return;
			var roleData : HeroData = role.data as HeroData;
			updateHeroAvatarInfo(roleData,isUseforAvatar,isMountBlank,updateBuff);
			updateAllPart(role, updateBuff);
		}
		
		/**
		 *更新所有部件 
		 * @param role
		 * @param updataBuff
		 * 
		 */
		public static function updateAllPart(role : SceneRole,updataBuff:Boolean = true) : void
		{
			if (role == null || !role.usable)
				return;
			
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			
			role.avatar.secondStatusGetter = getSecondStatus;
			
			
			role.avatar.buildSyncInfo(RenderUnitType.FIGHTSOUL, RenderUnitID.FIGHTSOUL);
			//上“坐骑”
			updateMount(role);
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
			//战旗“特效”
			updateFlag(role);
			//穿“效果方法类型特效”
			updateBodyMethodType(role);
			updateRoleSimpleShadow(role);
			
			if(updataBuff)
				role.buffSet.updateBuffEffects();
			RoleStateUtil.updateRoleBaseWalkActionSpeed(role);
			
			if (avatarInfo.rpd_body)
			{
				var data : RoleData = RoleData(role.data);
				var avatarResConfig : AvatarResConfig;
				var bodyRu : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
				var mountRu : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
				if (mountRu)
				{
					if (role.headFace)
					{
						if (!mountRu.resReady)
							role.headFace.setBodyRender(null); //无模型时添加血条
						else
							role.headFace.setBodyRender(mountRu);
					}
				}
				else if (bodyRu)
				{
					if (role.headFace)
					{
						if (!bodyRu.resReady)
							role.headFace.setBodyRender(null); //无模型时添加血条
						else
							role.headFace.setBodyRender(bodyRu);
					}
				}
			}
			else if (avatarInfo.rpd_effect)
			{
				var effectRu : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
				if (effectRu)
				{
					if (role.headFace)
					{
						if (!effectRu.resReady)
							role.headFace.setBodyRender(null); //无模型时添加血条
						else
							role.headFace.setBodyRender(effectRu);
					}
				}
			}
		}
		
		public static function updateSimpleShadow() : void
		{
			var scene : GameScene3D = SceneManager.getScene();
			var baseObjList : Vector.<BaseObj3D> = scene.sceneRenderLayer.baseObjList;
			for each (var baseObj : BaseObj3D in baseObjList)
			{
				if (baseObj is SceneRole)
				{
					var role : SceneRole = SceneRole(baseObj);
					updateRoleSimpleShadow(role);
				}
			}
		}
		
		private static function getSecondStatus(type : String) : String
		{
			if (!type)
				return null;
			var actionHead : String = type.substr(0, type.length - 1);
			return actionHead + "5";
		}
		
		public static function updateHeroAvatarInfo(data:HeroData, isUseforAvatar : Boolean = false, isMountBlank : Boolean = false, updateBuff : Boolean = true):void
		{
			var roleData : HeroData = data;
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
			var zhanqiResID:String = "";
			
			var bodyMethodTypeEffectResID : String = null;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(roleData.body);
			var mountModel :Q_horse = HorseConfigData.getMountDataById(roleData.mount);
			var zhanqiInfo:Q_warflag = ZhanQiConfigData.getZhanQiDataById(roleData.zhanqiLv);
			
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
					mountResID = mountModel.q_skinResID;
					mountAnimatResID = mountModel.q_animatResID;
				}
				
				var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(roleData.weapon);
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
			
			if (!isUseforAvatar)
			{
				if (roleData.trailMount && !isMountBlank)
				{
					mountResID = roleData.trailMount;
					mountAnimatResID = roleData.trailMountAnimat;
				}
			}
			
			if(zhanqiInfo)
			{
				zhanqiResID=zhanqiInfo.q_panel_show_id;
			}
			
			roleData.avatarInfo.setBodyResID(bodyResID, animatResID);
			roleData.avatarInfo.hairResID = hairResID;
			roleData.avatarInfo.setMountResID(mountResID, mountAnimatResID);
			roleData.avatarInfo.bodyEffectID = bodyEffectResID;
			roleData.avatarInfo.bodyMethodTypeEffectResID = bodyMethodTypeEffectResID;
			roleData.avatarInfo.weaponResID = weaponResID;
			roleData.avatarInfo.weaponEffectID = weaponEffectResID;
			roleData.avatarInfo.weaponEffectScale = weaponEffectScale;
			roleData.avatarInfo.weaponEffectOffset = weaponEffectOffset;
			roleData.avatarInfo.deputyWeaponResID = deputyWeaponResID;
			roleData.avatarInfo.deputyWeaponEffectID = deputyWeaponEffectResID;
			roleData.avatarInfo.deputyWeaponEffectScale = deputyWeaponEffectScale;
			roleData.avatarInfo.deputyWeaponEffectOffset = deputyWeaponEffectOffset;
			roleData.avatarInfo.zhanqiResID = zhanqiResID;
		}
		
		/**
		 *更新衣服 
		 * @param role
		 * 
		 */
		public static function updateBody(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rpd_mount : RenderParamData3D = role.stateMachine.canShowRiding ? avatarInfo.rpd_mount : null;
			if (rpd_body != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
				var ru : RenderUnit3D;
				if (rpd_mount) //坐骑作为换装主体
				{
					if (rpd_mount.animatorSourchPath)
						ru = role.avatar.addRenderUnitToChild(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_body_02, rpd_body);
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
						//ru.setPickDummyEnable(true, BoneNameEnum.c_0_body_01); //目前游戏中只是英雄需要这么做,只有英雄是骨骼分离的,绑点美术没有给中心绑点,先用身体的。
						ru.addUnitAtComposite(ru);
					}
					else
					{
						//						ru.removeUnitChild(ru);
					}
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role.isMainChar)
					{
						//						ru.entityGlass = true;
					}
					else
					{
						ru.entityGlass = false;
					}
					ru.useLight = true;
					ru.useFog = true;
					if (role.type != SceneCharType.DUMMY)
					{
						ru.castsShadows = true;
						if (!rpd_mount)
						{
							var useVolume : Boolean = getUseVolume(avatarInfo.bodyResID);
							//							var isWheel : Boolean = getIsWheel(avatarInfo.bodyResID);
							role.setRenderUseVolume(RenderUnitType.BODY, RenderUnitID.BODY, useVolume);
							role.isWheel = false;
						}
					}
					role.avatar.applySyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			}
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			EventManager.dispatchEvent(AvatarEvent.AVATAR_CHANGE, role,RenderUnitID.BODY);
		}
		
		/**
		 *更新衣服特效 
		 * @param role
		 * 
		 */
		public static function updateBodyEft(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rpd_body_effect : RenderParamData3D = avatarInfo.rpd_body_effect;
			if (rpd_body_effect != null)
			{
				var ru : RenderUnit3D;
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rpd_body_effect);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rpd_body_effect);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
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
			
			var rpd_body_effect2 : RenderParamData3D = avatarInfo.rpd_body_effect2;
			if (rpd_body_effect2 != null)
			{
				//				ru = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_body_effect2);
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02, rpd_body_effect2);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02, rpd_body_effect2);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
					ru.repeat = 0;
					ru.play(0);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY_EFFECT2, RenderUnitID.BODY_EFFECT2);
			}
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
		
		/**
		 *更新头发 
		 * @param role
		 * 
		 */
		public static function updateHair(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_hair : RenderParamData3D = avatarInfo.rpd_hair;
			if (rpd_hair != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
				var ru : RenderUnit3D;
				var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
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
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role.isMainChar)
					{
						//						ru.entityGlass = true;
					}
					else
					{
						ru.entityGlass = false;
					}
					ru.useLight = true;
					ru.useFog = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.HAIR, RenderUnitID.HAIR);
			}
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			EventManager.dispatchEvent(AvatarEvent.AVATAR_CHANGE, role,RenderUnitID.HAIR);
		}
		
		/**
		 *更新武器 
		 * 
		 */
		public static function updateWeapon(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var ru : RenderUnit3D;
			var rpd_weapon : RenderParamData3D = avatarInfo.rpd_weapon;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			if (rpd_weapon != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToComposite(RenderUnitType.BODY, RenderUnitID.BODY, rpd_weapon);
						//						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role.isMainChar)
					{
						//						ru.entityGlass = true;
					}
					else
					{
						ru.entityGlass = false;
					}
					ru.useLight = true;
					ru.useFog = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			}
			
			role.avatar.removeRenderUnitsByType(RenderUnitType.WEAPON_EFFECT);
			var rpd_weapon_effect : RenderParamData3D = avatarInfo.rpd_weapon_effect;
			if (rpd_weapon_effect != null)
			{
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						//						ru = role.avatar.addRenderUnitToComposite(RenderUnitType.BODY, RenderUnitID.BODY, rpd_weapon_effect);
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon_effect);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon_effect);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setErrorCallBack(partErrorCallBack, role);
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
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			EventManager.dispatchEvent(AvatarEvent.AVATAR_CHANGE, role,RenderUnitID.WEAPON);
		}
		
		/**
		 *更新副武器 
		 * 
		 */
		public static function updateDeputyWeapon(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_deputy_weapon : RenderParamData3D = avatarInfo.rpd_deputy_weapon;
			if (rpd_deputy_weapon != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
				var ru : RenderUnit3D;
				var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						ru = role.avatar.addRenderUnitToComposite(RenderUnitType.BODY, RenderUnitID.BODY, rpd_deputy_weapon);
						//						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputy_weapon);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputy_weapon);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role.isMainChar)
					{
						//						ru.entityGlass = true;
					}
					else
					{
						ru.entityGlass = false;
					}
					ru.useLight = true;
					ru.useFog = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			}
			
			role.avatar.removeRenderUnitsByType(RenderUnitType.DEPUTY_WEAPON_EFFECT);
			var rpd_deputyWeapon_effect : RenderParamData3D = avatarInfo.rpd_deputyWeapon_effect;
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
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			EventManager.dispatchEvent(AvatarEvent.AVATAR_CHANGE, role,RenderUnitID.DEPUTY_WEAPON);
		}
		
		/**
		 *更新战旗 
		 * @param role
		 * 
		 */
		public static function updateFlag(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var ru : RenderUnit3D;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rud_zhanqi : RenderParamData3D= avatarInfo.zhanqiMode;
			
			if (rud_zhanqi != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.ZHANQI, RenderUnitID.ZHANQI);
				if (rpd_body)
				{
					if (rpd_body.animatorSourchPath)
					{
						//						ru = role.avatar.addRenderUnitToComposite(RenderUnitType.BODY, RenderUnitID.BODY, rud_zhanqi);
						ru = role.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rud_zhanqi);
					}
					else
					{
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rud_zhanqi);
					}
				}
				if (ru)
				{
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role.isMainChar)
					{
						//						ru.entityGlass = true;
					}
					else
					{
						ru.entityGlass = false;
					}
					ru.useLight = true;
					ru.useFog = true;
					if (role.type != SceneCharType.DUMMY)
						ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.ZHANQI, RenderUnitID.ZHANQI);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.ZHANQI, RenderUnitID.ZHANQI);
			}
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			EventManager.dispatchEvent(AvatarEvent.AVATAR_CHANGE, role,RenderUnitID.ZHANQI);
		}
		
		/**
		 *更新坐骑 
		 * @param role
		 * 
		 */
		public static function updateMount(role:SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData3D = role.stateMachine.canShowRiding ? avatarInfo.rpd_mount : null;
			if (rpd_mount != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
				
				var objChild : BaseObjChild;
				var objChildDatas : Vector.<BaseObjChild>;
				var unitChild : RenderUnitChild;
				var unitChildDatas : Vector.<RenderUnitChild>;
				if (avatarInfo.rpd_body)
				{
					//将坐骑头顶的绑点子部件转到body上
					objChildDatas = role.getChildDatasByName(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_name_01);
					for each (objChild in objChildDatas)
					{
						role.addObjChildDataToUnitChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, objChild);
					}
					unitChildDatas = role.avatar.getUnitChildDatasByName(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_name_01);
					for each (unitChild in unitChildDatas)
					{
						role.avatar.addUnitChildData(RenderUnitType.BODY, RenderUnitID.BODY, unitChild);
					}
				}
				
				var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_mount);
				if (rpd_mount.animatorSourchPath)
				{
					ru.addUnitAtComposite(ru);
				}
				else
				{
					ru.removeUnitChild(ru);
				}
				ru.defalutStatus = RoleActionType.IDLE;
				ru.setAddedCallBack(partAddedCallBack, role);
				ru.setErrorCallBack(partErrorCallBack, role);
				if (role.isMainChar)
				{
					//					ru.entityGlass = true;
				}
				else
				{
					ru.entityGlass = false;
				}
				ru.useLight = true;
				ru.useFog = true;
				if (role.type != SceneCharType.DUMMY)
				{
					ru.castsShadows = true;
					var useVolume : Boolean = getUseVolume(avatarInfo.mountResID);
					//					var isWheel : Boolean = getIsWheel(avatarInfo.mountResID);
					role.setRenderUseVolume(RenderUnitType.MOUNT, RenderUnitID.MOUNT, useVolume);
					role.isWheel = false;
				}
				role.avatar.applySyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
				
				var ref : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref.setParams(avatarInfo.mountResID, avatarInfo.mountAnimatResID);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref);
				updateBody(role);
				
				if (role.avatar.hasIDRenderUnit(RenderUnitType.MOUNT, RenderUnitID.MOUNT))
				{
					//将body头顶的绑点子部件转到坐骑上
					objChildDatas = role.getChildDatasByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01);
					for each (objChild in objChildDatas)
					{
						role.addObjChildDataToUnitChild(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_name_01, objChild);
					}
					unitChildDatas = role.avatar.getUnitChildDatasByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01);
					for each (unitChild in unitChildDatas)
					{
						role.avatar.addUnitChildData(RenderUnitType.MOUNT, RenderUnitID.MOUNT, unitChild);
					}
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
				if ((role.stateMachine as RoleStateMachine).isRiding)
				{
					role.stateMachine.removeState(RoleStateType.CONTROL_RIDING);
					role.stateMachine.removeState(RoleStateType.CONTROL_MOUNT_RIDE);
				}
			}
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
		
		/**部件添加完成*/
		private static function partAddedCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			ru.removeAddedCallBack(partAddedCallBack);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			if (rpd_body)
			{
				if (role.avatar.hasIDRenderUnit(RenderUnitType.MOUNT, RenderUnitID.MOUNT))
				{
					if (ru.id == RenderUnitID.MOUNT)
					{
						if (role.headFace)
							role.headFace.setBodyRender(ru);
						updateRoleSimpleShadow(role);
					}
				}
				else
				{
					if (ru.id == RenderUnitID.BODY)
					{
						if (role.headFace)
							role.headFace.setBodyRender(ru);
						updateRoleSimpleShadow(role);
					}
				}
			}
			else
			{
				if (ru.id == RenderUnitID.EFFECT && role.headFace)
					role.headFace.setBodyRender(ru);
			}
		}
		
		/**部件添加错误*/
		private static function partErrorCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			//无模型时添加血条
			if (!ru.resReady && role.headFace)
			{
				role.headFace.setBodyRender(null);
			}
		}
		
		private static function getUseVolume(resId : String) : Boolean
		{
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(resId);
			if (avatarResConfig)
				return avatarResConfig.useVolume;
			return false;
		}
		
		/**
		 * 启用假的影子，比如用一个黑圈图，为了提高性能，就不用实时计算影子了。为了提高性能做的处理 
		 * @param role
		 * 
		 */		
		public static function updateRoleSimpleShadow(role : SceneRole) : void
		{
			if (DisplaySetUpManager.shadowLevel == 0)
			{
				var data : RoleData = RoleData(role.data);
				var avatarResConfig : AvatarResConfig;
				if (role.avatar.hasIDRenderUnit(RenderUnitType.MOUNT, RenderUnitID.MOUNT))
				{
					var mountRu : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT, true);
					if (mountRu)
					{
						role.addSimpleShadow(ClientConfig.getDynAlphaTexture("shadow"),0, mountRu.radius * simpleShadowBaseScale);
					}
				}
				else
				{
					var bodyRu : RenderUnit3D = role.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					if (bodyRu)
					{
						role.addSimpleShadow(ClientConfig.getDynAlphaTexture("shadow"),0, bodyRu.radius * simpleShadowBaseScale);
					}
				}
			}
			role.removeSimpleShadow();
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
		
		/**
		 *穿“效果方法类型特效” 
		 * @param role
		 * 
		 */
		public static function updateBodyMethodType(role : SceneRole):void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_method_type_effect : RenderParamData3D = avatarInfo.rpd_body_method_type_effect;
			if (rpd_method_type_effect != null)
			{
				var effectRu : RenderUnit3D = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_method_type_effect);
				effectRu.defalutStatus = RoleActionType.IDLE;
				effectRu.setAddedCallBack(partAddedCallBack, role);
				effectRu.setErrorCallBack(partErrorCallBack, role);
				effectRu.entityGlass = false;
				effectRu.useLight = false;
				effectRu.castsShadows = false;
				effectRu.repeat = 0;
				effectRu.play(0);
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY_METHOD_TYPE_EFFECT, RenderUnitID.BODY_METHOD_TYPE_EFFECT);
			}
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
		
		/**
		 *更新特效 
		 * @param role
		 * 
		 */
		public static function updateEffect(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_effect : RenderParamData3D = avatarInfo.rpd_effect;
			if (rpd_effect != null)
			{
				role.avatar.buildSyncInfo(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
				var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_effect);
				if (ru)
				{
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					ru.entityGlass = false;
					ru.useLight = false;
					ru.castsShadows = false;
					role.avatar.applySyncInfo(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			}
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
	}
}