package com.rpgGame.core.events.role
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 血纹事件
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-14 上午10:55:46
	 */
	
	public class XueWenEvent
	{
		/**开启新的技能方案*/
		public static const OPEN_NEW_SCHEME:int = UNIQUEID.NEXT;
		
		/**强化成功*/
		public static const QIANG_HUA_SUCCESS:int = UNIQUEID.NEXT;
		
		/**洗练成功*/
		public static const XI_LIAN_SUCCESS:int = UNIQUEID.NEXT;
		
		/**洗练技能替换成功*/
		public static const XI_LIAN_REPLACE_SUCCESS:int = UNIQUEID.NEXT;
		
		/**方案名修改成功*/
		public static const CHANGE_SCHEME_NAME:int = UNIQUEID.NEXT;
		/**切换方案tab标签页*/
		public static const CHANGE_TAB_INDEX:int = UNIQUEID.NEXT;
	}
}