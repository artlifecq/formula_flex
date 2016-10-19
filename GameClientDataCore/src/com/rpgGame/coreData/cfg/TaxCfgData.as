package com.rpgGame.coreData.cfg
{
	import app.message.AllTaxConfigProto;
	import app.message.TaxConfigProto;

	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 税收静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-6 上午11:32:15
	 *
	 */
	public class TaxCfgData
	{
		public function TaxCfgData()
		{
		}

		private static var _map : HashMap = new HashMap();

		public static function setConfig(config : AllTaxConfigProto) : void
		{
			if (!config)
				return;

			for each (var taxConfig : TaxConfigProto in config.taxConfig)
			{
				_map.add(taxConfig.taxType, taxConfig);
			}
		}

		public static function getTaxConfigByType(type : int) : TaxConfigProto
		{
			return _map.getValue(type);
		}
	}
}
