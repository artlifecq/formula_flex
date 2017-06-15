package com.editor.state.role
{
	import com.editor.data.RoleStateType;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.ActionState;
	import com.editor.state.role.action.AttackState;
	import com.editor.state.role.action.BeatBackState;
	import com.editor.state.role.action.BlinkState;
	import com.editor.state.role.action.DeadLaunchState;
	import com.editor.state.role.action.DeathState;
	import com.editor.state.role.action.FallState;
	import com.editor.state.role.action.GetupState;
	import com.editor.state.role.action.HitState;
	import com.editor.state.role.action.IdleState;
	import com.editor.state.role.action.JumpState;
	import com.editor.state.role.action.PlayActionState;
	import com.editor.state.role.action.PrewarState;
	import com.editor.state.role.action.RunState;
	import com.editor.state.role.action.TrailState;
	import com.editor.state.role.action.WalkState;
	import com.editor.state.role.control.AttackHardState;
	import com.editor.state.role.control.AvatarState;
	import com.editor.state.role.control.BeatMoveState;
	import com.editor.state.role.control.BlinkMoveState;
	import com.editor.state.role.control.DeadLaunchMoveState;
	import com.editor.state.role.control.HurtState;
	import com.editor.state.role.control.JumpRiseState;
	import com.editor.state.role.control.MoveState;
	import com.editor.state.role.control.PrewarWaitingState;
	import com.editor.state.role.control.RidingState;
	import com.editor.state.role.control.StopWalkMoveState;
	import com.editor.state.role.control.TrailMoveState;
	import com.editor.state.role.control.WalkMoveState;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.StateMachine;
	import com.game.engine3D.state.StateReference;
	
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
		stateMapping[RoleStateType.ACTION_WALK] = WalkState;
		stateMapping[RoleStateType.ACTION_RUN] = RunState;
		stateMapping[RoleStateType.ACTION_JUMP] = JumpState;
		stateMapping[RoleStateType.ACTION_DEATH] = DeathState;
		stateMapping[RoleStateType.ACTION_DEAD_LAUNCH] = DeadLaunchState;
		stateMapping[RoleStateType.ACTION_HIT] = HitState;
		stateMapping[RoleStateType.ACTION_FALL] = FallState;
		stateMapping[RoleStateType.ACTION_GETUP] = GetupState;
		stateMapping[RoleStateType.ACTION_ATTACK] = AttackState;
		stateMapping[RoleStateType.ACTION_BLINK] = BlinkState;
		stateMapping[RoleStateType.ACTION_BEAT_BACK] = BeatBackState;
		stateMapping[RoleStateType.ACTION_PREWAR] = PrewarState;
		stateMapping[RoleStateType.ACTION_PLAY_ACTION] = PlayActionState;
		stateMapping[RoleStateType.ACTION_TRAIL] = TrailState;

		stateMapping[RoleStateType.CONTROL_AVATAR] = AvatarState;
		stateMapping[RoleStateType.CONTROL_HURT] = HurtState;
		stateMapping[RoleStateType.CONTROL_ATTACK_HARD] = AttackHardState;
		stateMapping[RoleStateType.CONTROL_WALK_MOVE] = WalkMoveState;
		stateMapping[RoleStateType.CONTROL_JUMP_RISE] = JumpRiseState;
		stateMapping[RoleStateType.CONTROL_STOP_WALK_MOVE] = StopWalkMoveState;
		stateMapping[RoleStateType.CONTROL_BEAT_MOVE] = BeatMoveState;
		stateMapping[RoleStateType.CONTROL_BLINK_MOVE] = BlinkMoveState;
		stateMapping[RoleStateType.CONTROL_DEAD_LAUNCH_MOVE] = DeadLaunchMoveState;
		stateMapping[RoleStateType.CONTROL_RIDING] = RidingState;
		stateMapping[RoleStateType.CONTROL_PREWAR_WAITING] = PrewarWaitingState;
		stateMapping[RoleStateType.CONTROL_TRAIL_MOVE] = TrailMoveState;

		private var _role : SceneRole;

		public function RoleStateMachine(role : SceneRole)
		{
			super(role);
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = _owner as SceneRole;
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

		/** 骑乘状态 **/
		public function get isRiding() : Boolean
		{
			var state : IState = getCurrState(RidingState);
			return state != null;
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
