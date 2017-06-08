package game.rpgGame.login.state
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.role.BaseActionState;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色动作状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class ActionState extends BaseActionState
	{
		protected var _useCrossfadeTransition : Boolean;

		public function ActionState(type : uint)
		{
			super(type);
			_useCrossfadeTransition = false;
		}

		override public function beforeEnter() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.beforeEnter();
				var state : IState = _machine.getLastState(ActionState);
				_useCrossfadeTransition = state && (state.type != RoleStateType.ACTION_ATTACK);
			}
		}

		override public function get tribe() : String
		{
			return getQualifiedClassName(ActionState);
		}

		override public function dispose() : void
		{
			_useCrossfadeTransition = false;
			super.dispose();
		}
	}
}
