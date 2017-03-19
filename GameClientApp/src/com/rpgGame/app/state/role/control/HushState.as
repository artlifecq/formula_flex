package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色沉默状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午1:25:12
	 *
	 */
	public class HushState extends BuffState
	{
		public function HushState()
		{
			super(RoleStateType.CONTROL_HUSH);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is HushStateReference)
					{
					}
					else
						throw new Error("场景角色沉默状态引用必须是HushStateReference类型！");
				}
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(HushState);
		}
		
	}
}
