package com.editor.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 跳跃上升状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-01 上午11:15:12
	 *
	 */
	public class JumpRiseStateReference extends RoleStateReference
	{
		/**
		 * 跳跃高度
		 */
		private var _jumpHeight : int;
		private var _totalTime : int;

		public function JumpRiseStateReference()
		{
			super();
		}

		public function setParams(jumpHeight : int, totalTime : int) : void
		{
			_jumpHeight = jumpHeight;
			_totalTime = totalTime;
		}

		public function get jumpHeight() : int
		{
			return _jumpHeight;
		}

		public function get totalTime() : int
		{
			return _totalTime;
		}

		override public function dispose() : void
		{
			_totalTime = 0;
			super.dispose();
		}
	}
}
