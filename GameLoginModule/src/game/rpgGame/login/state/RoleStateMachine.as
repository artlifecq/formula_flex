package game.rpgGame.login.state
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.StateMachine;
	import com.game.engine3D.state.StateReference;
	import com.game.engine3D.state.role.BaseActionState;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.utils.Dictionary;
	
	import game.rpgGame.login.scene.SceneRole;

	/**
	 *
	 * 场景角色状态机
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午2:05:15
	 *
	 */
	public class RoleStateMachine extends StateMachine
	{
		private static var machinePool : Pool = new Pool("RoleStateMachine", 500);

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
			machinePool.disposeObj(machine);
		}

		private static var stateMapping : Dictionary = new Dictionary();

		stateMapping[RoleStateType.ACTION_IDLE] = IdleState;
		stateMapping[RoleStateType.CONTROL_STOP_WALK_MOVE] = StopWalkMoveState;
		

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
			var state : BaseActionState = getCurrState(IdleState) as BaseActionState;
			if (state)
				state.syncAnimation(state.isFreeze);
		}

		public function actionPause() : void
		{
			var state : IState = getCurrState(IdleState);
			if (state)
				state.pause();
		}

		public function actionResume() : void
		{
			var state : IState = getCurrState(IdleState);
			if (state)
				state.resume();
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
