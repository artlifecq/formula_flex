package game.rpgGame.login.scene
{
	import com.game.engine3D.scene.render.vo.RenderParamData;

	import game.rpgGame.login.ClientConfig;

	/**
	 *
	 * 换装信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午11:32:15
	 *
	 */
	public class AvatarInfo
	{
		private var _bodyResID : String = null;
		private var _rpd_body : RenderParamData;
		private var _weaponResID : String = null;
		private var _rpd_weapon : RenderParamData;
		private var _mountResID : String = null;
		private var _rpd_mount : RenderParamData;

		public function AvatarInfo()
		{
		}

		/**衣服换装资源*/
		public function set bodyResID(value : String) : void
		{
			if (_bodyResID == value)
				return;
			_bodyResID = value;
			if (_bodyResID)
			{
				_rpd_body = new RenderParamData(RenderUnitID.BODY, RenderUnitType.BODY, ClientConfig.getAvatar(_bodyResID));
				_rpd_body.mouseEnable = true;
				_rpd_body.clearSameType = true;
				_rpd_body.forceLoad = true;
			}
			else
			{
				_rpd_body = null;
				_bodyResID = null;
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
				_rpd_weapon = new RenderParamData(RenderUnitID.WEAPON, RenderUnitType.WEAPON, ClientConfig.getAvatar(_weaponResID));
				_rpd_weapon.mouseEnable = true;
				_rpd_weapon.clearSameType = true;
				_rpd_weapon.forceLoad = true;
			}
			else
			{
				_rpd_weapon = null;
				_weaponResID = null;
			}
		}

		/**坐骑换装资源ID*/
		public function set mountResID(value : String) : void
		{
			if (_mountResID == value)
				return;
			_mountResID = value;
			if (_mountResID)
			{
				_rpd_mount = new RenderParamData(RenderUnitID.MOUNT, RenderUnitType.MOUNT, ClientConfig.getAvatar(_mountResID));
				_rpd_mount.mouseEnable = true;
				_rpd_mount.clearSameType = true;
				_rpd_mount.forceLoad = true;
			}
			else
			{
				_rpd_mount = null;
				_mountResID = null;
			}
		}

		/**衣服换装资源*/
		public function get bodyResID() : String
		{
			return _bodyResID;
		}

		/**武器换装资源*/
		public function get weaponResID() : String
		{
			return _weaponResID;
		}

		/**坐骑换装资源*/
		public function get mountResID() : String
		{
			return _mountResID;
		}

		/**主体*/
		public function get rpd_body() : RenderParamData
		{
			return _rpd_body;
		}

		/**武器*/
		public function get rpd_weapon() : RenderParamData
		{
			return _rpd_weapon;
		}

		/**坐骑*/
		public function get rpd_mount() : RenderParamData
		{
			return _rpd_mount;
		}

		/**清空*/
		public function clear() : void
		{
			bodyResID = null;
			weaponResID = null;
			mountResID = null;
		}
	}
}
