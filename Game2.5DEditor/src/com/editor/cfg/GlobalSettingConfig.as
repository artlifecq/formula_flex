package com.editor.cfg
{
	import com.editor.data.ConfigDesc;

	/**
	 *
	 * 全局设置配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-29 下午2:30:12
	 *
	 */
	public class GlobalSettingConfig extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["glassPassColor"] = "玻璃效果颜色";
			configDesc.fieldTips["glassPassColor"] = "玻璃效果颜色";
			configDesc.formatMapping["glassPassColor"] = "color";

			configDesc.fieldLabels["cameraOffsetY"] = "摄像机Y偏移";
			configDesc.fieldTips["cameraOffsetY"] = "摄像机Y偏移";

			configDesc.fieldLabels["cameraXDeg"] = "摄像机转角";
			configDesc.fieldTips["cameraXDeg"] = "摄像机转角";

			configDesc.fieldLabels["cameraYDeg"] = "摄像机转角";
			configDesc.fieldTips["cameraYDeg"] = "摄像机转角";

			configDesc.fieldLabels["cameraDistance"] = "摄像机距离";
			configDesc.fieldTips["cameraDistance"] = "摄像机距离";

			configDesc.fieldLabels["cameraMouseDragSpeed"] = "摄像机拖拽速度";
			configDesc.fieldTips["cameraMouseDragSpeed"] = "摄像机鼠标拖拽速度";

			configDesc.fieldLabels["cameraBlockMinDistance"] = "智能摄像机最小距离";
			configDesc.fieldTips["cameraBlockMinDistance"] = "智能摄像机最小距离";

			configDesc.fieldLabels["cameraMouseWheelSpeed"] = "摄像机滚轮速度";
			configDesc.fieldTips["cameraMouseWheelSpeed"] = "摄像机鼠标滚轮速度";

			configDesc.fieldLabels["cameraFar"] = "摄像机远裁切";
			configDesc.fieldTips["cameraFar"] = "摄像机远裁切";

			configDesc.fieldLabels["jumpStartTime"] = "跳跃开始时间";
			configDesc.fieldTips["jumpStartTime"] = "跳跃开始时间";

			configDesc.fieldLabels["mountJumpStartTime"] = "马上跳跃开始时间";
			configDesc.fieldTips["mountJumpStartTime"] = "马上跳跃开始时间";

			configDesc.fieldLabels["secondJumpStartTime"] = "二级跳跃开始时间";
			configDesc.fieldTips["secondJumpStartTime"] = "二级跳跃开始时间";

			configDesc.fieldLabels["mountSecondJumpStartTime"] = "马上二级跳跃开始时间";
			configDesc.fieldTips["mountSecondJumpStartTime"] = "马上二级跳跃开始时间";

			configDesc.fieldLabels["secondJumpProbability"] = "二级跳跃概率（0~100）";
			configDesc.fieldTips["secondJumpProbability"] = "二级跳跃概率（0~100）";

			configDesc.fieldLabels["jumpHeight"] = "跳跃高度";
			configDesc.fieldTips["jumpHeight"] = "跳跃高度";

			configDesc.fieldLabels["mountJumpHeight"] = "马上跳跃高度";
			configDesc.fieldTips["mountJumpHeight"] = "马上跳跃高度";

			configDesc.fieldLabels["secondJumpHeight"] = "二级跳跃高度";
			configDesc.fieldTips["secondJumpHeight"] = "二级跳跃高度";

			configDesc.fieldLabels["mountSecondJumpHeight"] = "马上二级跳跃高度";
			configDesc.fieldTips["mountSecondJumpHeight"] = "马上二级跳跃高度";

			configDesc.fieldLabels["jumpSpeedRatio"] = "跳跃速率";
			configDesc.fieldTips["jumpSpeedRatio"] = "跳跃速率";

			configDesc.fieldLabels["mountjumpSpeedRatio"] = "马上跳跃速率";
			configDesc.fieldTips["mountjumpSpeedRatio"] = "马上跳跃速率";

			configDesc.fieldLabels["secondJumpSpeedRatio"] = "二级跳跃速率";
			configDesc.fieldTips["secondJumpSpeedRatio"] = "二级跳跃速率";

			configDesc.fieldLabels["mountSecondJumpSpeedRatio"] = "马上二级跳跃速率";
			configDesc.fieldTips["mountSecondJumpSpeedRatio"] = "马上二级跳跃速率";

			configDesc.fieldLabels["jumpEndTime"] = "跳跃结束时间";
			configDesc.fieldTips["jumpEndTime"] = "跳跃结束时间";

			configDesc.fieldLabels["mountJumpEndTime"] = "马上跳跃结束时间";
			configDesc.fieldTips["mountJumpEndTime"] = "马上跳跃结束时间";

			configDesc.fieldLabels["secondJumpEndTime"] = "二级跳跃结束时间";
			configDesc.fieldTips["secondJumpEndTime"] = "二级跳跃结束时间";

			configDesc.fieldLabels["mountSecondJumpEndTime"] = "马上二级跳跃结束时间";
			configDesc.fieldTips["mountSecondJumpEndTime"] = "马上二级跳跃结束时间";

			configDesc.fieldLabels["jumpBreakTime"] = "跳跃打断时间";
			configDesc.fieldTips["jumpBreakTime"] = "跳跃打断时间";

			configDesc.fieldLabels["mountJumpBreakTime"] = "马上跳跃打断时间";
			configDesc.fieldTips["mountJumpBreakTime"] = "马上跳跃打断时间";

			configDesc.fieldLabels["secondJumpBreakTime"] = "二级跳跃打断时间";
			configDesc.fieldTips["secondJumpBreakTime"] = "二级跳跃打断时间";

			configDesc.fieldLabels["mountSecondJumpBreakTime"] = "马上二级跳跃打断时间";
			configDesc.fieldTips["mountSecondJumpBreakTime"] = "马上二级跳跃打断时间";

			configDesc.fieldLabels["deathStateEffectType"] = "死亡效果类型";
			configDesc.fieldTips["deathStateEffectType"] = "死亡效果类型";

			configDesc.fieldLabels["outlineEffectStrength"] = "外发光强度";
			configDesc.fieldTips["outlineEffectStrength"] = "外发光强度";

			configDesc.fieldLabels["outlineEffectSize"] = "外发光大小";
			configDesc.fieldTips["outlineEffectSize"] = "外发光大小";

			configDesc.fieldLabels["outlineEffectQuality"] = "外发光品质";
			configDesc.fieldTips["outlineEffectQuality"] = "外发光品质";

			configDesc.fieldLabels["outlineEnemyColor"] = "外发光敌方颜色";
			configDesc.fieldTips["outlineEnemyColor"] = "外发光敌方颜色";
			configDesc.formatMapping["outlineEnemyColor"] = "color";

			configDesc.fieldLabels["outlineFriendColor"] = "外发光友方颜色";
			configDesc.fieldTips["outlineFriendColor"] = "外发光友方颜色";
			configDesc.formatMapping["outlineFriendColor"] = "color";

			configDesc.fieldLabels["outlineNeutralColor"] = "外发光中立方颜色";
			configDesc.fieldTips["outlineNeutralColor"] = "外发光中立方颜色";
			configDesc.formatMapping["outlineNeutralColor"] = "color";

			configDesc.fieldLabels["dialogFaceOffset"] = "半身像偏移";
			configDesc.fieldTips["dialogFaceOffset"] = "半身像偏移";

			configDesc.fieldLabels["headFaceOffset"] = "头像偏移";
			configDesc.fieldTips["headFaceOffset"] = "头像偏移";

			configDesc.fieldLabels["bossHeadFaceOffset"] = "Boss头像偏移";
			configDesc.fieldTips["bossHeadFaceOffset"] = "Boss头像偏移";
		}

		public function GlobalSettingConfig()
		{
			super();
			this["key"] = "";
			this["glassPassColor"] = 0;
			this["cameraOffsetY"] = 0;
			this["cameraXDeg"] = 0;
			this["cameraYDeg"] = 0;
			this["cameraMinTiltAngle"] = 0;
			this["cameraMaxTiltAngle"] = 0;
			this["cameraDistance"] = 0;
			this["cameraMinDistance"] = 0;
			this["cameraMaxDistance"] = 0;
			this["cameraBlockMinDistance"] = 0;
			this["cameraMouseDragSpeed"] = 0;
			this["cameraMouseWheelSpeed"] = 0;
			this["cameraFar"] = 0;
			this["jumpStartTime"] = 0;
			this["mountJumpStartTime"] = 0;
			this["secondJumpStartTime"] = 0;
			this["mountSecondJumpStartTime"] = 0;
			this["secondJumpProbability"] = 0;
			this["jumpHeight"] = 0;
			this["mountJumpHeight"] = 0;
			this["secondJumpHeight"] = 0;
			this["mountSecondJumpHeight"] = 0;

			this["jumpSpeedRatio"] = 0;
			this["mountjumpSpeedRatio"] = 0;
			this["secondJumpSpeedRatio"] = 0;
			this["mountSecondJumpSpeedRatio"] = 0;
			this["jumpEndTime"] = 0;
			this["mountJumpEndTime"] = 0;
			this["secondJumpEndTime"] = 0;
			this["mountSecondJumpEndTime"] = 0;
			this["jumpBreakTime"] = 0;
			this["mountJumpBreakTime"] = 0;
			this["secondJumpBreakTime"] = 0;
			this["mountSecondJumpBreakTime"] = 0;
			this["deathStateEffectType"] = 0;
			this["outlineEffectStrength"] = 0;
			this["outlineEffectSize"] = 0;
			this["outlineEffectQuality"] = 0;
			this["outlineEnemyColor"] = 0;
			this["outlineFriendColor"] = 0;
			this["outlineNeutralColor"] = 0;

			this["dialogFaceOffset"] = "";
			this["headFaceOffset"] = "";
			this["bossHeadFaceOffset"] = "";
		}

		public function get mKey() : String
		{
			return this["key"];
		}

		public function set mKey(value : String) : void
		{
			this["key"] = value;
		}

		public function get mGlassPassColor() : uint
		{
			return this["glassPassColor"];
		}

		public function set mGlassPassColor(value : uint) : void
		{
			this["glassPassColor"] = value;
		}

		public function get mCameraOffsetY() : int
		{
			return this["cameraOffsetY"];
		}

		public function set mCameraOffsetY(value : int) : void
		{
			this["cameraOffsetY"] = value;
		}

		public function get mCameraXDeg() : int
		{
			return this["cameraXDeg"];
		}

		public function set mCameraXDeg(value : int) : void
		{
			this["cameraXDeg"] = value;
		}

		public function get mCameraYDeg() : int
		{
			return this["cameraYDeg"];
		}

		public function set mCameraYDeg(value : int) : void
		{
			this["cameraYDeg"] = value;
		}

		public function get mCameraMinTiltAngle() : int
		{
			return this["cameraMinTiltAngle"];
		}

		public function set mCameraMinTiltAngle(value : int) : void
		{
			this["cameraMinTiltAngle"] = value;
		}

		public function get mCameraMaxTiltAngle() : int
		{
			return this["cameraMaxTiltAngle"];
		}

		public function set mCameraMaxTiltAngle(value : int) : void
		{
			this["cameraMaxTiltAngle"] = value;
		}

		public function get mCameraDistance() : int
		{
			return this["cameraDistance"];
		}

		public function set mCameraDistance(value : int) : void
		{
			this["cameraDistance"] = value;
		}

		public function get mCameraFar() : int
		{
			return this["cameraFar"];
		}

		public function set mCameraFar(value : int) : void
		{
			this["cameraFar"] = value;
		}

		public function get mCameraMinDistance() : int
		{
			return this["cameraMinDistance"];
		}

		public function set mCameraMinDistance(value : int) : void
		{
			this["cameraMinDistance"] = value;
		}

		public function get mCameraMaxDistance() : int
		{
			return this["cameraMaxDistance"];
		}

		public function set mCameraMaxDistance(value : int) : void
		{
			this["cameraMaxDistance"] = value;
		}

		public function get mCameraMouseDragSpeed() : Number
		{
			return this["cameraMouseDragSpeed"];
		}

		public function get mCameraBlockMinDistance() : int
		{
			return this["cameraBlockMinDistance"];
		}

		public function get mCameraMouseWheelSpeed() : Number
		{
			return this["cameraMouseWheelSpeed"];
		}

		public function set mCameraMouseWheelSpeed(value : Number) : void
		{
			this["cameraMouseWheelSpeed"] = value;
		}

		public function get mJumpStartTime() : int
		{
			return this["jumpStartTime"];
		}

		public function get mMountJumpStartTime() : int
		{
			return this["mountJumpStartTime"];
		}

		public function get mSecondJumpStartTime() : int
		{
			return this["secondJumpStartTime"];
		}

		public function get mMountSecondJumpStartTime() : int
		{
			return this["mountSecondJumpStartTime"];
		}

		public function get mSecondJumpProbability() : int
		{
			return this["secondJumpProbability"];
		}

		public function set mSecondJumpProbability(value : int) : void
		{
			this["secondJumpProbability"] = value;
		}

		public function get mJumpHeight() : int
		{
			return this["jumpHeight"];
		}

		public function get mMountJumpHeight() : int
		{
			return this["mountJumpHeight"];
		}

		public function get mSecondJumpHeight() : int
		{
			return this["secondJumpHeight"];
		}

		public function get mMountSecondJumpHeight() : int
		{
			return this["mountSecondJumpHeight"];
		}

		public function get mJumpSpeedRatio() : Number
		{
			return this["jumpSpeedRatio"];
		}

		public function get mMountJumpSpeedRatio() : Number
		{
			return this["mountjumpSpeedRatio"];
		}

		public function get mSecondJumpSpeedRatio() : Number
		{
			return this["secondJumpSpeedRatio"];
		}

		public function get mMountSecondJumpSpeedRatio() : Number
		{
			return this["mountSecondJumpSpeedRatio"];
		}

		public function get mJumpEndTime() : int
		{
			return this["jumpEndTime"];
		}

		public function get mMountJumpEndTime() : int
		{
			return this["mountJumpEndTime"];
		}

		public function get mSecondJumpEndTime() : int
		{
			return this["secondJumpEndTime"];
		}

		public function get mMountSecondJumpEndTime() : int
		{
			return this["mountSecondJumpEndTime"];
		}

		public function get mJumpBreakTime() : int
		{
			return this["jumpBreakTime"];
		}

		public function get mMountJumpBreakTime() : int
		{
			return this["mountJumpBreakTime"];
		}

		public function get mSecondJumpBreakTime() : int
		{
			return this["secondJumpBreakTime"];
		}

		public function get mMountSecondJumpBreakTime() : int
		{
			return this["mountSecondJumpBreakTime"];
		}

		public function get mDeathStateEffectType() : int
		{
			return this["deathStateEffectType"];
		}

		public function get mOutlineEffectStrength() : Number
		{
			return this["outlineEffectStrength"];
		}

		public function get mOutlineEffectSize() : Number
		{
			return this["outlineEffectSize"];
		}

		public function get mOutlineEffectQuality() : int
		{
			return this["outlineEffectQuality"];
		}

		public function get mOutlineEnemyColor() : uint
		{
			return this["outlineEnemyColor"];
		}

		public function get mOutlineFriendColor() : uint
		{
			return this["outlineFriendColor"];
		}

		public function get mOutlineNeutralColor() : uint
		{
			return this["outlineNeutralColor"];
		}

		public function get mDialogFaceOffsetX() : int
		{
			return String(this["dialogFaceOffset"]).split(",")[0];
		}

		public function get mDialogFaceOffsetY() : int
		{
			return String(this["dialogFaceOffset"]).split(",")[1];
		}

		public function get mHeadFaceOffsetX() : int
		{
			return String(this["headFaceOffset"]).split(",")[0];
		}

		public function get mHeadFaceOffsetY() : int
		{
			return String(this["headFaceOffset"]).split(",")[1];
		}

		public function get mBossHeadFaceOffsetX() : int
		{
			return String(this["bossHeadFaceOffset"]).split(",")[0];
		}

		public function get mBossHeadFaceOffsetY() : int
		{
			return String(this["bossHeadFaceOffset"]).split(",")[1];
		}
	}
}
