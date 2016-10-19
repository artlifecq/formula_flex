package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import flash.utils.Dictionary;
	
	import app.message.SpellCategoryLearnProto;
	import app.message.SpellLearnConfig;
	import app.message.SpellLearnProto;
	import app.message.SpellLearnRaceProto;
	import app.message.SpellProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 技能数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class SpellDataManager
	{
		/** 所有技能数据 **/
		private static var _map:HashMap = new HashMap();
		/** 技能洗点消耗 **/
		public static var clearSpellCost:UpgradeProtoInfo;
		/** 技能洗点免费等级<该等级，可以免费洗点 **/
		public static var clearSpellFreeLevel:int;

		public function SpellDataManager()
		{
		}

		/**
		 * 设置学习的技能数据 
		 * @param cfg
		 * 
		 */		
		public static function setConfig(cfg : SpellLearnConfig) : void
		{
			if (cfg == null)
				return;
			clearSpellFreeLevel = cfg.clearSpellFreeLevel;
			clearSpellCost = new UpgradeProtoInfo();
			clearSpellCost.setProto(cfg.clearSpellCost);

			for each (var dataProto : SpellLearnRaceProto in cfg.raceSpells)
			{
				addLearnRaceData(dataProto);
			}
		}

		/**
		 * 添加技能数据 
		 * @param dataProto
		 * 
		 */		
		private static function addLearnRaceData(dataProto : SpellLearnRaceProto) : void
		{
			_map.add(dataProto.race, dataProto);
		}

		/**
		 * 得到当前职业所有的技能
		 * @param race
		 * @return
		 *
		 */
		public static function getRaceData(race : int) : SpellLearnRaceProto
		{
			return _map.getValue(race);
		}

		
		/**
		 * 获取所有技能数据 
		 * @return 
		 * 
		 */		
		private static function getAllSpellData():Array
		{
			return _map.getValues();
		}
		
		/**
		 * 得到当前职业基础系技能数据 
		 * 
		 */		
		public static function getBasisSpellDataByRace( race:int ):Array
		{
			var arr:Array = [];
			var spellData:SpellLearnRaceProto = getRaceData( race );
			if( spellData != null && spellData.categories.length > 0 )
			{
				var spellCategoryLearnProto:SpellCategoryLearnProto;
				for ( var i:int = 0; i < spellData.categories.length; i++ ) 
				{
					if( i == 0 )
						arr.push( spellData.categories[i] );
				}
			}
			return arr;
		}
		
		/**
		 * 得到当前职业非基础系技能数据
		 * 
		 */		
		public static function getRemainingSpellDataByRace( race:int ):Array
		{
			var arr:Array = [];
			var spellData:SpellLearnRaceProto = getRaceData( race );
			if( spellData != null && spellData.categories.length > 0 )
			{
				var spellCategoryLearnProto:SpellCategoryLearnProto;
				for ( var i:int = 0; i < spellData.categories.length; i++ ) 
				{
					if( i > 0 )
						arr.push( spellData.categories[i] );
				}
			}
			return arr;
		}
		
		
		private static var spellMaxLevelByType : Dictionary;

		/**
		 * 得到某个技能的最大等级
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellMaxLevel(spellType : uint) : int
		{
			if (!spellMaxLevelByType)
			{
				spellMaxLevelByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];

						len3 = categoryProto.spells.length;
						spellProto = categoryProto.spells[len3 - 1];
						spellMaxLevelByType[spellProto.spell.spellType] = spellProto.spell.spellLevel;
					}
				}
			}
			var value : * = spellMaxLevelByType[spellType];
			if (value)
				return value;
			return 0;
		}

		private static var preSpellTypeByType : Dictionary;

		/**
		 * 得到某个技能的前置技能
		 * @param spellType
		 * @return
		 *
		 */
		public static function getPreSpellType(spellType : uint) : int
		{
			if (!preSpellTypeByType)
			{
				preSpellTypeByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];
						len3 = categoryProto.spells.length;
						if (len3 > 0)
						{
							spellProto = categoryProto.spells[0];
							preSpellTypeByType[spellProto.spell.spellType] = spellProto.preSpellType;
						}
					}
				}
			}
			var value : * = preSpellTypeByType[spellType];
			if (value)
				return value;
			return -1;
		}

		private static var preSpellLevelByType : Dictionary;

		/**
		 * 得到某个技能的前置技能所需的等级
		 * @param spellType
		 * @return
		 *
		 */
		public static function getPreSpellLevel(spellType : uint) : int
		{
			if (!preSpellLevelByType)
			{
				preSpellLevelByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];

						len3 = categoryProto.spells.length;
						if (len3 > 0)
						{
							spellProto = categoryProto.spells[0];
							preSpellLevelByType[spellProto.spell.spellType] = spellProto.preSpellLevel;
						}
					}
				}
			}
			var value : * = preSpellLevelByType[spellType];
			if (value)
				return value;
			return -1;
		}

		private static var preSpellMutexIndexByType : Dictionary;

		/**
		 * 得到某个技能 互斥条件，所引
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellMutexIndex(spellType : uint) : Array
		{
			if (!preSpellMutexIndexByType)
			{
				preSpellMutexIndexByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];

						len3 = categoryProto.spells.length;
						if (len3 > 0)
						{
							spellProto = categoryProto.spells[0];
							preSpellMutexIndexByType[spellProto.spell.spellType] = [categoryProto.mutex, j];
						}
					}
				}
			}
			var value : * = preSpellMutexIndexByType[spellType];
			if (value)
				return value;
			return [-1, -1];
		}

		private static var categoryCostSpellPointByType : Dictionary;

		/**
		 * 得到某个技能 学习该技能需要的前置该系技能花费的技能点
		 * @param spellType
		 * @return
		 *
		 */
		public static function getCategoryCostSpellPoint(spellType : uint) : int
		{
			if (!categoryCostSpellPointByType)
			{
				categoryCostSpellPointByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];

						len3 = categoryProto.spells.length;
						if (len3 > 0)
						{
							spellProto = categoryProto.spells[0];
							categoryCostSpellPointByType[spellProto.spell.spellType] = spellProto.categoryCostSpellPoint;
						}
					}
				}
			}
			var value : * = categoryCostSpellPointByType[spellType];
			if (value)
				return value;
			return 0;
		}

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellData(spellType : uint) : SpellProto
		{
			var spellLearnProto : SpellLearnProto = getSpellLearnData(spellType);
			return spellLearnProto ? spellLearnProto.spell : null;
		}

		private static var spellLearnDataByType : Dictionary;

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellLearnData(spellType : uint) : SpellLearnProto
		{
			if (!spellLearnDataByType)
			{
				spellLearnDataByType = new Dictionary();
				var learnProtArr : Array = _map.getValues();
				var len : int = learnProtArr.length;
				var len2 : int;
				var len3 : int;

				var learmProto : SpellLearnRaceProto;
				var categoryProto : SpellCategoryLearnProto;
				var spellProto : SpellLearnProto;

				for (var i : int = 0; i < len; i++)
				{
					learmProto = learnProtArr[i];

					len2 = learmProto.categories.length;
					for (var j : int = 0; j < len2; j++)
					{
						categoryProto = learmProto.categories[j];

						len3 = categoryProto.spells.length;
						if (len3 > 0)
						{
							spellProto = categoryProto.spells[0];
							spellLearnDataByType[spellProto.spell.spellType] = spellProto;
						}
					}
				}
			}
			var value : * = spellLearnDataByType[spellType];
			if (value)
				return value;
			return null;
		}

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellName(spellType : uint) : String
		{
			var spellLearnProto : SpellLearnProto = getSpellLearnData(spellType);
			return spellLearnProto ? spellLearnProto.spell.name : null;
		}
	}
}
