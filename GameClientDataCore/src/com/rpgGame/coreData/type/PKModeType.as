package com.rpgGame.coreData.type
{
	

	public class PKModeType
	{
		/** 未知PK模式(默认) */
		public static const UNKNOWN:int = 0;
		/** 和平模式 */
		public static const PEACE:int = 1;
		/** 国家模式 */		
		public static const COUNTRY:int = 2;
		/** 盟国模式 */
		public static const ALLIANCE:int = 3;
		/** 全体模式 */
		public static const ALL:int = 4;
		/** 组队模式 */
		public static const TEAM:int = 5;
		/** 帮派模式 */
		public static const GUILD:int = 6;
		/** 家族模式 */
		public static const FAMILY:int = 7;
		/** 善恶模式 */
		public static const KIND_OR_EVIL:int = 8;
		/** 跨服模式 */
		public static const DIFFERENT_SEVER:int = 9;
		
		
		/** PK值类型名称 */
//		public static const AMOUNT_UNKNOWN:int = 0;
		/** 风范国民 */
		public static const AMOUNT_WITHE:int = 0;
		/** 与人为善 */		
		public static const AMOUNT_GREEN:int = 1;
		/**凶神恶煞 */
		public static const AMOUNT_YELLOW:int = 2;
		/** 一念之间 */
		public static const AMOUNT_GRAY:int = 3;
		/** 恶贯满盈 */
		public static const AMOUNT_RED:int = 4;
		
		public function PKModeType()
		{
			
		}
	}
}