package com.game.engine3D.state.role
{
	import com.game.engine3D.state.State;
	import com.game.engine3D.state.StateMachine;

	/**
	 *
	 * 场景角色状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class RoleState extends State
	{
		public function RoleState(type : uint)
		{
			super(type);
		}

		override public function init(machine : StateMachine) : void
		{
			super.init(machine);
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
