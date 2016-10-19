package com.rpgGame.core.utils
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangMisc;

	import app.message.RaceId;

	public class RaceUtil
	{

		/**
		 * 得到职业名字
		 * @param race
		 * @return
		 *
		 */
		public static function getRaceTitle(race : int) : String
		{
			switch (race)
			{
				case RaceId.ZHONG_JIAN:
					return LanguageConfig.getText(LangMisc.RACE_TITLE1);
				case RaceId.BA_DAO:
					return LanguageConfig.getText(LangMisc.RACE_TITLE2);
				case RaceId.YIN_QIANG:
					return LanguageConfig.getText(LangMisc.RACE_TITLE3);
				case RaceId.YU_SHAN:
					return LanguageConfig.getText(LangMisc.RACE_TITLE4);
				case RaceId.FA_ZHANG:
					return LanguageConfig.getText(LangMisc.RACE_TITLE5);
				case RaceId.SHEN_GONG:
					return LanguageConfig.getText(LangMisc.RACE_TITLE6);
				case RaceId.KUANG_FU:
					return LanguageConfig.getText(LangMisc.RACE_TITLE7);
			}

			return "未知";
		}
	}
}
