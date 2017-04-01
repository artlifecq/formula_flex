package com.rpgGame.app.state.role.control
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
			
		private var _totalTime : int;
			
		private var _isSecondJump : Boolean;

		public function JumpRiseStateReference()
		{
			super();
		}

		public function setParams(totalTime : int, isSecondJump : Boolean) : void
		{
			_totalTime = totalTime;
			_isSecondJump = isSecondJump;
		}

		/**
		 * 上升过程中总时间 
		 */	
		public function get totalTime() : int
		{
			return _totalTime;
		}

		/**
		 * 是否是2级跳 
		 */	
		public function get isSecondJump() : Boolean
		{
			return _isSecondJump;
		}

		override public function dispose() : void
		{
			_totalTime = 0;
			_isSecondJump = false;
			super.dispose();
		}
	}
}
