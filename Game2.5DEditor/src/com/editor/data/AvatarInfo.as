package com.editor.data
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.enum.MaterialNameEnum;
	import com.game.engine3D.scene.render.vo.RenderParamData;

	/**
	 *
	 * 换装信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class AvatarInfo
	{
		private var _bodyResID : String = null;
		private var _bodyAnimatResID : String = null;
		private var _rpd_body : RenderParamData;
		private var _hairResID : String = null;
		private var _rpd_hair : RenderParamData;
		private var _weaponResID : String = null;
		private var _weaponEffectResIDs : Array = null;
		private var _weaponEffectBindBones : Array = null;
		private var _rpd_weapon_effects : Vector.<RenderParamData>;
		private var _rpd_weapon : RenderParamData;
		private var _deputyWeaponResID : String = null;
		private var _rpd_deputy_weapon : RenderParamData;
		private var _mountResID : String = null;
		private var _mountAnimatResID : String = null;
		private var _rpd_mount : RenderParamData;
		private var _effectResID : String = null;
		private var _rpd_effect : RenderParamData;
		private var _bodyMethodTypeEffectResID : String = null;
		private var _rpd_body_method_type_effect : RenderParamData;
		private var _bodyEffectResIDs : Array = null;
		private var _bodyEffectBindBones : Array = null;
		private var _rpd_body_effects : Vector.<RenderParamData>;

		public function AvatarInfo()
		{
		}

		/**衣服换装资源*/
		public function setBodyResID(body : String, animat : String) : void
		{
			if (_bodyResID == body && _bodyAnimatResID == animat)
				return;
			_bodyResID = body;
			_bodyAnimatResID = animat;
			if (_bodyResID)
			{
				_rpd_body = new RenderParamData(RenderUnitID.BODY, RenderUnitType.BODY, GlobalConfig.getAvatarFilePath(_bodyResID));
				if (_bodyAnimatResID)
					_rpd_body.animatorSourchPath = GlobalConfig.getAvatarFilePath(_bodyAnimatResID);
				else
					_rpd_body.animatorSourchPath = null;
				_rpd_body.mouseEnable = true;
				_rpd_body.clearSameType = false;
			}
			else
			{
				_rpd_body = null;
				_bodyResID = null;
				_bodyAnimatResID = null;
			}
		}

		/**头发换装资源ID*/
		public function set hairResID(value : String) : void
		{
			if (_hairResID == value)
				return;
			_hairResID = value;
			if (_hairResID)
			{
				_rpd_hair = new RenderParamData(RenderUnitID.HAIR, RenderUnitType.HAIR, GlobalConfig.getAvatarFilePath(_hairResID));
				_rpd_hair.mouseEnable = true;
				_rpd_hair.clearSameType = false;
			}
			else
			{
				_rpd_hair = null;
				_hairResID = null;
			}
		}

		/**武器换装特效资源ID*/
		public function setWeaponEffectResIDs(resIds : Array, bindBones : Array) : void
		{
			_weaponEffectResIDs = resIds;
			_weaponEffectBindBones = bindBones;
			if (_weaponEffectResIDs)
			{
				if (_rpd_weapon_effects)
				{
					_rpd_weapon_effects.length = 0;
				}
				else
				{
					_rpd_weapon_effects = new Vector.<RenderParamData>();
				}
				var len : int = _weaponEffectResIDs.length;
				for (var i : int = 0; i < len; i++)
				{
					var resId : String = _weaponEffectResIDs[i];
					if (resId)
					{
						var rpd_effect : RenderParamData = new RenderParamData(i + 1, RenderUnitType.WEAPON_EFFECTS, GlobalConfig.getEffectFilePath(resId));
						rpd_effect.mouseEnable = true;
						rpd_effect.clearSameType = false;
						_rpd_weapon_effects.push(rpd_effect);
					}
				}
			}
			else
			{
				_rpd_weapon_effects = null;
				_weaponEffectResIDs = null;
				_weaponEffectBindBones = null;
			}
		}

		/**武器换装资源ID*/
		public function set weaponResID(value : String) : void
		{
			if (_weaponResID == value)
				return;
			_weaponResID = value;
			if (_weaponResID)
			{
				_rpd_weapon = new RenderParamData(RenderUnitID.WEAPON, RenderUnitType.WEAPON, GlobalConfig.getAvatarFilePath(_weaponResID));
				_rpd_weapon.mouseEnable = true;
				_rpd_weapon.clearSameType = false;
			}
			else
			{
				_rpd_weapon = null;
				_weaponResID = null;
			}
		}

		/**副武器换装资源ID*/
		public function set deputyWeaponResID(value : String) : void
		{
			if (_deputyWeaponResID == value)
				return;
			_deputyWeaponResID = value;
			if (_deputyWeaponResID)
			{
				_rpd_deputy_weapon = new RenderParamData(RenderUnitID.DEPUTY_WEAPON, RenderUnitType.DEPUTY_WEAPON, GlobalConfig.getAvatarFilePath(_deputyWeaponResID));
				_rpd_deputy_weapon.mouseEnable = true;
				_rpd_deputy_weapon.clearSameType = false;
			}
			else
			{
				_rpd_deputy_weapon = null;
				_deputyWeaponResID = null;
			}
		}

		/**坐骑换装资源ID*/
		public function setMountResID(value : String, animat : String) : void
		{
			if (_mountResID == value && _mountAnimatResID == animat)
				return;
			_mountResID = value;
			_mountAnimatResID = animat;
			if (_mountResID)
			{
				_rpd_mount = new RenderParamData(RenderUnitID.MOUNT, RenderUnitType.MOUNT, GlobalConfig.getAvatarFilePath(_mountResID));
				if (_mountAnimatResID)
					_rpd_mount.animatorSourchPath = GlobalConfig.getAvatarFilePath(_mountAnimatResID);
				else
					_rpd_mount.animatorSourchPath = null;
				_rpd_mount.mouseEnable = true;
				_rpd_mount.clearSameType = false;
			}
			else
			{
				_rpd_mount = null;
				_mountResID = null;
				_mountAnimatResID = null;
			}
		}

		/**身体换装效果方法类型特效资源ID*/
		public function set bodyMethodTypeEffectResID(value : String) : void
		{
			_bodyMethodTypeEffectResID = value;
			if (_bodyMethodTypeEffectResID)
			{
				_rpd_body_method_type_effect = new RenderParamData(RenderUnitID.BODY_METHOD_TYPE_EFFECT, RenderUnitType.BODY_METHOD_TYPE_EFFECT, GlobalConfig.getEffectFilePath(_bodyMethodTypeEffectResID));
				_rpd_body_method_type_effect.mouseEnable = true;
				_rpd_body_method_type_effect.clearSameType = false;
				_rpd_body_method_type_effect.isEffectMethodType = true;
				_rpd_body_method_type_effect.effectMethodMaterialNames = [MaterialNameEnum.equip];
			}
			else
			{
				_rpd_body_method_type_effect = null;
				_bodyMethodTypeEffectResID = null;
			}
		}

		public function set effectResID(value : String) : void
		{
			_effectResID = value;
			if (_effectResID)
			{
				_rpd_effect = new RenderParamData(RenderUnitID.EFFECT, RenderUnitType.EFFECT, GlobalConfig.getEffectFilePath(_effectResID));
				_rpd_effect.mouseEnable = true;
				_rpd_effect.clearSameType = false;
			}
			else
			{
				_rpd_effect = null;
				_effectResID = null;
			}
		}

		/**身体换装特效资源ID*/
		public function setBodyEffectResIDs(resIds : Array, bindBones : Array) : void
		{
			_bodyEffectResIDs = resIds;
			_bodyEffectBindBones = bindBones;
			if (_bodyEffectResIDs)
			{
				if (_rpd_body_effects)
				{
					_rpd_body_effects.length = 0;
				}
				else
				{
					_rpd_body_effects = new Vector.<RenderParamData>();
				}
				var len : int = _bodyEffectResIDs.length;
				for (var i : int = 0; i < len; i++)
				{
					var resId : String = _bodyEffectResIDs[i];
					if (resId)
					{
						var rpd_effect : RenderParamData = new RenderParamData(i + 1, RenderUnitType.BODY_EFFECTS, GlobalConfig.getEffectFilePath(resId));
						rpd_effect.mouseEnable = true;
						rpd_effect.clearSameType = false;
						_rpd_body_effects.push(rpd_effect);
					}
				}
			}
			else
			{
				_rpd_body_effects = null;
				_bodyEffectResIDs = null;
				_bodyEffectBindBones = null;
			}
		}

		/**衣服换装资源*/
		public function get bodyResID() : String
		{
			return _bodyResID;
		}

		/**头发换装资源*/
		public function get hairResID() : String
		{
			return _hairResID;
		}

		/**武器换装特效资源*/
		public function get weaponEffectResIDs() : Array
		{
			return _weaponEffectResIDs;
		}

		public function get weaponEffectBindBones() : Array
		{
			return _weaponEffectBindBones;
		}

		/**身体换装特效资源*/
		public function get bodyEffectResIDs() : Array
		{
			return _bodyEffectResIDs;
		}

		public function get bodyEffectBindBones() : Array
		{
			return _bodyEffectBindBones;
		}

		/**身体换装效果方法类型特效资源*/
		public function get bodyMethodTypeEffectResID() : String
		{
			return _bodyMethodTypeEffectResID;
		}

		/**武器换装资源*/
		public function get weaponResID() : String
		{
			return _weaponResID;
		}

		/**副武器换装资源*/
		public function get deputyWeaponResID() : String
		{
			return _deputyWeaponResID;
		}

		/**坐骑换装资源*/
		public function get mountResID() : String
		{
			return _mountResID;
		}

		public function get effectResID() : String
		{
			return _effectResID;
		}

		/**换装动画资源*/
		public function get bodyAnimatResID() : String
		{
			return _bodyAnimatResID;
		}

		/**坐骑换装动画资源*/
		public function get mountAnimatResID() : String
		{
			return _mountAnimatResID;
		}

		/**主体*/
		public function get rpd_body() : RenderParamData
		{
			return _rpd_body;
		}

		/**头发*/
		public function get rpd_hair() : RenderParamData
		{
			return _rpd_hair;
		}

		/**武器*/
		public function get rpd_weapon() : RenderParamData
		{
			return _rpd_weapon;
		}

		/**副武器*/
		public function get rpd_deputy_weapon() : RenderParamData
		{
			return _rpd_deputy_weapon;
		}

		/**坐骑*/
		public function get rpd_mount() : RenderParamData
		{
			return _rpd_mount;
		}

		/**身体效果方法类型特效*/
		public function get rpd_body_method_type_effect() : RenderParamData
		{
			return _rpd_body_method_type_effect;
		}

		/**身体特效*/
		public function get rpd_body_effects() : Vector.<RenderParamData>
		{
			return _rpd_body_effects;
		}

		/**武器特效*/
		public function get rpd_weapon_effects() : Vector.<RenderParamData>
		{
			return _rpd_weapon_effects;
		}

		/**特效*/
		public function get rpd_effect() : RenderParamData
		{
			return _rpd_effect;
		}

		/**清空*/
		public function clear() : void
		{
			setBodyResID(null, null);
			hairResID = null;
			weaponResID = null;
			deputyWeaponResID = null;
			setMountResID(null, null);
			setWeaponEffectResIDs(null, null);
			bodyMethodTypeEffectResID = null;
			setBodyEffectResIDs(null, null);
			effectResID = null;
		}
	}
}
