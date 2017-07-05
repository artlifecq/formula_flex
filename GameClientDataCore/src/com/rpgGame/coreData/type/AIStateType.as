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
		/**自动找怪*/
		public static const FIND_ATTACKABLE : int = rEnum.next;
		/**自动战斗*/
		public static const ATTACK_TARGET : int = rEnum.next;

		/**战斗 自动寻路*/
		public static const ATTACK_WALK : int = rEnum.next;
		/**自动吃药*/
		public static const USE_ITEM : int = rEnum.next;
		
		
		/**任务 自动寻路*/
		public static const TASK_WALK : int = rEnum.next;
		/**任务 主线任务外 自动寻路*/
		public static const TASK_OTHER_WALK : int = rEnum.next;
		
		
		/**任务 面板操作*/
		public static const TASK_PANEL : int = rEnum.next;
		/**任务 自动采集*/
		public static const TASK_GATHER : int = rEnum.next;
		
		/**战魂自动技能*/
		public static const FIGHTSOUL_ATTACE : int = rEnum.next;
		
		
		public function AIStateType()
		{
		}
	}
}
