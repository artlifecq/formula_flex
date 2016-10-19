package com.rpgGame.coreData.info.country.country
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangCountry;
	
	import app.message.CountryExchequerProto;

	/**
	 *
	 * 国库数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryExchequerData
	{
		/** 国库钱的数量 **/
		public var amount : Number;
		/** 昨日收入 **/
		public var yesterdayIncome : Number;
		/** 禁卫今日的俸禄 **/
		public var todayJinWeiSalary : Number;
		/** 税率 需要的时候自己换成百分比 **/
		public var taxRate : int;
		/**评价区分**/
		private static const GUO_KU_EVALUATE : Array = LanguageConfig.getText(LangCountry.COUNTRY_GUO_KU_EVALUATE).split(",");
		/**评价区分对应的显示**/
		private static const GUO_KU_EVALUATE_STRING : Array = LanguageConfig.getText(LangCountry.COUNTRY_GUO_KU_EVALUATE_STRING).split(",");

		public function CountryExchequerData()
		{
			amount = 0;
			yesterdayIncome = 0;
			todayJinWeiSalary = 0;
		}

		public function setConfig(cfg : CountryExchequerProto) : void
		{
			yesterdayIncome = cfg.yesterdayIncome.toNumber();
			todayJinWeiSalary = cfg.todayJinWeiSalary.toNumber();
			taxRate = cfg.taxRate;
			trace(cfg.taxRate);
		}
		
		/**获取国库评价**/
		public function getGuoKuEvaluateStr():String
		{
			if(amount < int(GUO_KU_EVALUATE[0]))
				return GUO_KU_EVALUATE_STRING[0];
			else if(amount >= int(GUO_KU_EVALUATE[0]) && amount < int(GUO_KU_EVALUATE[1]))
				return GUO_KU_EVALUATE_STRING[1];
			else
				return GUO_KU_EVALUATE_STRING[2];
			return "";
		}
	}
}
