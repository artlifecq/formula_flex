package com.editor.cfg
{
	import com.editor.data.ConfigDesc;

	/**
	 *
	 * 地图文件资源配置
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-26 下午2:30:12
	 *
	 */
	public class MapFileResConfig extends ConfigData
	{
		public static function setFieldLabelsAndTips(configDesc : ConfigDesc) : void
		{
			configDesc.fieldLabels["res"] = "资源";
			configDesc.fieldTips["res"] = "资源";
		}

		public function MapFileResConfig()
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
