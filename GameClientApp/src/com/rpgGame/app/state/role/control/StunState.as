package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色眩晕状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class StunState extends BuffState
	{
		public function StunState()
		{
			super(RoleStateType.CONTROL_STUN);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_stateReference)
				{
					if (_stateReference is StunStateReference)
					{
					}
					else
						throw new Error("场景角色眩晕状态引用必须是StunStateReference类型！");
				}
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(StunState);
		}
		
	}
}
