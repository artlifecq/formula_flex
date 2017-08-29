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
		public static const ACTION_IDLE : int = rEnum.ENUM_START(1);//待机状态1
		public static const ACTION_SHOW : int = rEnum.next;//展示状态2
		public static const ACTION_WALK : int = rEnum.next; //走路状态3
		public static const ACTION_RUN : int = rEnum.next;//跑步状态4
		public static const ACTION_JUMP : int = rEnum.next;//跳跃状态5
		public static const ACTION_DEATH : int = rEnum.next;//死亡状态6
		public static const ACTION_DEAD_LAUNCH : int = rEnum.next;//7
		public static const ACTION_HIT : int = rEnum.next;//受击状态8
		public static const ACTION_PREWAR : int = rEnum.next;//战斗预备状态9
		public static const ACTION_ATTACK : int = rEnum.next;//攻击状态10
		public static const ACTION_ATTACK_UI : int = rEnum.next;//攻击状态,攻击状态11
		public static const ACTION_BLINK : int = rEnum.next;//闪烁状态12
		public static const ACTION_BEAT_BACK : int = rEnum.next;//击退状态13
		public static const ACTION_FALL : int = rEnum.next;//掉落状态14
		public static const ACTION_GETUP : int = rEnum.next;//站起来状态15
		public static const ACTION_COLLECT : int = rEnum.next;//采集状态16
		public static const ACTION_PLAY_ACTION : int = rEnum.next;//播放动作状态17
		public static const ACTION_TRAIL : int = rEnum.next;//追踪状态18
		
		public static const ACTION_PLAY_SPELL:int = rEnum.next;//19
		public static const ACTION_FLY_UP:int = rEnum.next;//20
		public static const ACTION_FLY_HIT:int = rEnum.next;//21
		public static const ACTION_FLY_FALL:int = rEnum.next;//22

		public static const CONTROL_WALK_MOVE : int = rEnum.next;//23
		public static const CONTROL_STOP_WALK_MOVE : int = rEnum.next;//24
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
		public static const CONTROL_BLIND : int = rEnum.next;
		public static const CONTROL_SHADOW : int = rEnum.next;
		public static const CONTROL_SCARED : int = rEnum.next;
		public static const CONTROL_FASTING : int = rEnum.next;
		public static const CONTROL_SCARED_MOVE : int = rEnum.next;
		public static const CONTROL_MOUNT_RIDE : int = rEnum.next;
		
		public static const CONTROL_HIDDING:int = rEnum.next;
		public static const CONTROL_FLY_UP:int = rEnum.next;
		public static const CONTROL_FLY_HIT:int = rEnum.next;
		public static const CONTROL_FLY_FALL:int = rEnum.next;
		public static const CONTROL_SYNC_SPELLACTION:int = rEnum.next;
        public static const CONTROL_SHAPESHIFTING : int = rEnum.next;
		
		public static const CONTROL_USE_SPELL:int = rEnum.next;
		public static const CONTROL_SHORTCUTGRID:int = rEnum.next;
		public static const CONTROL_SKILL_WARNING:int = rEnum.next;// 预警状态
		public static const CONTROL_TOWER_FLAG:int = rEnum.next;// 预警状态
		public static const CONTROL_MASTERY_MAN:int = rEnum.next;// 神秘人
		public static const CONTROL_CHECK_AUTO_FIGHT:int = rEnum.next;// 自动战斗
		public static const CONTROL_VIP:int = rEnum.next;// 自动战斗
		
		public static const CONTROL_TRIPLE_ATTACK_LOCK:int = rEnum.next;// 三连击锁定
		public static const CONTROL_TRIPLE_ATTACK_CHECK:int = rEnum.next;// 三连击锁定
		public static const CONTROL_BUFF_SPRITEUP:int = rEnum.next;// 冲刺
		public static const CONTROL_BUFF_RESET_SKILLCD:int = rEnum.next;// 技能cd,已施放技能cd时间减少
		public static const CONTROL_BUFF_REDUCE_SKILLCD:int = rEnum.next;// 技能cd,未释放技能cd时间减少
		public static const CONTROL_ENTER_LEAVE_FIGHT:int = rEnum.next;// 战斗状态
		public static const CONTROL_BUFF_BLEED:int = rEnum.next;// BUFF流血状态
		
		
	}
}
