package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * AI状态类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class AIStateType
	{
		public static const NONE : int = 0;
		public static const AI_NONE : int = rEnum.ENUM_START(1);
		public static const FIND_ATTACKABLE : int = rEnum.next;
		public static const ATTACK_TARGET : int = rEnum.next;

		public function AIStateType()
		{
		}
	}
}
