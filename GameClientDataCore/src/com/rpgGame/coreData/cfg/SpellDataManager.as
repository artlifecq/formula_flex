package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
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
//		public static var clearSpellCost:UpgradeProtoInfo;
		/** 技能洗点免费等级<该等级，可以免费洗点 **/
//		public static var clearSpellFreeLevel:int;

		public function SpellDataManager()
		{
		}

		/**
		 * 设置学习的技能数据 
		 * @param cfg
		 * 
		 */		
		public static function setConfig(data : ByteArray) : void
		{
			var arr:Array = data.readObject();
			if (arr == null)
				return;

			for each (var skillData : Q_skill_model in arr)
			{
				_map.add(skillData.q_skillID,skillData);
			}
		}

		/**
		 * 添加技能数据 
		 * @param dataProto
		 * 
		 */		
//		private static function addLearnRaceData(dataProto : SpellLearnRaceProto) : void
//		{
//			_map.add(dataProto.race, dataProto);
//		}

		/**
		 * 得到当前职业所有的技能
		 * @param race
		 * @return
		 *
		 */
//		public static function getRaceData(race : int) : Q_skill_model
//		{
//			return _map.getValue(race);
//		}

		
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
//		public static function getBasisSpellDataByRace( race:int ):Array
//		{
//			var arr:Array = [];
//			var spellData:SpellLearnRaceProto = getRaceData( race );
//			if( spellData != null && spellData.categories.length > 0 )
//			{
//				var spellCategoryLearnProto:SpellCategoryLearnProto;
//				for ( var i:int = 0; i < spellData.categories.length; i++ ) 
//				{
//					if( i == 0 )
//						arr.push( spellData.categories[i] );
//				}
//			}
//			return arr;
//		}
		
		/**
		 * 得到当前职业非基础系技能数据
		 * 
		 */		
//		public static function getRemainingSpellDataByRace( race:int ):Array
//		{
//			var arr:Array = [];
//			var spellData:SpellLearnRaceProto = getRaceData( race );
//			if( spellData != null && spellData.categories.length > 0 )
//			{
//				var spellCategoryLearnProto:SpellCategoryLearnProto;
//				for ( var i:int = 0; i < spellData.categories.length; i++ ) 
//				{
//					if( i > 0 )
//						arr.push( spellData.categories[i] );
//				}
//			}
//			return arr;
//		}
		
		
		private static var spellMaxLevelByType : Dictionary;

		/**
		 * 得到某个技能的最大等级
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getSpellMaxLevel(spellType : uint) : int
//		{
//			if (!spellMaxLevelByType)
//			{
//				spellMaxLevelByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				var learmProto : SpellLearnRaceProto;
//				var categoryProto : SpellCategoryLearnProto;
//				var spellProto : SpellLearnProto;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//
//						len3 = categoryProto.spells.length;
//						spellProto = categoryProto.spells[len3 - 1];
//						spellMaxLevelByType[spellProto.spell.spellType] = spellProto.spell.spellLevel;
//					}
//				}
//			}
//			var value : * = spellMaxLevelByType[spellType];
//			if (value)
//				return value;
//			return 0;
//		}

		private static var preSpellTypeByType : Dictionary;

		/**
		 * 得到某个技能的前置技能
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getPreSpellType(spellType : uint) : int
//		{
//			if (!preSpellTypeByType)
//			{
//				preSpellTypeByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				var learmProto : SpellLearnRaceProto;
//				var categoryProto : SpellCategoryLearnProto;
//				var spellProto : SpellLearnProto;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//						len3 = categoryProto.spells.length;
//						if (len3 > 0)
//						{
//							spellProto = categoryProto.spells[0];
//							preSpellTypeByType[spellProto.spell.spellType] = spellProto.preSpellType;
//						}
//					}
//				}
//			}
//			var value : * = preSpellTypeByType[spellType];
//			if (value)
//				return value;
//			return -1;
//		}

		private static var preSpellLevelByType : Dictionary;

		/**
		 * 得到某个技能的前置技能所需的等级
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getPreSpellLevel(spellType : uint) : int
//		{
//			if (!preSpellLevelByType)
//			{
//				preSpellLevelByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				var learmProto : SpellLearnRaceProto;
//				var categoryProto : SpellCategoryLearnProto;
//				var spellProto : SpellLearnProto;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//
//						len3 = categoryProto.spells.length;
//						if (len3 > 0)
//						{
//							spellProto = categoryProto.spells[0];
//							preSpellLevelByType[spellProto.spell.spellType] = spellProto.preSpellLevel;
//						}
//					}
//				}
//			}
//			var value : * = preSpellLevelByType[spellType];
//			if (value)
//				return value;
//			return -1;
//		}

		private static var preSpellMutexIndexByType : Dictionary;

		/**
		 * 得到某个技能 互斥条件，所引
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getSpellMutexIndex(spellType : uint) : Array
//		{
//			if (!preSpellMutexIndexByType)
//			{
//				preSpellMutexIndexByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				var learmProto : SpellLearnRaceProto;
//				var categoryProto : SpellCategoryLearnProto;
//				var spellProto : SpellLearnProto;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//
//						len3 = categoryProto.spells.length;
//						if (len3 > 0)
//						{
//							spellProto = categoryProto.spells[0];
//							preSpellMutexIndexByType[spellProto.spell.spellType] = [categoryProto.mutex, j];
//						}
//					}
//				}
//			}
//			var value : * = preSpellMutexIndexByType[spellType];
//			if (value)
//				return value;
//			return [-1, -1];
//		}

		private static var categoryCostSpellPointByType : Dictionary;

		/**
		 * 得到某个技能 学习该技能需要的前置该系技能花费的技能点
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getCategoryCostSpellPoint(spellType : uint) : int
//		{
//			if (!categoryCostSpellPointByType)
//			{
//				categoryCostSpellPointByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				var learmProto : SpellLearnRaceProto;
//				var categoryProto : SpellCategoryLearnProto;
//				var spellProto : SpellLearnProto;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//
//						len3 = categoryProto.spells.length;
//						if (len3 > 0)
//						{
//							spellProto = categoryProto.spells[0];
//							categoryCostSpellPointByType[spellProto.spell.spellType] = spellProto.categoryCostSpellPoint;
//						}
//					}
//				}
//			}
//			var value : * = categoryCostSpellPointByType[spellType];
//			if (value)
//				return value;
//			return 0;
//		}

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellData(spellID : uint) : Q_skill_model
		{
			var skillData:Q_skill_model = _map.getValue(spellID);
			return skillData ? skillData : null;
		}
		
		public static function getSpellEffectData(spellID : uint):Q_SpellEffect
		{
			var skillData:Q_skill_model = _map.getValue(spellID);
			
			return SpellEffectDataManager.getData(skillData.q_spell_effect);
		}
		
		public static function getSpellEffectID(spellID : uint):int
		{
			var skillData:Q_skill_model = _map.getValue(spellID);
			return skillData.q_spell_effect;
		}
		
		public static function getRelateSpells(relateSpellStr : String):Vector.<Q_skill_model>
		{
			var relateSpells:Vector.<Q_skill_model> = new Vector.<Q_skill_model>();
			
			if(relateSpellStr != "")
			{
				var skillIDs:Array = relateSpellStr.split(",");
				for(var i:int=0;i<skillIDs.length;i++)
				{
					relateSpells.push(SpellDataManager.getSpellData(int(skillIDs[i])));
				}
			}
			return relateSpells;
		}

		private static var spellLearnDataByType : Dictionary;

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
//		public static function getSpellLearnData(spellID : uint) : Q_skill_model
//		{
//			if (!spellLearnDataByType)
//			{
//				spellLearnDataByType = new Dictionary();
//				var learnProtArr : Array = _map.getValues();
//				var len : int = learnProtArr.length;
//				var len2 : int;
//				var len3 : int;
//
//				for (var i : int = 0; i < len; i++)
//				{
//					learmProto = learnProtArr[i];
//
//					len2 = learmProto.categories.length;
//					for (var j : int = 0; j < len2; j++)
//					{
//						categoryProto = learmProto.categories[j];
//
//						len3 = categoryProto.spells.length;
//						if (len3 > 0)
//						{
//							spellProto = categoryProto.spells[0];
//							spellLearnDataByType[spellProto.spell.spellType] = spellProto;
//						}
//					}
//				}
//			}
//			var value : * = spellLearnDataByType[spellType];
//			if (value)
//				return value;
//			return null;
//		}

		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellName(spellID : uint) : String
		{
			var spellData : Q_skill_model = getSpellData(spellID);
			return spellData ? spellData.q_skillName : null;
		}
	}
}
