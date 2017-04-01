package com.editor.data.map
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.manager.DataStructuresManager;

	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图摄像机属性数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-23 下午2:03:17
	 *
	 */
	public class ClientMapCameraPropertyData extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["cameraMinDistance"] = "摄像机最小距离";
			configDesc.fieldTips["cameraMinDistance"] = "摄像机最小距离";

			configDesc.fieldLabels["cameraMaxDistance"] = "摄像机最大距离";
			configDesc.fieldTips["cameraMaxDistance"] = "摄像机最大距离";

			configDesc.fieldLabels["cameraXDeg"] = "摄像机转角";
			configDesc.fieldTips["cameraXDeg"] = "摄像机转角";

			configDesc.fieldLabels["cameraYDeg"] = "摄像机仰角";
			configDesc.fieldTips["cameraYDeg"] = "摄像机仰角";

			configDesc.fieldLabels["cameraMinTiltAngle"] = "摄像机最小仰角";
			configDesc.fieldTips["cameraMinTiltAngle"] = "摄像机最小仰角";

			configDesc.fieldLabels["cameraMaxTiltAngle"] = "摄像机最大仰角";
			configDesc.fieldTips["cameraMaxTiltAngle"] = "摄像机最大仰角";

			configDesc.fieldLabels["cameraDistance"] = "摄像机距离";
			configDesc.fieldTips["cameraDistance"] = "摄像机距离";

			configDesc.fieldLabels["cameraOffsetY"] = "摄像机Y偏移";
			configDesc.fieldTips["cameraOffsetY"] = "摄像机Y偏移";

			configDesc.fieldLabels["cameraFar"] = "摄像机远裁切";
			configDesc.fieldTips["cameraFar"] = "摄像机远裁切";

			configDesc.fieldLabels["useDynamicBokehDepth"] = "是否使用动态景深";
			configDesc.fieldTips["useDynamicBokehDepth"] = "是否使用动态景深";
			configDesc.formatMapping["useDynamicBokehDepth"] = "boolean";

			configDesc.fieldLabels["minDepthChangeDistance"] = "最小景深变化距离";
			configDesc.fieldTips["minDepthChangeDistance"] = "最小景深变化距离";

			configDesc.fieldLabels["maxDepthChangeDistance"] = "最大景深变化距离";
			configDesc.fieldTips["maxDepthChangeDistance"] = "最大景深变化距离";

			configDesc.fieldLabels["useDepthMinDistance"] = "开启景深最小距离";
			configDesc.fieldTips["useDepthMinDistance"] = "开启景深最小距离";

			configDesc.fieldLabels["minBokehDepth"] = "最小景深参数";
			configDesc.fieldTips["minBokehDepth"] = "最小景深参数";

			configDesc.fieldLabels["maxBokehDepth"] = "最大景深参数";
			configDesc.fieldTips["maxBokehDepth"] = "最大景深参数";
		}

		private var _version : int = 0;

		public function ClientMapCameraPropertyData()
		{
			super();
			this["cameraMinDistance"] = 0;
			this["cameraMaxDistance"] = 0;
			this["cameraXDeg"] = 0;
			this["cameraYDeg"] = 0;
			this["cameraMinTiltAngle"] = 0;
			this["cameraMaxTiltAngle"] = 0;
			this["cameraDistance"] = 0;
			this["cameraOffsetY"] = 0;
			this["cameraFar"] = 0;
			this["useDynamicBokehDepth"] = false;

			this["minDepthChangeDistance"] = 0;
			this["maxDepthChangeDistance"] = 0;
			this["useDepthMinDistance"] = 0;

			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapCameraBokehDepthName);
			if (tabel)
			{
				this["minBokehDepth"] = ConfigData.create(tabel.desc, null, null, tabel.dataConstructor);
				this["maxBokehDepth"] = ConfigData.create(tabel.desc, null, null, tabel.dataConstructor);
			}
			//====================
			name = "摄像机属性";
		}

		/**  摄像机最小距离 */
		public function get mCameraMinDistance() : int
		{
			return this["cameraMinDistance"];
		}

		public function set mCameraMinDistance(value : int) : void
		{
			this["cameraMinDistance"] = value;
		}

		/**  摄像机最大距离 */
		public function get mCameraMaxDistance() : int
		{
			return this["cameraMaxDistance"];
		}

		public function set mCameraMaxDistance(value : int) : void
		{
			this["cameraMaxDistance"] = value;
		}

		/**  摄像机转角 */
		public function get mCameraXDeg() : int
		{
			return this["cameraXDeg"];
		}

		public function set mCameraXDeg(value : int) : void
		{
			this["cameraXDeg"] = value;
		}

		/**  摄像机仰角 */
		public function get mCameraYDeg() : int
		{
			return this["cameraYDeg"];
		}

		public function set mCameraYDeg(value : int) : void
		{
			this["cameraYDeg"] = value;
		}

		/**  摄像机最小仰角 */
		public function get mCameraMinTiltAngle() : int
		{
			return this["cameraMinTiltAngle"];
		}

		public function set mCameraMinTiltAngle(value : int) : void
		{
			this["cameraMinTiltAngle"] = value;
		}

		/**  摄像机最大仰角 */
		public function get mCameraMaxTiltAngle() : int
		{
			return this["cameraMaxTiltAngle"];
		}

		public function set mCameraMaxTiltAngle(value : int) : void
		{
			this["cameraMaxTiltAngle"] = value;
		}

		/**  摄像机距离 */
		public function get mCameraDistance() : int
		{
			return this["cameraDistance"];
		}

		public function set mCameraDistance(value : int) : void
		{
			this["cameraDistance"] = value;
		}

		/**  摄像机Y偏移 */
		public function get mCameraOffsetY() : int
		{
			return this["cameraOffsetY"];
		}

		public function set mCameraOffsetY(value : int) : void
		{
			this["cameraOffsetY"] = value;
		}

		/**  摄像机远裁切 */
		public function get mCameraFar() : int
		{
			return this["cameraFar"];
		}

		public function set mCameraFar(value : int) : void
		{
			this["cameraFar"] = value;
		}

		/**  是否使用动态景深 */
		public function get mUseDynamicBokehDepth() : Boolean
		{
			return this["useDynamicBokehDepth"];
		}

		public function set mUseDynamicBokehDepth(value : Boolean) : void
		{
			this["useDynamicBokehDepth"] = value;
		}

		/**  最小景深变化距离 */
		public function get mMinDepthChangeDistance() : int
		{
			return this["minDepthChangeDistance"];
		}

		public function set mMinDepthChangeDistance(value : int) : void
		{
			this["minDepthChangeDistance"] = value;
		}

		/**  最大景深变化距离 */
		public function get mMaxDepthChangeDistance() : int
		{
			return this["maxDepthChangeDistance"];
		}

		public function set mMaxDepthChangeDistance(value : int) : void
		{
			this["maxDepthChangeDistance"] = value;
		}

		/**  开启景深最小距离 */
		public function get mUseDepthMinDistance() : int
		{
			return this["useDepthMinDistance"];
		}

		public function set mUseDepthMinDistance(value : int) : void
		{
			this["useDepthMinDistance"] = value;
		}

		/**  最小景深参数 */
		public function get mMinBokehDepth() : ClientMapCameraBokehDepth
		{
			return this["minBokehDepth"];
		}

		public function set mMinBokehDepth(value : ClientMapCameraBokehDepth) : void
		{
			this["minBokehDepth"] = value;
		}

		/**  最大景深参数 */
		public function get mMaxBokehDepth() : ClientMapCameraBokehDepth
		{
			return this["maxBokehDepth"];
		}

		public function set mMaxBokehDepth(value : ClientMapCameraBokehDepth) : void
		{
			this["maxBokehDepth"] = value;
		}

		public function writeTo(bytes : ByteArray) : void
		{
			bytes.writeShort(mCameraMinDistance);
			bytes.writeShort(mCameraMaxDistance);
			bytes.writeShort(mCameraXDeg);
			bytes.writeShort(mCameraYDeg);
			bytes.writeShort(mCameraMinTiltAngle);
			bytes.writeShort(mCameraMaxTiltAngle);
			bytes.writeShort(mCameraDistance);
			bytes.writeShort(mCameraOffsetY);
			bytes.writeShort(mCameraFar);
			bytes.writeBoolean(mUseDynamicBokehDepth);
			bytes.writeShort(mMinDepthChangeDistance);
			bytes.writeShort(mMaxDepthChangeDistance);
			bytes.writeShort(mUseDepthMinDistance);
			mMinBokehDepth.writeTo(bytes);
			mMaxBokehDepth.writeTo(bytes);
		}

		public function readFrom(version : int, bytes : ByteArray) : void
		{
			_version = version;
			if (_version == 4)
			{
				mCameraMinDistance = bytes.readUnsignedShort();
				mCameraMaxDistance = bytes.readUnsignedShort();
				mCameraXDeg = bytes.readUnsignedShort();
				mCameraYDeg = bytes.readUnsignedShort();
				mCameraMinTiltAngle = bytes.readUnsignedShort();
				mCameraMaxTiltAngle = bytes.readUnsignedShort();
				mCameraDistance = bytes.readUnsignedShort();
				mCameraOffsetY = bytes.readUnsignedShort();
				mCameraFar = bytes.readUnsignedShort();
				mUseDynamicBokehDepth = bytes.readBoolean();
				mMinDepthChangeDistance = bytes.readUnsignedShort();
				mMaxDepthChangeDistance = bytes.readUnsignedShort();
				mUseDepthMinDistance = bytes.readUnsignedShort();
				mMinBokehDepth.readFrom(bytes);
				mMaxBokehDepth.readFrom(bytes);
			}
			else if (_version == 3)
			{
				mCameraMinDistance = bytes.readUnsignedShort();
				mCameraMaxDistance = bytes.readUnsignedShort();
				mCameraXDeg = bytes.readUnsignedShort();
				mCameraYDeg = bytes.readUnsignedShort();
				mCameraMinTiltAngle = bytes.readUnsignedShort();
				mCameraMaxTiltAngle = bytes.readUnsignedShort();
				mCameraDistance = bytes.readUnsignedShort();
				mCameraOffsetY = bytes.readUnsignedShort();
				mCameraFar = bytes.readUnsignedShort();
				mUseDynamicBokehDepth = bytes.readBoolean();
				mMinDepthChangeDistance = bytes.readUnsignedShort();
				mMaxDepthChangeDistance = bytes.readUnsignedShort();
				mMinBokehDepth.readFrom(bytes);
				mMaxBokehDepth.readFrom(bytes);
			}
			else if (_version == 0 || _version == 2)
			{
				mCameraMinDistance = bytes.readUnsignedShort();
				mCameraMaxDistance = bytes.readUnsignedShort();
				mCameraXDeg = bytes.readUnsignedShort();
				mCameraYDeg = bytes.readUnsignedShort();
				mCameraMinTiltAngle = bytes.readUnsignedShort();
				mCameraMaxTiltAngle = bytes.readUnsignedShort();
				mCameraDistance = bytes.readUnsignedShort();
				mCameraOffsetY = bytes.readUnsignedShort();
				mCameraFar = bytes.readUnsignedShort();
				mUseDynamicBokehDepth = bytes.readBoolean();
				mMinBokehDepth.readFrom(bytes);
				mMaxBokehDepth.readFrom(bytes);
			}
		}
	}
}
