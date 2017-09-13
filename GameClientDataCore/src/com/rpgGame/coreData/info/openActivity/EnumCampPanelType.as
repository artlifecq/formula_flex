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
		public static const M_BUG:int = 10001;
		//37平台活动
		public static const M_PLATFORM_37:int=10002;
		//37超级会员
		public static const M_SUPER_VIP_37:int=10003;
		//37手机验证
		public static const M_PHONE_37:int=10004;
		
		
		
		/********************************
		 * 
		 * 子面板类型
		 * 
		 ******************************/ 
		//封测子活动,对应表中q_subpanel_type
		/**手机令牌**/
		public static const SP_37_TOKEN:int=1;
		/**特权**/
		public static const SP_37_TQ:int=2;
		/**37平台vip**/
		public static const SP_37_VIP:int=3;

	}
}