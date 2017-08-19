package com.rpgGame.core.utils
{
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.type.PKModeType;

	public class PKModeUtil
	{
		public static function getPKModeInfo(type : uint) : String
		{
			switch (type)
			{
				case PKModeType.PEACE:
					return "和平";
//				case PKModeType.COUNTRY:
//					return "国家";
//				case PKModeType.ALLIANCE:
					return "盟国";
				case PKModeType.ALL:
					return "全体";
				case PKModeType.TEAM:
					return "组队";
				case PKModeType.GUILD:
					return "帮派";
				case PKModeType.FAMILY:
					return "家族";
				case PKModeType.KIND_OR_EVIL:
					return "善恶";
				case PKModeType.DIFFERENT_SEVER:
					return "跨服";
			}

			return "未知";
		}

		public static function getPKModeName(type : int) : String
		{
			switch (type)
			{
				case PKModeType.PEACE:
					return "和平模式";
//				case PKModeType.COUNTRY:
//					return "国家模式";
//				case PKModeType.ALLIANCE:
//					return "盟国模式";
				case PKModeType.ALL:
					return "全体模式";
				case PKModeType.TEAM:
					return "组队模式";
				case PKModeType.GUILD:
					return "帮派模式";
				case PKModeType.FAMILY:
					return "家族模式";
				case PKModeType.KIND_OR_EVIL:
					return "善恶模式";
				case PKModeType.DIFFERENT_SEVER:
					return "跨服模式";
			}

			return "未知";
		}

		public static function getPKModeColor(type : int) : uint
		{
			switch (type)
			{
				case PKModeType.PEACE:
					return StaticValue.PEACE;
//				case PKModeType.COUNTRY:
//					return StaticValue.COUNTRY;
//				case PKModeType.ALLIANCE:
					return StaticValue.ALLIANCE;
				case PKModeType.ALL:
					return StaticValue.ALL;
				case PKModeType.TEAM:
					return StaticValue.TEAM;
				case PKModeType.GUILD:
					return StaticValue.GUILD;
				case PKModeType.FAMILY:
					return StaticValue.FAMILY;
				case PKModeType.KIND_OR_EVIL:
					return StaticValue.KIND_OR_EVIL;
				case PKModeType.DIFFERENT_SEVER:
					return StaticValue.DIFFERENT_SEVER;
			}

			return StaticValue.RED_TEXT;//注:请到时候重新根据设计在StaticValue里配置颜色
		}

		public static function getPKModeDesc(type : int) : String
		{
			switch (type)
			{
				case PKModeType.PEACE:
					return "【和平模式】你的攻击不会对其他玩家造成伤害";
//				case PKModeType.COUNTRY:
//					return "【国家模式】你的攻击不会对本国同胞造成伤害";
//				case PKModeType.ALLIANCE:
//					return "【盟国模式】你的攻击不会对本国、盟国同胞造成伤害";
				case PKModeType.ALL:
					return "【全体模式】你的攻击会对所有玩家造成伤害";
				case PKModeType.TEAM:
					return "【组队模式】你的攻击不会对队友造成伤害";
				case PKModeType.GUILD:
					return "【帮派模式】你的攻击不会对本帮成员造成伤害";
				case PKModeType.FAMILY:
					return "【家族模式】你的攻击不会对本家族成员造成伤害";
				case PKModeType.KIND_OR_EVIL:
					return "【善恶模式】你的攻击只会对红名、灰名玩家造成伤害";
				case PKModeType.DIFFERENT_SEVER:
					return "【跨服模式】你的攻击只会对其他服务器的玩家造成伤害";
			}
			return "未知Pk模式";
		}

		public static function getPKAmountTypeName(pkAmountType : uint) : String
		{
			switch (pkAmountType)
			{
				case PKModeType.AMOUNT_WITHE:
					return "风范国民";
				case PKModeType.AMOUNT_GREEN:
					return "与人为善";
				case PKModeType.AMOUNT_YELLOW:
					return "凶神恶煞";
				case PKModeType.AMOUNT_RED:
					return "恶贯满盈";
				case PKModeType.AMOUNT_GRAY:
					return "一念之间";
			}
			return "风范国民";
		}

		public static function getPKAmountColor(pkAmountType : int) : uint
		{
			switch (pkAmountType)
			{
				case PKModeType.AMOUNT_WITHE:
					return StaticValue.BEIGE_TEXT;
				case PKModeType.AMOUNT_GREEN:
					return StaticValue.GREEN_TEXT;
				case PKModeType.AMOUNT_YELLOW:
					return StaticValue.YELLOW_TEXT;
				case PKModeType.AMOUNT_GRAY:
					return StaticValue.GRAY_TEXT;
				case PKModeType.AMOUNT_RED:
					return StaticValue.RED_TEXT;
			}
			return StaticValue.RED_TEXT;//注:请到时候重新根据设计在StaticValue里配置颜色
		}
	}
}
