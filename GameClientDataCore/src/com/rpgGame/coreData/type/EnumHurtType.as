package com.rpgGame.coreData.type
{
	public class EnumHurtType
	{
		//0-成功 1-MISS 2-跳闪 4-暴击 8-格挡6-跳闪+暴击 12-格挡+暴击
		/** 普通，客户端显示掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_NORMAL : uint = 0x00000000;
		/** 闪避，客户端显示闪避，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_MISS : uint = 0x00000001;
		/** 跳闪，客户端显示跳闪，反推不需要加入计算  **/
		public static const SPELL_HURT_TYPE_JUMP_SHIELD : uint = 0x00000002;
		/** 暴击，客户端显示暴击掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_CRIT : uint = 0x00000004;
		/** 格挡 **/
		public static const SPELL_HURT_TYPE_REBOUND : uint = 0x00000008;
		
		/** 无敌 **/
		public static const SPELL_HURT_TYPE_INVINCIBLE : uint = 0x00000010;
		
		/** 吸收伤害,护盾 **/
		public static const SPELL_SHEILD_XISHOU : uint = 0x00000020;
		
		/** 秒杀 **/
		public static const SPELL_SEC : uint = 0x00000040;
		
		/** 吸收伤害,服务器没用了 **/
		public static const SPELL_HURT_TYPE_ABSORB : uint = 0x00000080;
		
		/** 连击 **/
		public static const SPELL_COMBO : uint = 0x00000100;
		
		
		
		public static const SPELL_ZHANHUN:uint= 0x00000200;
		
		/**
		 *伤害类型 
		 */
		public static const SPELL_HURT_TYPES:Array=[SPELL_HURT_TYPE_NORMAL,SPELL_HURT_TYPE_MISS,
			SPELL_HURT_TYPE_JUMP_SHIELD,SPELL_HURT_TYPE_CRIT,SPELL_HURT_TYPE_REBOUND,SPELL_HURT_TYPE_INVINCIBLE,
			SPELL_SHEILD_XISHOU,SPELL_SEC,SPELL_COMBO,SPELL_ZHANHUN
		];
		
		/** 3.重击，客户端显示暴击掉血，反推需要加入计算 **/
		public static const SPELL_HURT_TYPE_THUMP : int = 3;
		/** 6.物理免疫，客户端显示物理免疫，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_PHYSICAL_IMMUNE : int = 6;
		/** 7.法术免疫，客户端显示法术免疫，反推不需要加入计算 **/
		public static const SPELL_HURT_TYPE_MAGICAL_IMMUNE : int = 7;
		//--------------------------------------------------
		//飘字属性类型
		/** 经验 **/
		public static const EXP : String = "te_bie_jing_yan_jia_cheng";
		/** 回血 **/
		public static const ADDHP : String = "add_hp";
		/** 掉血**/
		public static const SUBHP : String = "sub_hp";
		/** 回蓝 **/
		public static const ADDMP : String = "fa_shu_zhi";
		/** 礼金 **/
		public static const GOLD : String = "res_bind_gold";
	}
}
