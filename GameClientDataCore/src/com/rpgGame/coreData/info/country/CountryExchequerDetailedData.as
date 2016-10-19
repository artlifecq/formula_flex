package com.rpgGame.coreData.info.country
{
	import app.message.CountryExchequerLogProto;
	import app.message.CountryExchequerLogProto.CountryExchequerLogType;

	/**
	 * 国库明细数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-21 下午2:50:25
	 *
	 */
	public class CountryExchequerDetailedData
	{
		/**
		 * 时间
		 */
		public var time : Number;
		/**
		 * 事件类型
		 */
		public var type : int;
		/**
		 * 收支
		 */
		public var amount : Number;

		public function CountryExchequerDetailedData()
		{
		}

		public function setConfig(cfg : CountryExchequerLogProto) : void
		{
			time = cfg.time ? cfg.time.toNumber() : 0;
			type = cfg.type;
			amount = cfg.amount ? cfg.amount.toNumber() : 0;
		}

		public static function getTipByType(type : int) : String
		{
			switch (type)
			{
				case CountryExchequerLogType.BASE_MAINTAIN_FEE:
					return "基础维护费";
				case CountryExchequerLogType.JIN_WEI_SALARY_FREEZE:
					return "禁卫军俸禄冻结";
				case CountryExchequerLogType.JIN_WEI_SALARY_LEFT:
					return "禁卫军俸禄结余";
				case CountryExchequerLogType.COUNTRY_WAR:
					return "国战费用";
				case CountryExchequerLogType.COUNTRY_WAR_WIN:
					return "国战抢劫";
				case CountryExchequerLogType.COUNTRY_WAR_FAIL:
					return "国战被抢";
				case CountryExchequerLogType.DONATE:
					return "捐献";
				case CountryExchequerLogType.MILITARY:
					return "军费";
				case CountryExchequerLogType.EXCHEQUER_LEFT:
					return "国库结余";
				case CountryExchequerLogType.TAX:
					return "税收";
				case CountryExchequerLogType.UNION:
					return "结盟";
				case CountryExchequerLogType.CHANGE_KING:
					return "换国王";
			}
			return "";
		}
	}
}
