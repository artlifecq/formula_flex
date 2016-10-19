package com.game.engine3D.vo.map
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图摄像机景深参数
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-29 下午2:03:17
	 *
	 */
	public class ClientMapCameraBokehDepth
	{
		private var _version : int = 0;

		public var focalDepth : Number = 0.0;
		public var focalLegth : Number = 0.0;
		public var blurSharpness : Number = 0.0;
		public var bokehBloomThreshold : Number = 0.0;
		public var bokehBloomGain : Number = 0.0;

		public function ClientMapCameraBokehDepth()
		{
		}

		public function readFrom(bytes : ByteArray) : void
		{
			_version = bytes.readByte();
			if (_version == 0 || _version == 2)
			{
				focalDepth = bytes.readFloat();
				focalLegth = bytes.readFloat();
				blurSharpness = bytes.readFloat();
				bokehBloomThreshold = bytes.readFloat();
				bokehBloomGain = bytes.readFloat();
			}
		}
	}
}
