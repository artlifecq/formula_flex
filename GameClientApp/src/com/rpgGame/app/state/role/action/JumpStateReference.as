package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 跳跃状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-10 上午10:15:16
	 *
	 */
	public class JumpStateReference extends RoleStateReference
	{
		private var _jumpAction : int = 0;

		public function JumpStateReference()
		{
			super();
		}

		public function setParams(jumpAction : int) : void
		{
			_jumpAction = jumpAction;
		}

		public function set jumpAction(value : int) : void
		{
			_jumpAction = value;
		}

		/**
		 * 跳跃的几段跳，一般都有2段跳 
		 * @return 
		 * 
		 */		
		public function get jumpAction() : int
		{
			return _jumpAction;
		}

		override public function dispose() : void
		{
			_jumpAction = 0;
			super.dispose();
		}
	}
}
