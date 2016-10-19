package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 角色状态类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class RoleStateType
	{
		public static const NONE : int = 0;
		public static const ACTION_IDLE : int = rEnum.ENUM_START(1);
		public static const ACTION_WALK : int = rEnum.next;
		public static const ACTION_RUN : int = rEnum.next;
		public static const ACTION_JUMP : int = rEnum.next;
		public static const ACTION_DEATH : int = rEnum.next;
		public static const ACTION_DEAD_LAUNCH : int = rEnum.next;
		public static const ACTION_HIT : int = rEnum.next;
		public static const ACTION_PREWAR : int = rEnum.next;
		public static const ACTION_ATTACK : int = rEnum.next;
		public static const ACTION_BLINK : int = rEnum.next;
		public static const ACTION_BEAT_BACK : int = rEnum.next;
		public static const ACTION_FALL : int = rEnum.next;
		public static const ACTION_GETUP : int = rEnum.next;
		public static const ACTION_COLLECT : int = rEnum.next;
		public static const ACTION_PLAY_ACTION : int = rEnum.next;
		public static const ACTION_TRAIL : int = rEnum.next;

		public static const CONTROL_WALK_MOVE : int = rEnum.next;
		public static const CONTROL_STOP_WALK_MOVE : int = rEnum.next;
		public static const CONTROL_JUMP_RISE : int = rEnum.next;
		public static const CONTROL_RIDING : int = rEnum.next;
		public static const CONTROL_ANGLE : int = rEnum.next;
		public static const CONTROL_AVATAR : int = rEnum.next;
		public static const CONTROL_HURT : int = rEnum.next;
		public static const CONTROL_ATTACK_HARD : int = rEnum.next;
		public static const CONTROL_CAST_SPELL_LOCK : int = rEnum.next;
		public static const CONTROL_BING_DONG : int = rEnum.next;
		public static const CONTROL_STIFF : int = rEnum.next;
		public static const CONTROL_STUN : int = rEnum.next;
		public static const CONTROL_UNMOVABLE : int = rEnum.next;
		public static const CONTROL_HUSH : int = rEnum.next;
		public static const CONTROL_HUN_LUAN : int = rEnum.next;
		public static const CONTROL_HIT_EFFECT : int = rEnum.next;
		public static const CONTROL_HARD_STRAIGHT : int = rEnum.next;
		public static const CONTROL_POISONED : int = rEnum.next;
		public static const CONTROL_BEAT_MOVE : int = rEnum.next;
		public static const CONTROL_BLINK_MOVE : int = rEnum.next;
		public static const CONTROL_DEAD_LAUNCH_MOVE : int = rEnum.next;
		public static const CONTROL_PREWAR_WAITING : int = rEnum.next;
		public static const CONTROL_TRAIL_MOVE : int = rEnum.next;
	}
}
