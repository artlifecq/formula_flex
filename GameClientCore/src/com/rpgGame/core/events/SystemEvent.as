package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	
	/**
	 * 系统时间(系统时间,系统测试等等) 
	 * @author carverwang
	 * 
	 */	
	public class SystemEvent 
	{
		public static const PAGE_RESIZE:int = UNIQUEID.NEXT;//网页高宽变化
		
		public static const SYS_TIME:int = UNIQUEID.NEXT;
		public static const SYS_SET:int = UNIQUEID.NEXT;//系统设置
	}
}