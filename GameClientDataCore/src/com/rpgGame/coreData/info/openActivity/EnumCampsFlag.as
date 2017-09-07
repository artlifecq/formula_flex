package  com.rpgGame.coreData.info.openActivity
{
	public class EnumCampsFlag
	{
		/******************************************************
		 * 资源控制标示
		 *****************************************************/
		
		public static const F_TILE_STR:String = "title";
		public static const F_BACKGROUND_STR:String = "background";
		
		public static const F_CELLHEAD_STR:String = "cellhead";
		public static const F_CELLNAME_STR:String = "cellname";
		public static const F_CELLNUMS_STR:String = "cellnums";
		
		public static const F_FANLI_STR_1:String = "fanlibox1";
		public static const F_FANLI_STR_2:String = "fanlibox2";
		public static const F_FANLI_STR_3:String = "fanlibox3";
		public static const F_FANLI_STR_4:String = "xiaofeishuliang";
		
		public static const F_URL_STR:String = "url";
		public static const F_HTTP_STR:String = "link";
		
		// 可领取显示控制 (0其中一个可领 1始终隐藏，2始终显示)
		public static const F_CAN_GET:String = "get";
		// 已经领取显示控制 (0全部领取 1始终隐藏，2始终显示 3领取了其中一个)
		public static const F_GETTED:String = "ok";
		
		/******************************************************
		 * 脚本
		 *****************************************************/ 
		public static const F_scriptname:String = "scriptname";
		public static const F_scriptid:String = "scriptid";
		public static const F_scriptparam:String = "scriptparam";
		
		/******************************************************
		 * 直接打开网页 
		 *****************************************************/ 
		public static const F_weburl:String = "weburl";
		
		/******************************************************
		 * 类型标示
		 *****************************************************/ 
		public static const S_limit_show:String = "limitshow";
		
		public static const S_HEADREWARD:String = "headreward";
		
		public static const S_FASHIONREWARD:String = "fashionreward";
		
		public static const S_EMAIL:String = "email";
	}
}