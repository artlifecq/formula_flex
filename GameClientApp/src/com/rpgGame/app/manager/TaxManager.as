package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.coreData.cfg.TaxCfgData;

	import app.message.TaxConfigProto;

	/**
	 *
	 * 税收管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-6 上午11:32:15
	 *
	 */
	public class TaxManager
	{
		public function TaxManager()
		{
		}

		/**
		 * 获取税收 
		 * @param type
		 * @return 
		 * 
		 */		
		public static function getTaxByType(type : int) : int
		{
			var taxConfig : TaxConfigProto = TaxCfgData.getTaxConfigByType(type);
			if (taxConfig)
			{
				if (taxConfig.isOpen)
				{
					if (taxConfig.fixedTax > 0)
					{
						return taxConfig.fixedTax;
					}
					else
					{
						if (CountryManager.selfCountryData && CountryManager.selfCountryData.exchequer)
						{
							return CountryManager.selfCountryData.exchequer.taxRate;
						}
					}
				}
			}
			return 0;
		}
	}
}
