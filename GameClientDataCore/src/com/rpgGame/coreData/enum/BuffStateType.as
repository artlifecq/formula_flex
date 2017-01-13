package com.rpgGame.coreData.enum
{
	import com.rpgGame.coreData.rEnum;

	public class BuffStateType
	{
		// 不能攻击,不能移动
		// 不能移动跳跃
		// 不能攻击
		//
		// 
	
		public static const DIZZINESS:uint = rEnum.ENUM_START(1);
		
		public static const FREEZE:uint = rEnum.next;
		
		public static const SILENCE:uint = rEnum.next;
		public static const CHAOS:uint = rEnum.next;
		public static const HIDING:uint = rEnum.next;
	}
}