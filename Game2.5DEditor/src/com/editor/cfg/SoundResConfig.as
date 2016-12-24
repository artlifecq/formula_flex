package com.editor.cfg
{

	/**
	 *
	 * 音效资源配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-16 下午2:30:12
	 *
	 */
	dynamic public class SoundResConfig extends ConfigData
	{
		public static var soundFileKinds : Array = [];

		public function SoundResConfig()
		{
			super();
			this["res"] = "";
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
	}
}
