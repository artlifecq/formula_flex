package com.game.engine3D.vo.map
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图摄像机属性数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-23 下午2:03:17
	 *
	 */
	public class ClientMapCameraPropertyData
	{
		private var _version : int = 0;

		public var cameraMinDistance : int = 0;
		public var cameraMaxDistance : int = 0;
		public var cameraXDeg : int = 0;
		public var cameraYDeg : int = 0;
		public var cameraMinTiltAngle : int = 0;
		public var cameraMaxTiltAngle : int = 0;
		public var cameraDistance : int = 0;
		public var cameraOffsetY : int = 0;
		public var cameraFar : int = 0;
		public var useDynamicBokehDepth : Boolean = false;
		public var minDepthChangeDistance : int = 0;
		public var maxDepthChangeDistance : int = 0;
		public var useDepthMinDistance : int = 0;
		public var minBokehDepth : ClientMapCameraBokehDepth;
		public var maxBokehDepth : ClientMapCameraBokehDepth;

		public function ClientMapCameraPropertyData()
		{
			minBokehDepth = new ClientMapCameraBokehDepth();
			maxBokehDepth = new ClientMapCameraBokehDepth();
		}

		public function readFrom(version : int, bytes : ByteArray) : void
		{
			_version = version;
			if (_version == 4)
			{
				cameraMinDistance = bytes.readUnsignedShort();
				cameraMaxDistance = bytes.readUnsignedShort();
				cameraXDeg = bytes.readUnsignedShort();
				cameraYDeg = bytes.readUnsignedShort();
				cameraMinTiltAngle = bytes.readUnsignedShort();
				cameraMaxTiltAngle = bytes.readUnsignedShort();
				cameraDistance = bytes.readUnsignedShort();
				cameraOffsetY = bytes.readUnsignedShort();
				cameraFar = bytes.readUnsignedShort();
				useDynamicBokehDepth = bytes.readBoolean();
				minDepthChangeDistance = bytes.readUnsignedShort();
				maxDepthChangeDistance = bytes.readUnsignedShort();
				useDepthMinDistance = bytes.readUnsignedShort();
				minBokehDepth.readFrom(bytes);
				maxBokehDepth.readFrom(bytes);
			}
			else if (_version == 3)
			{
				cameraMinDistance = bytes.readUnsignedShort();
				cameraMaxDistance = bytes.readUnsignedShort();
				cameraXDeg = bytes.readUnsignedShort();
				cameraYDeg = bytes.readUnsignedShort();
				cameraMinTiltAngle = bytes.readUnsignedShort();
				cameraMaxTiltAngle = bytes.readUnsignedShort();
				cameraDistance = bytes.readUnsignedShort();
				cameraOffsetY = bytes.readUnsignedShort();
				cameraFar = bytes.readUnsignedShort();
				useDynamicBokehDepth = bytes.readBoolean();
				minDepthChangeDistance = bytes.readUnsignedShort();
				maxDepthChangeDistance = bytes.readUnsignedShort();
				minBokehDepth.readFrom(bytes);
				maxBokehDepth.readFrom(bytes);
			}
			else if (_version == 0 || _version == 2)
			{
				cameraMinDistance = bytes.readUnsignedShort();
				cameraMaxDistance = bytes.readUnsignedShort();
				cameraXDeg = bytes.readUnsignedShort();
				cameraYDeg = bytes.readUnsignedShort();
				cameraMinTiltAngle = bytes.readUnsignedShort();
				cameraMaxTiltAngle = bytes.readUnsignedShort();
				cameraDistance = bytes.readUnsignedShort();
				cameraOffsetY = bytes.readUnsignedShort();
				cameraFar = bytes.readUnsignedShort();
				useDynamicBokehDepth = bytes.readBoolean();
				minBokehDepth.readFrom(bytes);
				maxBokehDepth.readFrom(bytes);
			}
		}
	}
}
