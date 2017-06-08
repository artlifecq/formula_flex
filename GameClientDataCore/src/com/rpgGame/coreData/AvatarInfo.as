package com.rpgGame.coreData
{
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.geom.Vector3D;
	
	/**
	 *
	 * 换装信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class AvatarInfo
	{
		private var _priority:int;
		
		private var _bodyResID : String = null;
		private var _bodyAnimatResID : String = null;
		private var _rpd_body : RenderParamData3D;
		
		private var _bodyEffectID : String = null;
		private var _rpd_body_effect : RenderParamData3D;
		
		private var _hairResID : String = null;
		private var _rpd_hair : RenderParamData3D;
		
		
		private var _weaponResID : String = null;
		private var _rpd_weapon : RenderParamData3D;
		
		private var _weaponEffectID : String = null;
		private var _weaponEffectScale : int = 0;
		private var _weaponEffectOffset : Vector3D = null;
		private var _rpd_weapon_effect : RenderParamData3D;
		
		private var _deputyWeaponResID : String = null;
		private var _rpd_deputy_weapon : RenderParamData3D;
		
		private var _deputyWeaponEffectID : String = null;
		private var _deputyWeaponEffectScale : int = 0;
		private var _deputyWeaponEffectOffset : Vector3D = null;
		private var _rpd_deputyWeapon_effect : RenderParamData3D;
		
		private var _mountResID : String = null;
		private var _mountAnimatResID : String = null;
		private var _rpd_mount : RenderParamData3D;
		
		private var _effectResID : String = null;
		private var _rpd_effect : RenderParamData3D;
		
		private var _bodyMethodTypeEffectResID:String = null;
		private var _rpd_body_method_type_effect : RenderParamData3D;
		
		private var _fightsoulResID:String = null;
		private var _fightsoulMode:RenderParamData3D;
		
		private var _fightsoulEffectResID:String = null;
		private var _fightsoulEffectMode:RenderParamData3D;
		
		private var _zhanqiEffResID:String=null;
		private var _zhanqiEffMode:RenderParamData3D;
		
		public function AvatarInfo(priority:int=100)
		{
			_priority = priority;
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
				_rpd_body = new RenderParamData3D(RenderUnitID.BODY, RenderUnitType.BODY, ClientConfig.getAvatar(_bodyResID));
				if (_bodyAnimatResID)
					_rpd_body.animatorSourchPath = ClientConfig.getAvatar(_bodyAnimatResID);
				else
					_rpd_body.animatorSourchPath = null;
				_rpd_body.mouseEnable = true;
				_rpd_body.clearSameType = false;
				_rpd_body.priority = _priority;
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
				_rpd_hair = new RenderParamData3D(RenderUnitID.HAIR, RenderUnitType.HAIR, ClientConfig.getAvatar(_hairResID));
				_rpd_hair.mouseEnable = true;
				_rpd_hair.clearSameType = false;
				_rpd_hair.priority = _priority;
			}
			else
			{
				_rpd_hair = null;
				_hairResID = null;
			}
		}
		
		/**武器换装特效资源ID*/
		public function set weaponEffectID(value : String) : void
		{
			if (_weaponEffectID == value)
				return;
			_weaponEffectID = value;
			if (_weaponEffectID)
			{
				_rpd_weapon_effect = new RenderParamData3D(RenderUnitID.WEAPON_EFFECT, RenderUnitType.WEAPON_EFFECT, ClientConfig.getEffect(_weaponEffectID));
				_rpd_weapon_effect.mouseEnable = false;
				_rpd_weapon_effect.clearSameType = false;
				_rpd_weapon_effect.priority = _priority;
			}
			else
			{
				_rpd_weapon_effect = null;
				_weaponEffectID = null;
			}
		}
		
		/**武器换装特效资源ID*/
		public function set deputyWeaponEffectID(value : String) : void
		{
			if (_deputyWeaponEffectID == value)
				return;
			_deputyWeaponEffectID = value;
			if (_deputyWeaponEffectID)
			{
				_rpd_deputyWeapon_effect = new RenderParamData3D(RenderUnitID.DEPUTY_WEAPON_EFFECT, RenderUnitType.DEPUTY_WEAPON_EFFECT, ClientConfig.getEffect(_deputyWeaponEffectID));
				_rpd_deputyWeapon_effect.mouseEnable = false;
				_rpd_deputyWeapon_effect.clearSameType = false;
				_rpd_deputyWeapon_effect.priority = _priority;
			}
			else
			{
				_rpd_deputyWeapon_effect = null;
				_deputyWeaponEffectID = null;
			}
		}
		
		/**身体换装特效资源ID*/
		public function set bodyEffectID(value : String) : void
		{
			if (_bodyEffectID == value)
				return;
			_bodyEffectID = value;
			if (_bodyEffectID)
			{
				_rpd_body_effect = new RenderParamData3D(RenderUnitID.BODY_EFFECT, RenderUnitType.BODY_EFFECT, ClientConfig.getEffect(_bodyEffectID));
				_rpd_body_effect.mouseEnable = false;
				_rpd_body_effect.clearSameType = false;
				_rpd_body_effect.priority = _priority;
			}
			else
			{
				_rpd_body_effect = null;
				_bodyEffectID = null;
			}
		}
		
		public function set bodyMethodTypeEffectResID(value : String):void
		{
			if (_bodyMethodTypeEffectResID == value)
				return;
			_bodyMethodTypeEffectResID = value;
			if (_bodyMethodTypeEffectResID)
			{
				_rpd_body_method_type_effect = new RenderParamData3D(RenderUnitID.BODY_METHOD_TYPE_EFFECT, RenderUnitType.BODY_METHOD_TYPE_EFFECT, ClientConfig.getEffect(_bodyMethodTypeEffectResID));
				_rpd_body_method_type_effect.mouseEnable = false;
				_rpd_body_method_type_effect.clearSameType = false;
				_rpd_body_method_type_effect.priority = _priority;
			}
			else
			{
				_rpd_body_method_type_effect = null;
				_bodyMethodTypeEffectResID = null;
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
				_rpd_weapon = new RenderParamData3D(RenderUnitID.WEAPON, RenderUnitType.WEAPON, ClientConfig.getAvatar(_weaponResID));
				_rpd_weapon.mouseEnable = true;
				_rpd_weapon.clearSameType = false;
				_rpd_weapon.priority = _priority;
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
				_rpd_deputy_weapon = new RenderParamData3D(RenderUnitID.DEPUTY_WEAPON, RenderUnitType.DEPUTY_WEAPON, ClientConfig.getAvatar(_deputyWeaponResID));
				_rpd_deputy_weapon.mouseEnable = true;
				_rpd_deputy_weapon.clearSameType = false;
				_rpd_deputy_weapon.priority = _priority;
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
				_rpd_mount = new RenderParamData3D(RenderUnitID.MOUNT, RenderUnitType.MOUNT, ClientConfig.getAvatar(_mountResID));
				if (_mountAnimatResID)
					_rpd_mount.animatorSourchPath = ClientConfig.getAvatar(_mountAnimatResID);
				else
					_rpd_mount.animatorSourchPath = null;
				_rpd_mount.mouseEnable = true;
				_rpd_mount.clearSameType = false;
				_rpd_mount.priority = _priority;
			}
			else
			{
				_rpd_mount = null;
				_mountResID = null;
				_mountAnimatResID = null;
			}
		}
		/**战魂换装资源ID*/
		public function setFightSoulResID(value : String) : void
		{
			if (_fightsoulResID == value)
				return;
			_fightsoulResID = value;
			if (_fightsoulResID!=null&&_fightsoulResID!="")
			{
				_fightsoulMode = new RenderParamData3D(RenderUnitID.FIGHTSOUL, RenderUnitType.FIGHTSOUL, ClientConfig.getFightSoul(_fightsoulResID));
				_fightsoulMode.mouseEnable = true;
				_fightsoulMode.clearSameType = false;
			}
			else
			{
				_fightsoulMode = null;
				_fightsoulResID = null;
			}
		}
		
		public function set fightSoulefffectID(value:String):void
		{
			if (_fightsoulEffectResID == value)
				return;
			_fightsoulEffectResID = value;
			if (_fightsoulEffectResID!=null&&_fightsoulEffectResID!="")
			{
				_fightsoulEffectMode = new RenderParamData3D(RenderUnitID.FIGHTSOUL_EFFECT, RenderUnitType.FIGHTSOUL_EFFECT, ClientConfig.getEffect(_fightsoulEffectResID));
				_fightsoulEffectMode.mouseEnable = true;
				_fightsoulEffectMode.clearSameType = false;
			}
			else
			{
				_fightsoulEffectMode = null;
				_fightsoulEffectResID = null;
			}
		}
		
		/**战旗换装资源*/
		public function set zhanqiSouleeffId(value:String):void
		{
			if(_zhanqiEffResID == value) return;
			_zhanqiEffResID = value;
			if(_zhanqiEffResID != null && _zhanqiEffResID != "")
			{
				_zhanqiEffMode = new RenderParamData3D(RenderUnitID.ZHANQI_EFFECT, RenderUnitType.ZHANQI_EFF, ClientConfig.getEffect(_zhanqiEffResID));
				_zhanqiEffMode.mouseEnable = false;
				_zhanqiEffMode.clearSameType = false;
			}
			else
			{
				_zhanqiEffMode = null;
				_zhanqiEffResID = null;
			}
		}
		
		/**特效换装资源ID*/
		public function set effectResID(value : String) : void
		{
			if (_effectResID == value)
				return;
			_effectResID = value;
			if (_effectResID)
			{
				_rpd_effect = new RenderParamData3D(RenderUnitID.EFFECT, RenderUnitType.EFFECT, ClientConfig.getEffect(_effectResID));
				_rpd_effect.mouseEnable = true;
				_rpd_effect.clearSameType = false;
				_rpd_effect.priority = _priority;
			}
			else
			{
				_rpd_effect = null;
				_effectResID = null;
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
		
		public function set weaponEffectScale(value : int) : void
		{
			_weaponEffectScale = value;
		}
		
		/**武器换装特效缩放*/
		public function get weaponEffectScale() : int
		{
			return _weaponEffectScale;
		}
		
		public function set weaponEffectOffset(value : Vector3D) : void
		{
			_weaponEffectOffset = value;
		}
		
		/**武器换装特效偏移*/
		public function get weaponEffectOffset() : Vector3D
		{
			return _weaponEffectOffset;
		}
		
		/**武器换装特效资源*/
		public function get weaponEffectID() : String
		{
			return _weaponEffectID;
		}
		
		public function set deputyWeaponEffectScale(value : int) : void
		{
			_deputyWeaponEffectScale = value;
		}
		
		/**武器换装特效缩放*/
		public function get deputyWeaponEffectScale() : int
		{
			return _deputyWeaponEffectScale;
		}
		
		public function set deputyWeaponEffectOffset(value : Vector3D) : void
		{
			_deputyWeaponEffectOffset = value;
		}
		
		/**武器换装特效偏移*/
		public function get deputyWeaponEffectOffset() : Vector3D
		{
			return _deputyWeaponEffectOffset;
		}
		
		/**武器换装特效资源*/
		public function get deputyWeaponEffectID() : String
		{
			return _deputyWeaponEffectID;
		}
		
		/**身体换装特效资源*/
		public function get bodyEffectID() : String
		{
			return _bodyEffectID;
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
		
		/**特效换装资源*/
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
		public function get rpd_body() : RenderParamData3D
		{
			return _rpd_body;
		}
		
		/**头发*/
		public function get rpd_hair() : RenderParamData3D
		{
			return _rpd_hair;
		}
		
		/**武器特效*/
		public function get rpd_weapon_effect() : RenderParamData3D
		{
			return _rpd_weapon_effect;
		}
		
		/**副武器特效*/
		public function get rpd_deputyWeapon_effect() : RenderParamData3D
		{
			return _rpd_deputyWeapon_effect;
		}
		
		/**身体特效*/
		public function get rpd_body_effect() : RenderParamData3D
		{
			return _rpd_body_effect;
		}
		
		/**武器*/
		public function get rpd_weapon() : RenderParamData3D
		{
			return _rpd_weapon;
		}
		
		/**副武器*/
		public function get rpd_deputy_weapon() : RenderParamData3D
		{
			return _rpd_deputy_weapon;
		}
		
		/**坐骑*/
		public function get rpd_mount() : RenderParamData3D
		{
			return _rpd_mount;
		}
		
		/**特效*/
		public function get rpd_effect() : RenderParamData3D
		{
			return _rpd_effect;
		}
		
		public function get rpd_body_method_type_effect():RenderParamData3D
		{
			return _rpd_body_method_type_effect;
		}
		
		public function  get fightsoulMode():RenderParamData3D
		{
			return _fightsoulMode;
		}
		
		public function get fightsoulEffect():RenderParamData3D
		{
			return _fightsoulEffectMode;
		}
		/**清空*/
		public function clear() : void
		{
			setBodyResID(null, null);
			hairResID = null;
			weaponResID = null;
			deputyWeaponResID = null;
			setMountResID(null, null);
			setFightSoulResID(null);
			fightSoulefffectID = null;
			weaponEffectID = null;
			weaponEffectScale = 0;
			weaponEffectOffset = null;
			deputyWeaponEffectID = null;
			deputyWeaponEffectScale = 0;
			deputyWeaponEffectOffset = null;
			effectResID = null;
			bodyEffectID = null;
		}
		
		public function clone() : AvatarInfo {
			var info : AvatarInfo = new AvatarInfo();
			info._bodyAnimatResID = this._bodyAnimatResID;
			info._bodyEffectID = this._bodyEffectID;
			info._bodyMethodTypeEffectResID = this._bodyMethodTypeEffectResID;
			info._bodyResID = this._bodyResID;
			info._deputyWeaponEffectID = this._deputyWeaponEffectID;
			info._deputyWeaponEffectOffset = this._deputyWeaponEffectOffset;
			info._deputyWeaponEffectScale = this._deputyWeaponEffectScale;
			info._deputyWeaponResID = this._deputyWeaponResID;
			info._effectResID = this._effectResID;
			info._hairResID = this._hairResID;
			info._mountAnimatResID = this._mountAnimatResID;
			info._mountResID = this._mountResID;
			info._rpd_body = this._rpd_body;
			info._rpd_body_effect = this._rpd_body_effect;
			info._rpd_body_method_type_effect = this._rpd_body_method_type_effect;
			info._rpd_deputy_weapon = this._rpd_deputy_weapon;
			info._rpd_deputyWeapon_effect = this._rpd_deputyWeapon_effect;
			info._rpd_effect = this._rpd_effect;
			info._rpd_hair = this._rpd_hair;
			info._rpd_mount = this._rpd_mount;
			info._rpd_weapon = this._rpd_weapon;
			info._rpd_weapon_effect = this._rpd_weapon_effect;
			info._weaponEffectID = this._weaponEffectID;
			info._weaponEffectOffset = this._weaponEffectOffset;
			info._weaponEffectScale = this._weaponEffectScale;
			info._weaponResID = this._weaponResID;
			info._fightsoulMode = this._fightsoulMode;
			info._fightsoulResID = this._fightsoulResID;
			return info;
		}
	}
}
