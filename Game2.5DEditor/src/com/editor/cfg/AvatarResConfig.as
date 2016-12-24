package com.editor.cfg
{
	import com.editor.data.ConfigDesc;


	/**
	 *
	 * 换装资源配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-16 下午2:30:12
	 *
	 */
	dynamic public class AvatarResConfig extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["dialogFaceMask"] = "半身像遮罩";
			configDesc.fieldTips["dialogFaceMask"] = "半身像遮罩";

			configDesc.fieldLabels["dialogFaceMaskX"] = "半身像遮罩X";
			configDesc.fieldTips["dialogFaceMaskX"] = "半身像遮罩X";

			configDesc.fieldLabels["dialogFaceMaskY"] = "半身像遮罩Y";
			configDesc.fieldTips["dialogFaceMaskY"] = "半身像遮罩Y";

			configDesc.fieldLabels["dialogFaceMaskS"] = "半身像遮罩S";
			configDesc.fieldTips["dialogFaceMaskS"] = "半身像遮罩S";

			configDesc.fieldLabels["dialogFaceMaskR"] = "半身像遮罩R";
			configDesc.fieldTips["dialogFaceMaskR"] = "半身像遮罩R";

			configDesc.fieldLabels["headFaceMask"] = "头像遮罩";
			configDesc.fieldTips["headFaceMask"] = "头像遮罩";

			configDesc.fieldLabels["headFaceMaskX"] = "头像遮罩X";
			configDesc.fieldTips["headFaceMaskX"] = "头像遮罩X";

			configDesc.fieldLabels["headFaceMaskY"] = "头像遮罩Y";
			configDesc.fieldTips["headFaceMaskY"] = "头像遮罩Y";

			configDesc.fieldLabels["headFaceMaskS"] = "头像遮罩S";
			configDesc.fieldTips["headFaceMaskS"] = "头像遮罩S";

			configDesc.fieldLabels["headFaceMaskR"] = "头像遮罩R";
			configDesc.fieldTips["headFaceMaskR"] = "头像遮罩R";

			configDesc.fieldLabels["baseWalkActionSpeed"] = "基础行走动作速度";
			configDesc.fieldTips["baseWalkActionSpeed"] = "基础行走动作速度";

			configDesc.fieldLabels["blendMaterialName"] = "混合材质名";
			configDesc.fieldTips["blendMaterialName"] = "混合材质名";

			configDesc.fieldLabels["blendTexture"] = "混合贴图";
			configDesc.fieldTips["blendTexture"] = "混合贴图";

			configDesc.fieldLabels["blendMaskTexture"] = "混合遮罩贴图";
			configDesc.fieldTips["blendMaskTexture"] = "混合遮罩贴图";

			configDesc.fieldLabels["blendRestoreMaskTexture"] = "混合还原遮罩贴图";
			configDesc.fieldTips["blendRestoreMaskTexture"] = "混合还原遮罩贴图";

			configDesc.fieldLabels["useVolume"] = "是否使用体积";
			configDesc.fieldTips["useVolume"] = "是否使用体积";

			configDesc.fieldLabels["idleEffect"] = "待机特效";
			configDesc.fieldTips["idleEffect"] = "待机特效";
		}

		public function AvatarResConfig()
		{
			super();
			this["res"] = "";
			this["dialogFaceMask"] = "";
			this["dialogFaceMaskX"] = 0;
			this["dialogFaceMaskY"] = 0;
			this["dialogFaceMaskS"] = 0;
			this["dialogFaceMaskR"] = 0;

			this["headFaceMask"] = "";
			this["headFaceMaskX"] = 0;
			this["headFaceMaskY"] = 0;
			this["headFaceMaskS"] = 0;
			this["headFaceMaskR"] = 0;
			this["baseWalkActionSpeed"] = 0;

			this["blendMaterialName"] = "";
			this["blendTexture"] = "";
			this["blendMaskTexture"] = "";
			this["blendRestoreMaskTexture"] = "";

			this["useVolume"] = false;
			this["idleEffect"] = "";

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

		public function get mDialogFaceMaskX() : int
		{
			return int(this["dialogFaceMaskX"]);
		}

		public function get mDialogFaceMaskY() : int
		{
			return int(this["dialogFaceMaskY"]);
		}

		public function get mDialogFaceMaskScale() : Number
		{
			return Number(this["dialogFaceMaskS"]);
		}

		public function get mDialogFaceMaskRotation() : int
		{
			return int(this["dialogFaceMaskR"]);
		}

		public function get mHeadFaceMaskX() : int
		{
			return int(this["headFaceMaskX"]);
		}

		public function get mHeadFaceMaskY() : int
		{
			return int(this["headFaceMaskY"]);
		}

		public function get mHeadFaceMaskScale() : Number
		{
			return Number(this["headFaceMaskS"]);
		}

		public function get mHeadFaceMaskRotation() : int
		{
			return int(this["headFaceMaskR"]);
		}

		public function get mBaseWalkActionSpeed() : int
		{
			return int(this["baseWalkActionSpeed"]);
		}

		public function get mBlendMaterialName() : String
		{
			return String(this["blendMaterialName"]);
		}

		public function get mBlendTexture() : String
		{
			return String(this["blendTexture"]);
		}

		public function get mBlendMaskTexture() : String
		{
			return String(this["blendMaskTexture"]);
		}

		public function get mBlendRestoreMaskTexture() : String
		{
			return String(this["blendRestoreMaskTexture"]);
		}

		public function get mUseVolume() : Boolean
		{
			return this["useVolume"] == true;
		}

		public function get mIdleEffect() : String
		{
			return String(this["idleEffect"]);
		}
	}
}
