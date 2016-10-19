package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 日常任务类型 
	 * @author 
	 * 
	 */	
	public class DailyTaskType
	{
		/**偷经**/
		public static const TOU_JING:uint = rEnum.ENUM_START();
		/**密信**/
		public static const SECRET_MESSAGE:uint = rEnum.next;
		/**运镖**/
		public static const YUN_BIAO:uint = rEnum.next;
		/**偷猪**/
		public static const TOU_ZHU:uint = rEnum.next;
	}
}