package com.editor.manager
{
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.data.AvatarInfo;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.enum.BoneNameEnum;
	import com.editor.events.AvatarEvent;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.editor.state.role.control.RidingStateReference;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	
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
		private static var _previewBodyRu : RenderUnit3D;

		public function AvatarManager()
		{
		}

		public static function updateAvatar(role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			if (role == SceneRoleManager.getInstance().previewEntity)
				_previewBodyRu = null;

			role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
			role.avatar.buildSyncInfo(RenderUnitType.HAIR, RenderUnitID.HAIR);
			role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);

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

			role.stateMachine.transition(RoleStateType.CONTROL_AVATAR);
			RoleStateUtil.updateRoleBaseWalkActionSpeed(role);
		}

		private static function getUseVolume(resId : String) : Boolean
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
			if (tabel)
			{
				var desc : ConfigDesc = tabel.getConfigDesc();
				var datas : Array = ConfigData.getCfgByFieldValue(desc, desc.majorKey, resId);
				if (datas.length > 0)
				{
					var avatarResConfig : AvatarResConfig = datas[0] as AvatarResConfig;
					return avatarResConfig.mUseVolume;
				}
			}
			return false;
		}

		private static function updateBody(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData3D = avatarInfo.rpd_body;
			var rpd_mount : RenderParamData3D = avatarInfo.rpd_mount;
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
						ru.setPickDummyEnable(true, BoneNameEnum.c_0_body_01); //目前游戏中只是英雄需要这么做,只有英雄是骨骼分离的,绑点美术没有给中心绑点,先用身体的。
						ru.addUnitAtComposite(ru);
					}
					ru.defalutStatus = RoleActionType.IDLE;
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.setErrorCallBack(partErrorCallBack, role);
					if (role == SceneRoleManager.getInstance().previewEntity)
					{
						ru.entityGlass = false;
					}
					else
					{
						ru.entityGlass = true;
					}
					ru.useLight = true;
					ru.castsShadows = true;
					if (role == SceneRoleManager.getInstance().scenePreviewEntity)
					{
						var useVolume : Boolean = false;
						if (!rpd_mount)
						{
							useVolume = getUseVolume(avatarInfo.bodyResID);
						}
						role.setRenderUseVolume(RenderUnitType.BODY, RenderUnitID.BODY, useVolume);
					}
					else
					{
						ru.showBounds = true;
					}
					role.avatar.applySyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			}

			role.avatar.removeRenderUnitsByType(RenderUnitType.BODY_EFFECTS);
			var rpd_body_effects : Vector.<RenderParamData3D> = avatarInfo.rpd_body_effects;
			var bodyEffectBindBones : Array = avatarInfo.bodyEffectBindBones;
			if (rpd_body_effects != null)
			{
				var len : int = rpd_body_effects.length;
				for (var i : int = 0; i < len; i++)
				{
					var effectRu : RenderUnit3D = null;
					var rpd_effect : RenderParamData3D = rpd_body_effects[i];
					var effectBindBone : String = bodyEffectBindBones[i];
					if (rpd_body)
					{
						if (effectBindBone)
						{
							if (rpd_body.animatorSourchPath)
							{
								effectRu = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, effectBindBone, rpd_effect);
							}
							else
							{
								effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, effectBindBone, rpd_effect);
							}
						}
						else
						{
							effectRu = role.avatar.addRenderUnitToUnit(RenderUnitType.BODY, RenderUnitID.BODY, rpd_effect);
						}
					}
					if (effectRu)
					{
						effectRu.defalutStatus = RoleActionType.IDLE;
						effectRu.setAddedCallBack(partAddedCallBack, role);
						effectRu.setErrorCallBack(partErrorCallBack, role);
						effectRu.entityGlass = false;
						effectRu.useLight = false;
						effectRu.castsShadows = false;
						effectRu.repeat = 0;
						effectRu.play(0);
					}
				}
			}
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
					if (role == SceneRoleManager.getInstance().previewEntity)
					{
						ru.entityGlass = false;
					}
					else
					{
						ru.entityGlass = true;
					}
					ru.useLight = true;
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
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_r_wq_01, rpd_weapon);
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
					if (role == SceneRoleManager.getInstance().previewEntity)
					{
						ru.entityGlass = false;
					}
					else
					{
						ru.entityGlass = true;
					}
					ru.useLight = true;
					ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			}

			role.avatar.removeRenderUnitsByType(RenderUnitType.WEAPON_EFFECTS);
			var rpd_weapon_effects : Vector.<RenderParamData3D> = avatarInfo.rpd_weapon_effects;
			var weaponEffectBindBones : Array = avatarInfo.weaponEffectBindBones;
			if (rpd_weapon_effects != null)
			{
				var len : int = rpd_weapon_effects.length;
				for (var i : int = 0; i < len; i++)
				{
					var effectRu : RenderUnit3D = null;
					var rpd_effect : RenderParamData3D = rpd_weapon_effects[i];
					var effectBindBone : String = weaponEffectBindBones[i];
					if (rpd_weapon)
					{
						if (effectBindBone)
						{
							if (rpd_weapon.animatorSourchPath)
							{
								effectRu = role.avatar.addRenderUnitToJoint(RenderUnitType.WEAPON, RenderUnitID.WEAPON, effectBindBone, rpd_effect);
							}
							else
							{
								effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.WEAPON, RenderUnitID.WEAPON, effectBindBone, rpd_effect);
							}
						}
						else
						{
							effectRu = role.avatar.addRenderUnitToUnit(RenderUnitType.WEAPON, RenderUnitID.WEAPON, rpd_effect);
						}
					}
					if (effectRu)
					{
						effectRu.defalutStatus = RoleActionType.IDLE;
						effectRu.setAddedCallBack(partAddedCallBack, role);
						effectRu.setErrorCallBack(partErrorCallBack, role);
						effectRu.entityGlass = false;
						effectRu.useLight = false;
						effectRu.castsShadows = false;
						effectRu.repeat = 0;
						effectRu.play(0);
					}
				}
			}
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
						ru = role.avatar.addRenderUnitToJoint(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.b_l_wq_01, rpd_deputy_weapon);
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
					if (role == SceneRoleManager.getInstance().previewEntity)
					{
						ru.entityGlass = false;
					}
					else
					{
						ru.entityGlass = true;
					}
					ru.useLight = true;
					ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.DEPUTY_WEAPON, RenderUnitID.DEPUTY_WEAPON);
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
				var ru : RenderUnit3D = ru = role.avatar.addRenderUnit(rpd_effect);
				ru.defalutStatus = RoleActionType.IDLE;
				ru.setAddedCallBack(partAddedCallBack, role);
				ru.setErrorCallBack(partErrorCallBack, role);
				ru.entityGlass = false;
				ru.useLight = false;
				ru.castsShadows = false;
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.EFFECT, RenderUnitID.EFFECT);
			}
		}

		private static function updateMount(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData3D = avatarInfo.rpd_mount;
			if (rpd_mount != null)
			{
				var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_mount);
				if (rpd_mount.animatorSourchPath)
				{
					ru.addUnitAtComposite(ru);
				}
				ru.defalutStatus = RoleActionType.IDLE;
				ru.setAddedCallBack(partAddedCallBack, role);
				ru.setErrorCallBack(partErrorCallBack, role);
				if (role == SceneRoleManager.getInstance().previewEntity)
				{
					ru.entityGlass = false;
				}
				else
				{
					ru.entityGlass = true;
				}
				ru.useLight = true;
				ru.castsShadows = true;
				if (role == SceneRoleManager.getInstance().scenePreviewEntity)
				{
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
			if (role == SceneRoleManager.getInstance().previewEntity)
			{
				if (ru.id == RenderUnitID.BODY)
				{
					_previewBodyRu = ru;
					EventManager.dispatchEvent(AvatarEvent.AVATAR_BODY_LOADED, role);
				}
				if (ru.id == RenderUnitID.EFFECT)
				{
					EventManager.dispatchEvent(AvatarEvent.AVATAR_EFFECT_LOADED, role);
				}
			}
		}

		/**部件添加错误*/
		private static function partErrorCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			trace(ru.renderParamData.sourcePath + "，" + ru.renderParamData.animatorSourchPath + "，换装资源错误！");
		}

		public static function getAnimationDuration(name : String) : int
		{
			if (_previewBodyRu)
				return _previewBodyRu.renderUnitData.getAnimationDuration(name);
			return 0;
		}

		public static function getRadius() : int
		{
			if (_previewBodyRu)
				return _previewBodyRu.radius;
			return 0;
		}

		public static function callEquipmentChange(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			if (avatarInfo.mountResID)
			{
				var ref : RidingStateReference = role.stateMachine.getReference(RidingStateReference) as RidingStateReference;
				ref.setParams(avatarInfo.mountResID, avatarInfo.mountAnimatResID);
				role.stateMachine.transition(RoleStateType.CONTROL_RIDING, ref);
			}
			else
			{
				if (role.stateMachine.isRiding)
					role.stateMachine.removeState(RoleStateType.CONTROL_RIDING);
				else
					updateAvatar(role);
			}
		}
	}
}
