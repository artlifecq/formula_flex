package com.editor.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 停止行走移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-21 上午10:25:12
	 *
	 */
	public class StopWalkMoveStateReference extends RoleStateReference
	{
		private var _targetX : int = 0;
		private var _targetY : int = 0;

		public function StopWalkMoveStateReference()
		{
			super();
		}

		public function setParams(targetX : int, targetY : int) : void
		{
			_targetX = targetX;
			_targetY = targetY;
		}

		public function get targetX() : int
		{
			return _targetX;
		}

		public function get targetY() : int
		{
			return _targetY;
		}

		override public function dispose() : void
		{
			_targetX = 0;
			_targetY = 0;
			super.dispose();
		}
	}
}
