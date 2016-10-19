package com.rpgGame.coreData.type
{
	public class EnumHurtType
	{
		/** 0.普通，客户端显示掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_NORMAL : int = 0;
		/** 1.闪避，客户端显示闪避，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_MISS : int = 1;
		/** 2.暴击，客户端显示暴击掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_CRIT : int = 2;
		/** 3.重击，客户端显示暴击掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_THUMP : int = 3;
		/** 4.跳闪，客户端显示跳闪，反推不需要加入计算  **/
		public static const SPELL_HURT_TYPE_JUMP_SHIELD : int = 4;
		/** 5.无敌，客户端显示无敌，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_INVINCIBLE : int = 5;
		/** 6.物理免疫，客户端显示物理免疫，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_PHYSICAL_IMMUNE : int = 6;
		/** 7.法术免疫，客户端显示法术免疫，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_MAGICAL_IMMUNE : int = 7;
		/** 8.反弹，客户端显示掉血，返回需要加入计算 **/
		public static const SPELL_HURT_TYPE_REBOUND : int = 8;
		/** 9.目标吸收伤害，客户端显示掉血，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_ABSORB : int = 9;
		//--------------------------------------------------
		//飘字属性类型
		/** 经验 **/
		public static const EXP : String = "exp";
		/** 回血 **/
		public static const ADDHP : String = "sheng_ming_zhi";
		/** 回蓝 **/
		public static const ADDMP : String = "fa_shu_zhi";
	}
}
