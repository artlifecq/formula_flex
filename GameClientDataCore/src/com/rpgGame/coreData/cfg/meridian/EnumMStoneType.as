package com.rpgGame.coreData.cfg.meridian
{
	public class EnumMStoneType
	{
		public function EnumMStoneType()
		{
		}
		public static const T_ATTACK:int=1;
		public static const T_DEFENSE:int=2;
		public static const T_HP:int=3;
		public static const T_CRIT:int=4;
		public static const T_CRIT_HURT:int=5;
		public static const T_HIT:int=6;
		public static const T_DODGE:int=7;
		
		public static function getStoneTypeName(type:int):String
		{
			switch(type)
			{
				case T_ATTACK:
				{
					return "攻击砭石"
					break;
				}
				case T_DEFENSE:
				{
					return "防御砭石"
					break;
				}
				case T_HP:
				{
					return "生命砭石"
					break;
				}
				case T_CRIT:
				{
					return "暴击砭石"
					break;
				}
				case T_CRIT_HURT:
				{
					return "爆伤砭石"
					break;
				}
				case T_HIT:
				{
					return "命中砭石"
					break;
				}
				case T_DODGE:
				{
					return "闪避砭石"
					break;
				}
				default:
				{
					return "未知石头类型"+type;
					break;
				}
			}
		}
	}
}