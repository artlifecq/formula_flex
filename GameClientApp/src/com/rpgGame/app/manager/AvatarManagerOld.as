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
	import com.rpgGame.coreData.cfg.FightsoulModeData;
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
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
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
	 *
	 * 换装管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 上午10:03:17
	 *
	 */
	public class AvatarManagerOld
	{
		private static const simpleShadowBaseScale : Number = 0.01;
		
		public static function updateAvatar(role : SceneRole,updataBuff:Boolean = true) : void
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
			updateZhanQiRole(role);
			//穿“效果方法类型特效”
			updateMethodTypeEffect(role);
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
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
			updateRoleSimpleShadow(role);
//			EventManager.dispatchEvent(AvatarEvent.EQUIP_CHANGE, role);
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
		}
		
		private static function getSecondStatus(type : String) : String
		{
			if (!type)
				return null;
			var actionHead : String = type.substr(0, type.length - 1);
			return actionHead + "5";
		}
		
		private static function getUseVolume(resId : String) : Boolean
		{
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(resId);
			if (avatarResConfig)
				return avatarResConfig.useVolume;
			return false;
		}
		
		/*private static function getIsWheel(resId : String) : Boolean
		{
		var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(resId);
		if (avatarResConfig)
		return avatarResConfig.isWheel;
		return false;
		}*/
		
		private static function updateBody(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rpd_mount : RenderParamData3D = role.stateMachine.canShowRiding ? avatarInfo.rpd_mount : null;
			if (rpd_body != null)
			{
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
			
			var rpd_body_effect : RenderParamData3D = avatarInfo.rpd_body_effect;
			if (rpd_body_effect != null)
			{
				//				ru = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_body_effect);
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
			
			//			role.avatar.removeRenderUnitsByType(RenderUnitType.BODY_EFFECTS);
			//			var rpd_body_effects : Vector.<RenderParamData3D> = rpd_mount ? avatarInfo.rpd_body_on_mount_effects : avatarInfo.rpd_body_effects;
			//			var bodyEffectBindBones : Array = rpd_mount ? avatarInfo.bodyEffectOnMountBindBones : avatarInfo.bodyEffectBindBones;
			//			if (rpd_body_effects != null)
			//			{
			//				var len : int = rpd_body_effects.length;
			//				for (var i : int = 0; i < len; i++)
			//				{
			//					var effectRu : RenderUnit3D = null;
			//					var rpd_effect : RenderParamData3D = rpd_body_effects[i];
			//					var effectBindBone : String = bodyEffectBindBones ? bodyEffectBindBones[i] : null;
			//					if (rpd_body)
			//					{
			//						if (effectBindBone)
			//						{
			//							if (rpd_body.animatorSourchPath)
			//							{
			//								effectRu = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, effectBindBone, rpd_effect);
			//							}
			//							else
			//							{
			//								effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, effectBindBone, rpd_effect);
			//							}
			//						}
			//						else
			//						{
			//							effectRu = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_effect);
			//						}
			//					}
			//					if (effectRu)
			//					{
			//						effectRu.defalutStatus = RoleActionType.IDLE;
			//						effectRu.setAddedCallBack(partAddedCallBack, role);
			//						effectRu.setErrorCallBack(partErrorCallBack, role);
			//						effectRu.entityGlass = false;
			//						effectRu.useLight = false;
			//						effectRu.castsShadows = false;
			//						effectRu.repeat = 0;
			//						effectRu.play(0);
			//					}
			//				}
			//			}
		}
		
		private static function updateHair(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_hair : RenderParamData3D = avatarInfo.rpd_hair;
			if (rpd_hair != null)
			{
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
		}
		
		private static function updateWeapon(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var ru : RenderUnit3D;
			var rpd_weapon : RenderParamData3D = avatarInfo.rpd_weapon;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			if (rpd_weapon != null)
			{
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
			
			//			role.avatar.removeRenderUnitsByType(RenderUnitType.WEAPON_EFFECTS);
			//			var rpd_weapon_effects : Vector.<RenderParamData3D> = avatarInfo.rpd_weapon_effects;
			//			var weaponEffectBindBones : Array = avatarInfo.weaponEffectBindBones;
			//			if (rpd_weapon_effects != null)
			//			{
			//				var len : int = rpd_weapon_effects.length;
			//				for (var i : int = 0; i < len; i++)
			//				{
			//					var effectRu : RenderUnit3D = null;
			//					var rpd_effect : RenderParamData3D = rpd_weapon_effects[i];
			//					var effectBindBone : String = weaponEffectBindBones[i];
			//					if (rpd_weapon)
			//					{
			//						if (effectBindBone)
			//						{
			//							effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.WEAPON, RenderUnitID.WEAPON, effectBindBone, rpd_effect);
			//						}
			//						else
			//						{
			//							effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.WEAPON, RenderUnitID.WEAPON, null, rpd_effect, 0);
			//						}
			//					}
			//					if (effectRu)
			//					{
			//						effectRu.defalutStatus = RoleActionType.IDLE;
			//						effectRu.setAddedCallBack(partAddedCallBack, role);
			//						effectRu.setErrorCallBack(partErrorCallBack, role);
			//						effectRu.entityGlass = false;
			//						effectRu.useLight = false;
			//						effectRu.castsShadows = false;
			//						effectRu.repeat = 0;
			//						effectRu.play(0);
			//					}
			//				}
			//			}
		}
		
		private static function updateDeputyWeapon(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_deputy_weapon : RenderParamData3D = avatarInfo.rpd_deputy_weapon;
			if (rpd_deputy_weapon != null)
			{
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
		}
		
		private static function updateMethodTypeEffect(role : SceneRole) : void
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
		}
		
		private static function updateEffect(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_effect : RenderParamData3D = avatarInfo.rpd_effect;
			if (rpd_effect != null)
			{
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
		}
		
		private static function updateMount(role : SceneRole) : void
		{
			role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData3D = role.stateMachine.canShowRiding ? avatarInfo.rpd_mount : null;
			if (rpd_mount != null)
			{
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
			}
		}
		
		/**创建战旗特效*/
		private static function updateZhanQiRole(role:SceneRole):void
		{
			role.avatar.buildSyncInfo(RenderUnitType.ZHANQI, RenderUnitID.ZHANQI);
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var ru : RenderUnit3D;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rud_zhanqi : RenderParamData3D= avatarInfo.zhanqiMode;
			
			if (rud_zhanqi != null)
			{
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
		
		/**
		 * 
		 * @param data
		 * @param isUseforAvatar
		 * @param isMountBlank
		 * @param updateBuff
		 * 
		 */
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
			var fightsoulModeID:String = "";
			var fightsoulEffectResId:String = "";
			var zhanqiResID:String = "";
			
			var bodyMethodTypeEffectResID : String = null;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(roleData.body);
			var mountModel :Q_horse = HorseConfigData.getMountDataById(roleData.mount);
			var fightsoulInfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(roleData.fightSoulLevel);
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
				
				if(fightsoulInfo)
				{
					fightsoulModeID = fightsoulInfo.q_mode;
					fightsoulEffectResId = fightsoulInfo.q_effect;
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
			
			roleData.avatarInfo.setBodyResID(bodyResID, animatResID);//1
			roleData.avatarInfo.hairResID = hairResID;//3
			roleData.avatarInfo.setMountResID(mountResID, mountAnimatResID);//9
			roleData.avatarInfo.bodyEffectID = bodyEffectResID;//2
			roleData.avatarInfo.bodyMethodTypeEffectResID = bodyMethodTypeEffectResID;//6
			roleData.avatarInfo.weaponResID = weaponResID;//4
			roleData.avatarInfo.weaponEffectID = weaponEffectResID;//4
			roleData.avatarInfo.weaponEffectScale = weaponEffectScale;//4
			roleData.avatarInfo.weaponEffectOffset = weaponEffectOffset;//4
			roleData.avatarInfo.deputyWeaponResID = deputyWeaponResID;//5
			roleData.avatarInfo.deputyWeaponEffectID = deputyWeaponEffectResID;//5
			roleData.avatarInfo.deputyWeaponEffectScale = deputyWeaponEffectScale;//5
			roleData.avatarInfo.deputyWeaponEffectOffset = deputyWeaponEffectOffset;//5
			roleData.avatarInfo.fightsoulResID=fightsoulModeID;//8
//			roleData.avatarInfo.fightsoulEffectResID= fightsoulEffectResId;//8
			roleData.avatarInfo.zhanqiResID = zhanqiResID;//7
		}
		
		/**
		 * 更新角色模型
		 * @param role
		 * @param isUseforAvatar 用于头像，不显示武器、坐骑等资源和特效
		 * @param isUseforRacing 用于赛马模型，不显示坐骑
		 *
		 */
		public static function callEquipmentChange(role : SceneRole, isUseforAvatar : Boolean = false, isMountBlank : Boolean = false, updateBuff : Boolean = true) : void
		{
			if (!role || !role.usable)
				return;
			var roleData : HeroData = role.data as HeroData;
			var animatResID : String = null;
			var bodyResID : String = null;
			var hairResID : String = null;
			var mountResID : String = null;
			var mountAnimatResID : String = null;
			//			var weaponResID : String = null;
			//			var weaponEffectResIDs : Array = null;
			//			var weaponEffectBindBones : Array = null;
			//			var deputyWeaponResID : String = null;
			var weaponResID : String = null;
			var weaponEffectResID : String = "";
			var weaponEffectScale : int = 0;
			var weaponEffectOffset : Vector3D = null;
			var deputyWeaponResID : String = null;
			var deputyWeaponEffectResID : String = "";
			var deputyWeaponEffectScale : int = 0;
			var deputyWeaponEffectOffset : Vector3D = null;
			
			var bodyEffectResID : String = null;
			var fightsoulModeID:String = "";
			var fightsoulEffectResId:String = "";
			var zhanqiResID:String = "";
			//			var bodyEffectResIDs : Array = null;
			//			var bodyEffectOnMountResIDs : Array = null;
			//			var bodyEffectBindBones : Array = null;
			//			var bodyEffectOnMountBindBones : Array = null;
			var bodyMethodTypeEffectResID : String = null;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(roleData.body);
			var mountModel :Q_horse = HorseConfigData.getMountDataById(roleData.mount);
			var fightsoulInfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(roleData.fightSoulLevel);
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
				//					if (roleData.sex)
				//						hairResID = hairRes.hairRes_man;
				//					else
				//						hairResID = hairRes.hairRes_woman;				
				
				
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
				
				if(fightsoulInfo)
				{
					fightsoulModeID = fightsoulInfo.q_mode;
					fightsoulEffectResId = fightsoulInfo.q_effect;
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
				
				if(zhanqiInfo)
				{
					zhanqiResID = zhanqiInfo.q_panel_show_id;
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
			roleData.avatarInfo.fightsoulResID=fightsoulModeID;
//			roleData.avatarInfo.fightsoulEffectResID= fightsoulEffectResId;
			roleData.avatarInfo.zhanqiResID = zhanqiResID;
			
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
					role.stateMachine.removeState(RoleStateType.CONTROL_MOUNT_RIDE);
				}
				else
				{
					updateAvatar(role, updateBuff);
				}
			}
		}
	}
}
