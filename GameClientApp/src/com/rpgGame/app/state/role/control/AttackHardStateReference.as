package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 攻击硬直状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class AttackHardStateReference extends RoleStateReference
	{
		private var _hardTime : int;

		public function AttackHardStateReference()
		{
			super();
		}

		public function setParams(hardTime : int) : void
		{
			_hardTime = hardTime;
		}

		public function get hardTime() : int
		{
			return _hardTime;
		}

		override public function dispose() : void
		{
			_hardTime = 0;
			super.dispose();
		}
	}
}
