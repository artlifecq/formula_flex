package com.rpgGame.coreData.cfg.country
{
	import app.message.CountryConfig;
	import app.message.CountryMiscProto;
	import app.message.CountryNameProto;
	import app.message.CountryOfficerDatasProto;

	/**
	 *
	 * 国家静态配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryStaticConfigData
	{
		/**
		 * 乱七八糟的数据
		 */
		private static var misc : CountryMiscProto;
		/**
		 * 国战配置
		 */
		//private static var countryWarConfig : CountryWarConfigProto;
		/**
		 * 国家名字
		 */
		private static var countryName : CountryNameProto;
		/**
		 * 官员数据
		 */
		private static var officerDatas : CountryOfficerDatasProto;

		public static function setConfig(cfg : CountryConfig) : void
		{
			misc = cfg.misc;
			//countryWarConfig = cfg.countryWarConfig;
			countryName = cfg.countryName;
			officerDatas = cfg.officerDatas;

			CountryMiscCfgData.setConfig(misc);
			CountryNameCfgData.setConfig(countryName);
			//CountryWarCfgData.setConfig(countryWarConfig);
			CountryOfficerCfgData.setConfig(officerDatas);
		}

		public function CountryStaticConfigData()
		{
		}
	}
}
