package com.rpgGame.coreData.info.country.countryWar
{
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	
	import app.message.CountryWarProto;
	import app.message.CountryWarRecordProto;

	/**
	 *
	 * 国战信息数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-14 上午10:30:12
	 *
	 */
	public class CountryWarInfoData
	{
		/** 国战类型 0-国战，1-复仇战 **/
		public var warType : int;
		/** 进攻方**/
		public var attackCountry : int;
		/** 防守方**/
		public var defenceCountry : int;
		/** 战胜国**/
		public var winCountry : int;
		/** 战败国**/
		public var failCountry : int;
		private var _warStartTime : Number;

		public function get warStartTime():Number
		{
			return _warStartTime;
		}


		/** 国战开始时间**/
		public function set warStartTime(value:Number):void
		{
			_warStartTime = value;
			warEndTime = warStartTime + CountryWarCfgData.warDuration;
		}

		/** 国战结束时间**/
		public var warEndTime : Number;

		public function CountryWarInfoData()
		{
		}

		public function setCountryWarConfig(proto : CountryWarProto) : void
		{
			warType = proto.warType;
			attackCountry = proto.attackCountry;
			defenceCountry = proto.defenceCountry;
			warStartTime = proto.startTime.toNumber();
		}

		public function setRecentRecordsConfig(proto : CountryWarRecordProto) : void
		{
			attackCountry = proto.attackCountry;
			defenceCountry = proto.defenceCountry;
			warEndTime = proto.time.toNumber();
			winCountry = proto.winCountry;
			failCountry = (winCountry == attackCountry ? defenceCountry : attackCountry);
		}
	}
}
