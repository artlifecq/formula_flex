package com.rpgGame.coreData.info.society
{
	import com.rpgGame.coreData.SpriteStat;

	/**
	 *
	 * 帮派技能数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-19 上午10:30:12
	 *
	 */
	public class SocietySpellData
	{
		/** 索引 **/
		public var index : int;
		/** 学习等级 **/
		public var learnLevel : int;
		/** 最大学习等级 **/
		public var maxLearnLevel : int;
		/** 最大技能书院等级 **/
		public var maxSpellCollageLevel : int;
		/** 当前书院等级 **/
		public var currCollageLevel : int;
		/** 需要书院等级 **/
		public var needCollageLevel : int;
		/** 技能数据 **/
//		public var proto : SpellProto;
		public var spriteStat : SpriteStat;

		public function SocietySpellData()
		{
		}

		/**
		 * 可以学习
		 * @return
		 *
		 */
		public function get canLearn() : Boolean
		{
			return currCollageLevel >= needCollageLevel;
		}
	}
}
