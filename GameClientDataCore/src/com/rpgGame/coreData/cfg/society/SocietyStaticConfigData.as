package com.rpgGame.coreData.cfg.society
{
	import app.message.FamilyConfig;
	import app.message.FamilyMiscProto;
	import app.message.AllFamilyAnimalBarDatasProto.FamilyAnimalBarLevelDataProto;
	import app.message.AllFamilyBiaoDatasProto.FamilyBiaoLevelDataProto;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageLevelDataProto;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto;
	import app.message.AllFamilyHallDatasProto.FamilyHallLevelDataProto;
	import app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto;

	/**
	 *
	 * 帮派静态配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-01 上午10:30:12
	 *
	 */
	public class SocietyStaticConfigData
	{
		private static var _cfg : FamilyConfig;
		/**
		 * 乱七八糟的数据
		 */
		private static var _misc : FamilyMiscProto;

		/**
		 * 设置家族配置数据
		 * @param cfg
		 *
		 */
		public static function setConfig(cfg : FamilyConfig) : void
		{
			_cfg = cfg;
			_misc = _cfg.familyMisc;

			SocietyMiscCfgData.setConfig(_misc);
		}

		/**
		 * 官员权限等数据
		 * @param pos
		 * @return
		 *
		 */
		public static function getFamilyOfficerDataByPos(pos : int) : FamilyOfficerDataProto
		{
			for each (var officerDataProto : FamilyOfficerDataProto in _cfg.familyOfficers.data)
			{
				if (officerDataProto.pos == pos)
					return officerDataProto;
			}
			return null;
		}

		/**
		 * 大厅等级数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildHallLevelData(level : int) : FamilyHallLevelDataProto
		{
			if (_cfg && _cfg.familyHall && _cfg.familyHall.levelData && level > 0 && level <= _cfg.familyHall.levelData.length)
				return _cfg.familyHall.levelData[level - 1];
			return null;
		}

		/**
		 * 书院等级数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildCollageLevelData(level : int) : FamilyCollageLevelDataProto
		{
			if (_cfg && _cfg.familyCollage && _cfg.familyCollage.levelData && level > 0 && level <= _cfg.familyCollage.levelData.length)
				return _cfg.familyCollage.levelData[level - 1];
			return null;
		}

		/**
		 * 书院最大等级
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildCollageMaxLevel() : int
		{
			if (_cfg && _cfg.familyCollage && _cfg.familyCollage.levelData)
				return _cfg.familyCollage.levelData.length;
			return null;
		}

		/**
		 * 最大书院技能等级
		 * @return
		 *
		 */
		public static function getMaxCollageSpellLevel() : int
		{
			if (_cfg && _cfg.familyCollage && _cfg.familyCollage.spellDatas)
				return _cfg.familyCollage.spellDatas.length;
			return 0;
		}

		/**
		 * 书院等级对应的所有技能数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildCollageSpellDatas(level : int) : FamilyCollageSpellDatasProto
		{
			if (_cfg && _cfg.familyCollage && _cfg.familyCollage.spellDatas && level > 0 && level <= _cfg.familyCollage.spellDatas.length)
				return _cfg.familyCollage.spellDatas[level - 1];
			return null;
		}

		/**
		 * 书院等级和技能类型对应的技能数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildCollageSpellData(level : int, spellLevel : int) : FamilyCollageSpellDataProto
		{
			var familyCollageSpellDatasProto : FamilyCollageSpellDatasProto = getBuildCollageSpellDatas(level);
			if (familyCollageSpellDatasProto)
			{
				for each (var collageSpellDataProto : FamilyCollageSpellDataProto in familyCollageSpellDatasProto.spellData)
				{
					if (collageSpellDataProto.level == spellLevel)
						return collageSpellDataProto;
				}
			}
			return null;
		}

		/**
		 * 镖车等级数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildBiaoLevelData(level : int) : FamilyBiaoLevelDataProto
		{
			if (_cfg && _cfg.familyBiao && _cfg.familyBiao.levelData && level > 0 && level <= _cfg.familyBiao.levelData.length)
				return _cfg.familyBiao.levelData[level - 1];
			return null;
		}

		/**
		 * 兽栏等级数据
		 * @param level
		 * @return
		 *
		 */
		public static function getBuildAnimalBarLevelData(level : int) : FamilyAnimalBarLevelDataProto
		{
			if (_cfg && _cfg.familyAnimalBar && _cfg.familyAnimalBar.levelData && level > 0 && level <= _cfg.familyAnimalBar.levelData.length)
				return _cfg.familyAnimalBar.levelData[level - 1];
			return null;
		}
	}
}
