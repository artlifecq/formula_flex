package com.rpgGame.coreData.info.country.country
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.info.crown.CountryMilitaryData;
	import com.rpgGame.coreData.info.crown.CrownJinWeiSetData;
	import com.rpgGame.coreData.lang.LangCountry;
	
	import app.message.CountryDataProto;
	import app.message.CountryMemberProto;
	import app.message.CountryOfficeProto;
	import app.message.CountryPowerType;
	import app.message.OtherCountryDataProto;

	/**
	 *
	 * 国家数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryData
	{
		/**评价区分**/
		private static var KING_EVALUATE : Array;
		/**评价区分对应的显示**/
		private static var KING_EVALUATE_STRING : Array;
		/** 国家 **/
		public var sequence : int;
		/** 实力强弱 **/
		public var powerType : int;
		/** 国力 **/
		public var countryPower : Number;
		/** 经书 **/
		public var jingShu : int;
		/** 结盟信息 **/
		public var unionStatus : CountryUnionStatusData;
		/** 官员数据 **/
		public var officeData : CountryOfficeData;
		/** 国战状态 **/
		public var warStatus : CountryWarStatusData;
		/** 国库 **/
		public var exchequer : CountryExchequerData;
		/** 国家策略 **/
		public var strategy:CountryStrategyData;
		/** 军费补贴 **/
		public var military  : CountryMilitaryData;
		/**禁卫设置**/
		public var jinWeiSet : CrownJinWeiSetData;
		
		/**差评**/
		public var yesterdayBadComments : int;
		/**好评**/
		public var yesterdayGoodComments : int;

		public function CountryData()
		{
			officeData = new CountryOfficeData();
		}

		public function setSelfConfig(cfg : CountryDataProto) : void
		{
			yesterdayBadComments = cfg.yesterdayBadComments;
			yesterdayGoodComments = cfg.yesterdayGoodComments;
			sequence = 0;
			powerType = cfg.powerType;
			countryPower = cfg.countryPower.toNumber();
			jingShu = cfg.jingShu.jingShuCount;
			unionStatus = new CountryUnionStatusData(sequence);
			unionStatus.setSelfConfig(cfg.unionStatus);
			warStatus = new CountryWarStatusData();
			warStatus.setSelfConfig(cfg.warStatus);
			exchequer = new CountryExchequerData();
			exchequer.setConfig(cfg.exchequer);
			strategy = new CountryStrategyData();
			strategy.setConfig(cfg.strategy);
		}

		public function setOtherConfig(cfg : OtherCountryDataProto) : void
		{
			sequence = cfg.sequence;
			powerType = cfg.powerType;
			countryPower = cfg.countryPower.toNumber();
			jingShu = cfg.jingShu.jingShuCount;
			unionStatus = new CountryUnionStatusData(sequence);
			unionStatus.setOtherConfig(cfg.unionStatus);
			warStatus = new CountryWarStatusData();
			warStatus.setOtherConfig(cfg.warStatus);
			exchequer = new CountryExchequerData();
			military = new CountryMilitaryData();
		}

		public function setOfficeData(officeProto : CountryOfficeProto) : void
		{
			officeData.setConfig(officeProto);
		}

		public function setOfficeDataIsKing(memberProto : CountryMemberProto) : void
		{
			officeData.setConfigIsKing(memberProto);
		}

		public function get countryStrong() : String
		{
			return (isStrongCountry ? "强国" : (isWeakCountry ? "弱国" : "普通"));
		}

		public function get isStrongCountry() : Boolean
		{
			return powerType == CountryPowerType.STRONG_COUNTRY;
		}

		public function get isWeakCountry() : Boolean
		{
			return powerType == CountryPowerType.WEAK_COUNTRY;
		}
		
		/**获取民心**/
		public function getKingEvaluate():Number
		{
			if(yesterdayBadComments == 0 && yesterdayBadComments == 0)
				return 0;
			return yesterdayGoodComments/(yesterdayBadComments+yesterdayGoodComments);
		}
		/**获取国王评价**/
		public function getKingEvaluateStr():String
		{
			if(!KING_EVALUATE)
				KING_EVALUATE = LanguageConfig.getText(LangCountry.COUNTRY_KING_EVALUATE).split(",");
			if(!KING_EVALUATE_STRING)
				KING_EVALUATE_STRING = LanguageConfig.getText(LangCountry.COUNTRY_KING_EVALUATE_STRING).split(",");
			var rate : Number = getKingEvaluate() * 100;
			if(rate < int(KING_EVALUATE[0]))
				return KING_EVALUATE_STRING[0];
			else if(rate >= int(KING_EVALUATE[0]) && rate < int(KING_EVALUATE[1]))
				return KING_EVALUATE_STRING[1];
			else
				return KING_EVALUATE_STRING[2];
			return "";
		}
	}
}
