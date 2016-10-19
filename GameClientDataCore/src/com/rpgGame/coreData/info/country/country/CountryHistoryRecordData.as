package com.rpgGame.coreData.info.country.country
{
	import com.game.engine3D.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.lang.LangCountry;
	
	import app.message.CountryHistoryRecordProto;
	import app.message.CountryHistoryType;

	/**
	 *
	 * 国家历史日志数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryHistoryRecordData
	{
		/** 类型 **/
		public var kind : int;
		/** 时间 **/
		public var time : Number;
		/** 内容 **/
		public var content : String;

		public function CountryHistoryRecordData()
		{
		}

		public function setConfig(dataProto : CountryHistoryRecordProto) : void
		{
			this.kind = dataProto.type;
			this.time = dataProto.time ? dataProto.time.toNumber() : 0;
			this.content = "";
			switch (this.kind)
			{
				case CountryHistoryType.HISTORY_PERSONAL:
					this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_WAR_FIRST, dataProto.countryWarFirst.heroName, dataProto.countryWarFirst.killCount);
					break;
				case CountryHistoryType.HISTORY_GUILD:
					this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_GUILD_TOP_RANK, dataProto.guildTopRank.guildName, dataProto.guildTopRank.rank);
					break;
				case CountryHistoryType.HISTORY_COUNTRY:
					this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_JING_SHU, dataProto.countryJingShu.kingName, dataProto.countryJingShu.curJingShuCount, dataProto.countryJingShu.todayRobJingShuCount, dataProto.countryJingShu.todayBeenRobJingShuCount);
					break;
				case CountryHistoryType.HISTORY_COUNTRY_KING_WAR:
					this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_KING_WAR_FIRST, dataProto.countryKingWarFirst.attackGuildName, dataProto.countryKingWarFirst.attackGuildLeaderName);
					//反击战用这个	content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_KING_WAR_REPLACE, dataProto.countryKingWarReplace.attackGuildName, dataProto.countryKingWarReplace.defenceGuildName, dataProto.countryKingWarReplace.attackGuildLeaderName);
					break;
				case CountryHistoryType.HISTORY_EMPEROR_WAR:
					this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_EMPEROR_WAR_WIN, dataProto.emperorWarWin.kingName);
					break;
				case CountryHistoryType.HISTORY_COUNTRY_WAR:
					if (dataProto.hasCountryWarAttackWin)
						this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_WAR_ATTACK_WIN, dataProto.countryWarAttackWin.attackKingName, CountryNameCfgData.getCountryNameById(dataProto.countryWarAttackWin.defenceCountryType), int(dataProto.countryWarAttackWin.warTime.toNumber() / TimeUtil.MINUTE_MICRO_SECONDS), dataProto.countryWarAttackWin.killCount);
					else if (dataProto.hasCountryWarAttackFail)
						this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_WAR_ATTACK_FAIL, dataProto.countryWarAttackFail.attackKingName, CountryNameCfgData.getCountryNameById(dataProto.countryWarAttackFail.defenceCountryType), int(dataProto.countryWarAttackFail.warTime.toNumber() / TimeUtil.MINUTE_MICRO_SECONDS), dataProto.countryWarAttackFail.killCount);
					/*反击战用这个 if (dataProto.hasCountryWarDefenceWin)
						this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_WAR_DEFENCE_WIN, CountryNameCfgData.getCountryNameById(dataProto.countryWarDefenceWin.attackCountryType), dataProto.countryWarDefenceWin.defenceKingName, CountryNameCfgData.getCountryNameById(dataProto.countryWarDefenceWin.attackCountryType));
					else if (dataProto.hasCountryWarDefenceFail)
						this.content = LanguageConfig.getText(LangCountry.COUNTRY_HISTORY_RECORD_COUNTRY_WAR_DEFENCE_FAIL, CountryNameCfgData.getCountryNameById(dataProto.countryWarDefenceFail.attackCountryType), dataProto.countryWarDefenceFail.defenceKingName, int(dataProto.countryWarDefenceFail.warTime.toNumber() / TimeUtil.MINUTE_MICRO_SECONDS), CountryNameCfgData.getCountryNameById(dataProto.countryWarDefenceFail.attackCountryType));*/
					break;
			}
		}
	}
}
