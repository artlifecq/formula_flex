package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 角色骑马状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-19 下午5:25:12
	 *
	 */
	public class MountRideStateReference extends RoleStateReference
	{
		private var _isRide : Boolean = false;

		public function MountRideStateReference()
		{
			super();
		}

		public function setParams(isRide : Boolean) : void
		{
			_isRide = isRide;
		}

		public function get isRide() : Boolean
		{
			return _isRide;
		}

		override public function dispose() : void
		{
			_isRide = false;
			super.dispose();
		}
	}
}
