package game.rpgGame.login.scene
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.BaseObjChild;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.scene.render.vo.RenderUnitChild;
	
	import flash.geom.Vector3D;
	
	import game.rpgGame.login.data.AvatarInfo;
	import game.rpgGame.login.data.BoneNameEnum;
	import game.rpgGame.login.data.RoleData;
	import game.rpgGame.login.state.RoleStateType;
	
	/**
	 *
	 * 换装管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 上午10:03:17
	 *
	 */
	public class AvatarManager
	{
		private static const simpleShadowBaseScale : Number = 0.01;
		
		public static function updateAvatar(role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			
			var objChild : BaseObjChild;
			var objChildDatas : Vector.<BaseObjChild>;
			var unitChild : RenderUnitChild;
			var unitChildDatas : Vector.<RenderUnitChild>;
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
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
			
			role.avatar.secondStatusGetter = getSecondStatus;
			role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
			role.avatar.buildSyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
			role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
			role.avatar.buildSyncInfo(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			
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
			//穿“效果方法类型特效”
			updateMethodTypeEffect(role);
			
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
			
			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
		}
		
		
		private static function getSecondStatus(type : String) : String
		{
			if (!type)
				return null;
			var actionHead : String = type.substr(0, type.length - 1);
			return actionHead + "5";
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
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rpd_mount : RenderParamData3D =  null;
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
						//ru.setPickDummyEnable(true, BoneNameEnum.c_0_body_01); //目前游戏中只是英雄需要这么做,只有英雄是骨骼分离的,绑点美术没有给中心绑点,先用身体的。
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
						ru.entityGlass = true;
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
							var useVolume : Boolean = false;
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
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
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
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
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
			
			var rpd_weapon_effect : RenderParamData3D = avatarInfo.rpd_weapon_effect;
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
						ru.entityGlass = true;
					else
						ru.entityGlass = false;
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
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData3D =  null;
			if (rpd_mount != null)
			{
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
					ru.entityGlass = true;
				else
					ru.entityGlass = false;
				ru.useLight = true;
				ru.useFog = true;
				if (role.type != SceneCharType.DUMMY)
				{
					ru.castsShadows = true;
					var useVolume : Boolean = false;
					//					var isWheel : Boolean = getIsWheel(avatarInfo.mountResID);
					role.setRenderUseVolume(RenderUnitType.MOUNT, RenderUnitID.MOUNT, useVolume);
					role.isWheel = false;
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
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			if (rpd_body)
			{
				if (role.avatar.hasIDRenderUnit(RenderUnitType.MOUNT, RenderUnitID.MOUNT))
				{
					if (ru.id == RenderUnitID.MOUNT)
					{
					/*	if (role.headFace)
							role.headFace.setBodyRender(ru);
						if(role.attackFace)
							role.attackFace.setBodyRender(ru);
						updateRoleSimpleShadow(role);*/
					}
				}
				else
				{
					if (ru.id == RenderUnitID.BODY)
					{
						/*if (role.headFace)
							role.headFace.setBodyRender(ru);
						if(role.attackFace)
							role.attackFace.setBodyRender(ru);
						updateRoleSimpleShadow(role);*/
					}
				}
			}
			else
			{
				/*if (ru.id == RenderUnitID.EFFECT && role.headFace)
					role.headFace.setBodyRender(ru);*/
			}
		}
		
		/**部件添加错误*/
		private static function partErrorCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			//无模型时添加血条
		/*	if (!ru.resReady && role.headFace)
			{
				role.headFace.setTemporary();
			}*/
		}
	}
}


