package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 血条上的描述
	 * @author luguozheng
	 * 
	 */	
	public class HeadBloodStateType
	{
		/** 自己 1、绿血2、无字 **/
		public static const MAIN_CHAR:uint = rEnum.ENUM_START(1);
		/** 怪物 1、红血2、无字**/
		public static const ENEMY:uint = rEnum.next;
		/** 队友 1、蓝血2、无字**/
		public static const TEAM:uint = rEnum.next;
		/** 队友 1、蓝血2、无字**/
		public static const NPC:uint = rEnum.next;
		/** 国战中的攻方占领中1、红血2、攻方占领中**/
		public static const COUNTRY_WAR_ATTACK_MONSTER:uint = rEnum.next;
		/** 国战中的守方占领中 1、蓝血2、守方占领中**/
		public static const COUNTRY_WAR_DEFENSE_MONSTER:uint = rEnum.next;
	}
}