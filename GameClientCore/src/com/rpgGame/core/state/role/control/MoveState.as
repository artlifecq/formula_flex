package com.rpgGame.core.state.role.control
{
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 移动状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class MoveState extends ControlState
	{
		public function MoveState(type : uint)
		{
			super(type);
		}

		override public function get tribe() : String
		{
			return getQualifiedClassName(MoveState);
		}
	}
}
