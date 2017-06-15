package com.rpgGame.app.state.role
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.StateMachine;
	import com.game.engine3D.state.StateReference;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.AttackState;
	import com.rpgGame.app.state.role.action.BeatBackState;
	import com.rpgGame.app.state.role.action.BlinkState;
	import com.rpgGame.app.state.role.action.CollectState;
	import com.rpgGame.app.state.role.action.DeadLaunchState;
	import com.rpgGame.app.state.role.action.DeathState;
	import com.rpgGame.app.state.role.action.FallState;
	import com.rpgGame.app.state.role.action.GetupState;
	import com.rpgGame.app.state.role.action.HitState;
	import com.rpgGame.app.state.role.action.IdleState;
	import com.rpgGame.app.state.role.action.JumpState;
	import com.rpgGame.app.state.role.action.PlayActionState;
	import com.rpgGame.app.state.role.action.PlaySpellState;
	import com.rpgGame.app.state.role.action.PrewarState;
	import com.rpgGame.app.state.role.action.RunState;
	import com.rpgGame.app.state.role.action.ShowState;
	import com.rpgGame.app.state.role.action.TrailState;
	import com.rpgGame.app.state.role.action.WalkState;
	import com.rpgGame.app.state.role.action.ui.AttackUIState;
	import com.rpgGame.app.state.role.control.AttackHardState;
	import com.rpgGame.app.state.role.control.AvatarState;
	import com.rpgGame.app.state.role.control.BeatMoveState;
	import com.rpgGame.app.state.role.control.BingDongState;
	import com.rpgGame.app.state.role.control.BlindState;
	import com.rpgGame.app.state.role.control.BlinkMoveState;
	import com.rpgGame.app.state.role.control.CastSpellLockState;
	import com.rpgGame.app.state.role.control.DeadLaunchMoveState;
	import com.rpgGame.app.state.role.control.FastingState;
	import com.rpgGame.app.state.role.control.FlyUpState;
	import com.rpgGame.app.state.role.control.HiddingState;
	import com.rpgGame.app.state.role.control.HunLuanState;
	import com.rpgGame.app.state.role.control.HurtState;
	import com.rpgGame.app.state.role.control.HushState;
	import com.rpgGame.app.state.role.control.JumpRiseState;
	import com.rpgGame.app.state.role.control.MountRideState;
	import com.rpgGame.app.state.role.control.PrewarWaitingState;
	import com.rpgGame.app.state.role.control.RidingState;
	import com.rpgGame.app.state.role.control.ScaredMoveState;
	import com.rpgGame.app.state.role.control.ScaredState;
	import com.rpgGame.app.state.role.control.ShadowState;
	import com.rpgGame.app.state.role.control.ShapeshiftingState;
	import com.rpgGame.app.state.role.control.ShortcutGridState;
	import com.rpgGame.app.state.role.control.SkillWarningState;
	import com.rpgGame.app.state.role.control.StiffState;
	import com.rpgGame.app.state.role.control.StopWalkMoveState;
	import com.rpgGame.app.state.role.control.StunState;
	import com.rpgGame.app.state.role.control.SyncSpellActionState;
	import com.rpgGame.app.state.role.control.TrailMoveState;
	import com.rpgGame.app.state.role.control.UnmovableState;
	import com.rpgGame.app.state.role.control.UseSpellState;
	import com.rpgGame.app.state.role.control.WalkMoveState;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.core.state.role.control.MoveState;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.Dictionary;
	
	/**
	 *
	 * 场景角色状态机
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午2:05:15
	 *
	 */
	public class RoleStateMachine extends StateMachine
	{
		private static var machinePool : InstancePool = new InstancePool("RoleStateMachine", 300);
		
		/**
		 * 生成一个RoleStateMachine
		 */
		public static function create(role : SceneRole) : RoleStateMachine
		{
			//利用池生成RoleStateMachine
			return machinePool.createObj(RoleStateMachine, role) as RoleStateMachine;
		}
		
		/**
		 * @private
		 * 回收一个RoleStateMachine
		 * @param machine
		 */
		public static function recycle(machine : RoleStateMachine) : void
		{
			//利用池回收RoleStateMachine
			machinePool.recycleObj(machine);
		}
		
		private static var stateMapping : Dictionary = new Dictionary();
		
		stateMapping[RoleStateType.ACTION_IDLE] = IdleState;
		stateMapping[RoleStateType.ACTION_SHOW] = ShowState;
		stateMapping[RoleStateType.ACTION_WALK] = WalkState;
		stateMapping[RoleStateType.ACTION_RUN] = RunState;
		stateMapping[RoleStateType.ACTION_JUMP] = JumpState;
		stateMapping[RoleStateType.ACTION_DEATH] = DeathState;
		stateMapping[RoleStateType.ACTION_DEAD_LAUNCH] = DeadLaunchState;
		stateMapping[RoleStateType.ACTION_HIT] = HitState;
		stateMapping[RoleStateType.ACTION_COLLECT] = CollectState;
		stateMapping[RoleStateType.ACTION_FALL] = FallState;
		stateMapping[RoleStateType.ACTION_GETUP] = GetupState;
		stateMapping[RoleStateType.ACTION_ATTACK] = AttackState;
		stateMapping[RoleStateType.ACTION_ATTACK_UI] = AttackUIState;
		stateMapping[RoleStateType.ACTION_BLINK] = BlinkState;
		stateMapping[RoleStateType.ACTION_BEAT_BACK] = BeatBackState;
		stateMapping[RoleStateType.ACTION_PREWAR] = PrewarState;
		stateMapping[RoleStateType.ACTION_PLAY_ACTION] = PlayActionState;
		stateMapping[RoleStateType.ACTION_TRAIL] = TrailState;
		stateMapping[RoleStateType.ACTION_PLAY_SPELL] = PlaySpellState;
		
		stateMapping[RoleStateType.CONTROL_AVATAR] = AvatarState;
		stateMapping[RoleStateType.CONTROL_HURT] = HurtState;
		stateMapping[RoleStateType.CONTROL_ATTACK_HARD] = AttackHardState;
		stateMapping[RoleStateType.CONTROL_CAST_SPELL_LOCK] = CastSpellLockState;
		stateMapping[RoleStateType.CONTROL_BING_DONG] = BingDongState;
		stateMapping[RoleStateType.CONTROL_STIFF] = StiffState;
		stateMapping[RoleStateType.CONTROL_STUN] = StunState;
		stateMapping[RoleStateType.CONTROL_UNMOVABLE] = UnmovableState;
		stateMapping[RoleStateType.CONTROL_HUSH] = HushState;
		stateMapping[RoleStateType.CONTROL_SHADOW] = ShadowState;
		stateMapping[RoleStateType.CONTROL_BLIND] = BlindState;
		stateMapping[RoleStateType.CONTROL_SCARED] = ScaredState;
		stateMapping[RoleStateType.CONTROL_HUN_LUAN] = HunLuanState;
		stateMapping[RoleStateType.CONTROL_FASTING] = FastingState;
		stateMapping[RoleStateType.CONTROL_WALK_MOVE] = WalkMoveState;
		stateMapping[RoleStateType.CONTROL_JUMP_RISE] = JumpRiseState;
		stateMapping[RoleStateType.CONTROL_STOP_WALK_MOVE] = StopWalkMoveState;
		stateMapping[RoleStateType.CONTROL_BEAT_MOVE] = BeatMoveState;
		stateMapping[RoleStateType.CONTROL_BLINK_MOVE] = BlinkMoveState;
		stateMapping[RoleStateType.CONTROL_DEAD_LAUNCH_MOVE] = DeadLaunchMoveState;
		stateMapping[RoleStateType.CONTROL_RIDING] = RidingState;
		stateMapping[RoleStateType.CONTROL_PREWAR_WAITING] = PrewarWaitingState;
		stateMapping[RoleStateType.CONTROL_TRAIL_MOVE] = TrailMoveState;
		stateMapping[RoleStateType.CONTROL_SCARED_MOVE] = ScaredMoveState;
		stateMapping[RoleStateType.CONTROL_MOUNT_RIDE] = MountRideState;
		
		stateMapping[RoleStateType.CONTROL_HIDDING] = HiddingState;
		stateMapping[RoleStateType.CONTROL_FLY_UP] = FlyUpState;
		stateMapping[RoleStateType.CONTROL_SYNC_SPELLACTION] = SyncSpellActionState;
		stateMapping[RoleStateType.CONTROL_USE_SPELL] = UseSpellState;
		stateMapping[RoleStateType.CONTROL_SHAPESHIFTING] = ShapeshiftingState;
		stateMapping[RoleStateType.CONTROL_SHORTCUTGRID] = ShortcutGridState;
		stateMapping[RoleStateType.CONTROL_SKILL_WARNING] = SkillWarningState;
		private var _role : SceneRole;
		private var _lastCanShowRiding : Boolean;
		
		public function RoleStateMachine(role : SceneRole)
		{
			super(role);
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = _owner as SceneRole;
			_lastCanShowRiding = true;
		}
		
		public function get lastCanShowRiding() : Boolean
		{
			return _lastCanShowRiding;
		}
		
		override public function transition(type : int, ref : StateReference = null, force : Boolean = false, allowQueue : Boolean = false, dumpTypes : Array = null) : Boolean
		{
			if (_role && _role.usable)
				return super.transition(type, ref, force, allowQueue, dumpTypes);
			return false;
		}
		
		override public function dispose() : void
		{
			_role = null;
			super.dispose();
		}
		
		public function updateAvatar() : void
		{
			var state : ActionState = getCurrState(ActionState) as ActionState;
			if (state)
				state.syncAnimation(state.isFreeze);
			_lastCanShowRiding = canShowRiding;
		}
		
		public function actionPause() : void
		{
			var state : IState = getCurrState(ActionState);
			if (state)
				state.pause();
		}
		
		public function actionResume() : void
		{
			var state : IState = getCurrState(ActionState);
			if (state)
				state.resume();
		}
		
		public function get isWalking() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_WALK);
		}
		
		public function get isRunning() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_RUN);
		}
		
		public function get isJumping() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_JUMP);
		}
		
		public function get isJumpRising() : Boolean
		{
			var state : IState = getCurrState(JumpRiseState);
			return state != null;
		}
		
		public function get isWalkMoving() : Boolean
		{
			var state : IState = getCurrState(MoveState);
			return state && (state.type == RoleStateType.CONTROL_WALK_MOVE);
		}
		
		public function get isDead() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_DEATH);
		}
		
		public function get isDeadLaunch() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_DEAD_LAUNCH);
		}
		
		public function get isDeadState() : Boolean
		{
			return isDead || isDeadLaunch;
		}
		
		public function get isTrailMoving() : Boolean
		{
			var state : IState = getCurrState(MoveState);
			return state && (state.type == RoleStateType.CONTROL_TRAIL_MOVE);
		}
		
		public function get isAttacking() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_ATTACK);
		}
		
		public function get isHiting() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_HIT);
		}
		
		public function get isCollecting() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_COLLECT);
		}
		
		/** 骑乘状态 **/
		public function get isRiding() : Boolean
		{
			var state : IState = getCurrState(RidingState);
			return state != null;
		}
		
		public function get isShowRiding() : Boolean
		{
			var state : IState = getCurrState(RidingState);
			return state != null && canShowRiding;
		}
		
		/**
		 * 是否可以显示在马上的动作，如采集不能显示在马上，但实际上是在马上的。@L.L.M.Sunny 2016.11.09
		 * @return
		 *
		 */
		public function get canShowRiding() : Boolean
		{
			if (isCollecting)
			{
				return false;
			}
			return true;
		}
		
		public function get isBlinking() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_BLINK);
		}
		
		public function get isBlinkMoving() : Boolean
		{
			var state : IState = getCurrState(MoveState);
			return state && (state.type == RoleStateType.CONTROL_BLINK_MOVE);
		}
		
		public function get isBeatMoving() : Boolean
		{
			var state : IState = getCurrState(MoveState);
			return state && (state.type == RoleStateType.CONTROL_BEAT_MOVE);
		}
		
		public function get isDeadLaunching() : Boolean
		{
			var state : IState = getCurrState(MoveState);
			return state && (state.type == RoleStateType.CONTROL_DEAD_LAUNCH_MOVE);
		}
		
		public function get isBeatBack() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_BEAT_BACK);
		}
		
		public function get isIdle() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_IDLE);
		}
		
		public function get isPrewar() : Boolean
		{
			var state : IState = getCurrState(ActionState);
			return state && (state.type == RoleStateType.ACTION_PREWAR);
		}
		
		public function get isPrewarWaiting() : Boolean
		{
			var state : IState = getCurrState(PrewarWaitingState);
			return state != null;
		}
		
		public function get isAttackHarding() : Boolean
		{
			var state : IState = getCurrState(AttackHardState);
			return state != null;
		}
		
		public function get isLockCaseSpell() : Boolean
		{
			var state : IState = getCurrState(CastSpellLockState);
			return state != null;
		}
		
		public function get isBingDong() : Boolean
		{
			var state : IState = getCurrState(BingDongState);
			return state != null;
		}
		
		public function get isStun() : Boolean
		{
			var state : IState = getCurrState(StunState);
			return state != null;
		}
		
		public function get isUnmovable() : Boolean
		{
			var state : IState = getCurrState(UnmovableState);
			return state != null;
		}
		
		public function get isHiding():Boolean
		{
			var state : IState = getCurrState(HiddingState);
			return state != null;
		}
		
		public function get isUseSpell():Boolean
		{
			var state : IState = getCurrState(UseSpellState);
			return state != null;
		}
		
		public function get isFly():Boolean
		{
			var state : IState = getCurrState(FlyUpState);
			return state != null;
		}
		
		public function get isFall():Boolean
		{
			var state : IState = getCurrState(FallState);
			return state != null;
		}
		
		public function get isStiff() : Boolean
		{
			var state : IState = getCurrState(StiffState);
			return state != null;
		}
		
		public function get isHush() : Boolean
		{
			var state : IState = getCurrState(HushState);
			return state != null;
		}
		
		public function get isShadow() : Boolean
		{
			var state : IState = getCurrState(ShadowState);
			return state != null;
		}
		
		public function get isScared() : Boolean
		{
			var state : IState = getCurrState(ScaredState);
			return state != null;
		}
		
		public function get isHunLuan() : Boolean
		{
			var state : IState = getCurrState(HunLuanState);
			return state != null;
		}
		
		public function get isFasting() : Boolean
		{
			var state : IState = getCurrState(FastingState);
			return state != null;
		}
		
		public function get isShapeshifting():Boolean
		{
			var state : IState = getCurrState(ShapeshiftingState);
			return state != null;
		}
		
		override protected function createState(type : int) : IState
		{
			var state : IState = null;
			var stateCls : Class = stateMapping[type];
			if (stateCls)
				state = new stateCls();
			if (!state)
			{
				throw new Error(_role.name + "-不存在的状态：" + type);
			}
			return state;
		}
	}
}
