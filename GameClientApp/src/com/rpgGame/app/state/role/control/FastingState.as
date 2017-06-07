package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色禁食状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class FastingState extends BuffState
	{
		public function FastingState()
		{
			super(RoleStateType.CONTROL_FASTING);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is FastingStateReference)
					{
					}
					else
						throw new Error("场景角色禁食状态引用必须是FastingStateReference类型！");
				}
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(FastingState);
		}
		
	}
}
