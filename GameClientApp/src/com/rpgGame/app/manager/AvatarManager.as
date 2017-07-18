package com.rpgGame.app.manager
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;

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
			
		
			//这里其实是战魂的，后面修改掉
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
		
		/**
		 *更新战魂 
		 * @param role
		 * 
		 */
		public static function updateFightSoul(role:SceneRole):void
		{
			
		}
		
		/**
		 *更新坐骑 
		 * @param role
		 * 
		 */
		public static function updateMount(role:SceneRole):void
		{
			
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
	}
}