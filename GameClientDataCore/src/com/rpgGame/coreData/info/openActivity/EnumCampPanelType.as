package  com.rpgGame.coreData.info.openActivity
{
	/**
	 * 面板类型 
	 * @author Administrator
	 * 
	 */
	public class EnumCampPanelType
	{
		/********************************
		 * 
		 * 主面板类型,不是活动类型
		 * 
		 ******************************/ 
		
		// 封测活动
		public static const M_CLOSEBETA:int = 1;
		// 首冲
		public static const M_FIRST_BUY:int = 2
		//37平台活动
		public static const M_PLATFORM_37:int=3;
		//37超级会员
		public static const M_SUPER_VIP_37:int=4;
		//开服活动
		public static const M_KAIFU:int=5;
		//七天登录
		public static const M_SEVEN_DAY:int=7;
		//每日首冲
		public static const M_FIRST_BUY_EVERYDAY:int=8;
		//公测送元宝
		public static const M_GONGCE_YUANBAO:int=9;
		
		
		
		/********************************
		 * 
		 * 子面板类型
		 * 
		 ******************************/ 
		//封测子活动,对应表中q_subpanel_type
		/**冲级**/
		public static const SP_LEVELUP_BETA:int = 1;
		/**礼包**/
		public static const SP_GIFT_BETA:int = 2;
		/**元宝**/
		public static const SP_GOLD_BETA:int = 3;
		/**登陆**/
		public static const SP_LOGIN_BETA:int = 4;
		/**BOSS**/
		public static const SP_BOSS_BETA:int = 5;
		/**手机令牌**/
		public static const SP_37_TOKEN:int=6;
		/**37平台vip**/
		public static const SP_37_VIP:int=7;
		/**微端**/
		public static const SP_37_CLIENT:int=8;
		/**手机验证**/
		public static const SP_37_PHONEVERI:int=9;
		
		//开服活动
		/**充值送礼**/
		public static const SP_CHONGZHI:int=10;
		/**首充团购**/
		public static const SP_TUANGOU:int=11;
		/**每日特惠**/
		public static const SP_DISCOUNT:int=12;
		/**巅峰雕像展示**/
		public static const SP_DIAOXIANG:int=13;
		/**战力排行**/
		public static const SP_ZHANLI_RANK:int=14;
		/**神将排行**/
		public static const SP_ACTIVITY_SJPH:int=15;
		/**神将助力**/
		public static const SP_ACTIVITY_SJZL:int=16;
		/**强化排行**/
		public static const SP_ACTIVITY_QHPH:int=19;
		/**强化助力**/
		public static const SP_ACTIVITY_QHZL:int=20;
		/**等级排行**/
		public static const SP_ACTIVITY_DJPH:int=21;
		/**坐骑排行**/
		public static const SP_ACTIVITY_ZQPH:int=17;
		/**坐骑助力**/
		public static const SP_ACTIVITY_ZQZL:int=18;
		/**7天登录**/
		public static const SP_ACTIVITY_SEVEN_DAY:int=22;
		/**护盾排行**/
		public static const SP_SHIELD_RANK:int=24;
		/**护盾助力**/
		public static const SP_SHIELD:int=25;
		/**披风排行**/
		public static const SP_CLOAK_RANK:int=26;
		/**披风助力**/
		public static const SP_CLOAK:int=27;
		/**玉佩排行**/
		public static const SP_JADEPENDANT_RANK:int=28;
		/**玉佩助力**/
		public static const SP_JADEPENDANT:int=29;
		/**集字送礼**/
		public static const SP_JIZISONGLI:int=30;	
	}
}