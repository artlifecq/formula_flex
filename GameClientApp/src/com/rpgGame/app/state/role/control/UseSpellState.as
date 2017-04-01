package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 使用技能状态buff
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午1:25:12
	 *
	 */
	public class UseSpellState extends BuffState
	{
		public function UseSpellState()
		{
			super(RoleStateType.CONTROL_USE_SPELL);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is UseSpellStateReference)
					{
					}
					else
						throw new Error("场景角色沉默状态引用必须是HushStateReference类型！");
				}
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(UseSpellState);
		}
		
		override public function leave():void
		{
			super.leave();
			
			transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
			if ((_machine as RoleStateMachine).isPrewarWaiting)
				transition(RoleStateType.ACTION_PREWAR);
			else
				transition(RoleStateType.ACTION_IDLE);
		}
	}
}
