package com.editor.cfg
{

	/**
	 *
	 * 换装文件资源配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-16 下午2:30:12
	 *
	 */
	public class AvatarFileResConfig extends ConfigData
	{
		public static var avatarFileKinds : Array = [];

		public function AvatarFileResConfig()
		{
			super();
			this["res"] = "";
			this["hairRes"] = "";
			this["weaponRes"] = "";
			this["mountRes"] = "";
			this["effectRes"] = "";
			this["animatRes"] = "";
			majorKey = "res";
		}

		public function get mRes() : String
		{
			return this["res"];
		}

		public function set mRes(value : String) : void
		{
			this["res"] = value;
		}

		public function get mHairRes() : String
		{
			return this["hairRes"];
		}

		public function set mHairRes(value : String) : void
		{
			this["hairRes"] = value;
		}

		public function get mWeaponRes() : String
		{
			return this["weaponRes"];
		}

		public function set mWeaponRes(value : String) : void
		{
			this["weaponRes"] = value;
		}

		public function get mMountRes() : String
		{
			return this["mountRes"];
		}

		public function set mMountRes(value : String) : void
		{
			this["mountRes"] = value;
		}

		public function get mEffectRes() : String
		{
			return this["effectRes"];
		}

		public function set mEffectRes(value : String) : void
		{
			this["effectRes"] = value;
		}

		public function get mAnimatRes() : String
		{
			return this["animatRes"];
		}

		public function set mAnimatRes(value : String) : void
		{
			this["animatRes"] = value;
		}
	}
}
