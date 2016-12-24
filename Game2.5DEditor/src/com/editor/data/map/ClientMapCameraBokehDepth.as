package com.editor.data.map
{
	import com.editor.cfg.ConfigData;

	import flash.utils.ByteArray;

	/**
	 *
	 * 客户端地图摄像机景深参数
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-29 下午2:03:17
	 *
	 */
	public class ClientMapCameraBokehDepth extends ConfigData
	{
		public static const CAMERA_BOKEH_DEPTH_DATA_VERSION : int = 2;
		private var _version : int = 0;

		public function ClientMapCameraBokehDepth()
		{
			super();
			this["focalDepth"] = 0.0;
			this["focalLegth"] = 0.0;
			this["blurSharpness"] = 0.0;
			this["bokehBloomThreshold"] = 0.0;
			this["bokehBloomGain"] = 0.0;
		}

		public function set mFocalDepth(value : Number) : void
		{
			this["focalDepth"] = Number(value.toFixed(2));
		}

		public function get mFocalDepth() : Number
		{
			return this["focalDepth"];
		}

		public function set mFocalLegth(value : Number) : void
		{
			this["focalLegth"] = Number(value.toFixed(2));
		}

		public function get mFocalLegth() : Number
		{
			return this["focalLegth"];
		}

		public function set mBlurSharpness(value : Number) : void
		{
			this["blurSharpness"] = Number(value.toFixed(2));
		}

		public function get mBlurSharpness() : Number
		{
			return this["blurSharpness"];
		}

		public function set mBokehBloomThreshold(value : Number) : void
		{
			this["bokehBloomThreshold"] = Number(value.toFixed(2));
		}

		public function get mBokehBloomThreshold() : Number
		{
			return this["bokehBloomThreshold"];
		}

		public function set mBokehBloomGain(value : Number) : void
		{
			this["bokehBloomGain"] = Number(value.toFixed(2));
		}

		public function get mBokehBloomGain() : Number
		{
			return this["bokehBloomGain"];
		}

		public function writeTo(bytes : ByteArray) : void
		{
			bytes.writeByte(CAMERA_BOKEH_DEPTH_DATA_VERSION);
			bytes.writeFloat(mFocalDepth);
			bytes.writeFloat(mFocalLegth);
			bytes.writeFloat(mBlurSharpness);
			bytes.writeFloat(mBokehBloomThreshold);
			bytes.writeFloat(mBokehBloomGain);
		}

		public function readFrom(bytes : ByteArray) : void
		{
			_version = bytes.readByte();
			if (_version == 0 || _version == 2)
			{
				mFocalDepth = bytes.readFloat();
				mFocalLegth = bytes.readFloat();
				mBlurSharpness = bytes.readFloat();
				mBokehBloomThreshold = bytes.readFloat();
				mBokehBloomGain = bytes.readFloat();
			}
		}
	}
}
