package com.rpgGame.coreData.type.item
{
	/**
	 *
	 * 药品使用效果
	 * @author fly.liuyang
	 * 创建时间：2014-7-21 下午3:42:20
	 * 
	 */
	public class MedicEfficacyType
	{
		//药水效果 
		/** 加血 ： 1 */
		public static const EFFICACY_ADD_LIFE:int = 1;
		/** 加Buff ： 2 */
		public static const EFFICACY_ADD_BUFF:int = 2;
		/** 减少PK值  ： 3 */
		public static const EFFICACY_REDUCE_PK:int = 3;
		/** 加EXP值  ： 5 */
		public static const EFFICACY_ADD_EXP:int = 5;
		/** 加真气值  ： 6 */
		public static const EFFICACY_ADD_REAL_AIR:int = 6;
		/** 加铜钱  ： 7 */
		public static const EFFICACY_ADD_MONEY:int = 7;
		/** 加礼金  ： 8 */
		public static const EFFICACY_ADD_LIJIN:int = 8;
		/** 加帮会历练值  ： 9 */
		public static const EFFICACY_ADD_GUILD_LILIAN:int = 9;
		/** 加帮会贡献值  ： 10 */
		public static const EFFICACY_ADD_GUILD_CONTRIBUTION:int = 10;
		/** 加 体力值  ： 11 */
		public static const EFFICACY_ADD_STAMINA:int = 11;
		/** 加 跳闪值  ：12 */
		public static const EFFICACY_ADD_JUMP_SHIELD:int = 12;
		/** 大还丹（直接升级）  ： 21 */
		public static const EFFICACY_ADD_LEVEL:int = 21;
		/** 属性丹  ： 22 */
		public static const EFFICACY_ADD_STAT:int = 22;
	}
}