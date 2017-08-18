package com.rpgGame.coreData.info.society
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangSociety;
	
	import app.message.FamilyBuildingType;

	/**
	 *
	 * 帮派建筑数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-03-01 上午10:30:12
	 *
	 */
	public class SocietyBuildData
	{
		public function SocietyBuildData()
		{
		}

		/**
		 * 得到当前建筑的中文
		 * @param type	FamilyBuildingType
		 * @return
		 *
		 */
		public static function getBuildName(type : int) : String
		{
			switch (type)
			{
				case FamilyBuildingType.HALL:
					return LanguageConfig.getText(LangSociety.SOCIETY_HALL_NAME);
				case FamilyBuildingType.COLLAGE:
					return LanguageConfig.getText(LangSociety.SOCIETY_COLLAGE_NAME);
				case FamilyBuildingType.BIAO:
					return LanguageConfig.getText(LangSociety.SOCIETY_BIAO_NAME);
				case FamilyBuildingType.ANIMAL_BAR:
					return LanguageConfig.getText(LangSociety.SOCIETY_ANIMAL_BAR_NAME);
			}
			return "未知";
		}
	}
}
