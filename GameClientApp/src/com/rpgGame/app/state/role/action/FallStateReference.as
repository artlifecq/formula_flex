package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 击倒状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-7 下午5:25:12
	 *
	 */
	public class FallStateReference extends RoleStateReference
	{
		/**
		 * 硬直时间
		 */
		private var _stiffTime : int;

		public function FallStateReference()
		{
			super();
		}

		public function setParams(stiffTime : int) : void
		{
			_stiffTime = stiffTime;
		}

		public function get stiffTime() : int
		{
			return _stiffTime;
		}
	}
}
