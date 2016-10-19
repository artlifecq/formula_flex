package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.GlobalSetting;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *
	 * 全局设置配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-29 上午10:30:12
	 *
	 */
	public class GlobalSettingCfgData
	{
		private static var _dataDic : Dictionary;

		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();

			var arr : Array = data.readObject();
			for each (var info : GlobalSetting in arr)
			{
				_dataDic[info.key] = info;
			}
		}

		public static function getSettingInfo(key : String) : GlobalSetting
		{
			return _dataDic[key];
		}

		public function GlobalSettingCfgData()
		{
		}
	}
}
