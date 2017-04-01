package game.rpgGame.login.state
{
	import com.game.engine3D.state.role.BaseActionState;
	

	/**
	 *
	 * 场景角色停止行走移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class StopWalkMoveState extends BaseActionState
	{
		public function StopWalkMoveState()
		{
			super(RoleStateType.CONTROL_STOP_WALK_MOVE);
		}
	}
}
