package com.editor.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 角色骑乘状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class RidingStateReference extends RoleStateReference
	{
		private var _mountResID : String = null;
		private var _mountAnimatResID : String = null;

		public function RidingStateReference()
		{
			super();
		}

		public function setParams(mountResID : String, mountAnimatResID : String) : void
		{
			_mountResID = mountResID;
			_mountAnimatResID = mountAnimatResID;
		}

		public function get mountResID() : String
		{
			return _mountResID;
		}

		public function get mountAnimatResID() : String
		{
			return _mountAnimatResID;
		}

		override public function dispose() : void
		{
			_mountResID = null;
			_mountAnimatResID = null;
			super.dispose();
		}
	}
}
