package com.editor.cfg
{

	/**
	 *
	 * 语言配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-16 下午2:30:12
	 *
	 */
	dynamic public class LangConfig extends ConfigData
	{
		public function LangConfig()
		{
			super();
			this["key"] = "";
			majorKey = "key";
		}

		public function get mKey() : String
		{
			return this["key"];
		}

		public function set mKey(value : String) : void
		{
			this["key"] = value;
		}

		public function get mValue() : String
		{
			return this["value"];
		}

		public function set mValue(value : String) : void
		{
			this["value"] = value;
		}
	}
}
