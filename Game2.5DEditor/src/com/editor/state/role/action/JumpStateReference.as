package com.editor.state.role.action
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
		/**
		 * 跳跃速率
		 */
		private var _jumpSpeedRatio : Number = 0;
		/**
		 * 二级跳跃速率
		 */
		private var _secondJumpSpeedRatio : Number = 0;
		/**
		 * 跳跃开始时间
		 */
		private var _jumpStartTime : int = 0;
		/**
		 * 二级跳跃开始时间
		 */
		private var _secondJumpStartTime : int = 0;
		/**
		 * 跳跃结束时间
		 */
		private var _jumpEndTime : int = 0;
		/**
		 * 二级跳跃结束时间
		 */
		private var _secondJumpEndTime : int = 0;
		/**
		 * 跳跃打断时间
		 */
		private var _jumpBreakTime : int = 0;
		/**
		 * 二级跳跃打断时间
		 */
		private var _secondJumpBreakTime : int = 0;
		/**
		 * 二级跳概率
		 */
		private var _secondJumpProbability : int = 30;
		/**
		 * 跳跃高度
		 */
		private var _jumpHeight : int = 100;
		/**
		 * 二级跳跃高度
		 */
		private var _secondJumpHeight : int = 100;

		private var _jumpAction : int = 0;

		public function JumpStateReference()
		{
			super();
		}

		public function setParams(jumpAction : int, jumpSpeedRatio : Number, secondJumpSpeedRatio : Number, jumpStartTime : int, secondJumpStartTime : int, jumpEndTime : int, secondJumpEndTime : int, jumpBreakTime : int, secondJumpBreakTime : int, secondJumpProbability : int, jumpHeight : int, secondJumpHeight : int) : void
		{
			_jumpAction = jumpAction;
			_jumpSpeedRatio = jumpSpeedRatio;
			_secondJumpSpeedRatio = secondJumpSpeedRatio;
			_jumpStartTime = jumpStartTime;
			_secondJumpStartTime = secondJumpStartTime;
			_jumpEndTime = jumpEndTime;
			_secondJumpEndTime = secondJumpEndTime;
			_jumpBreakTime = jumpBreakTime;
			_secondJumpBreakTime = secondJumpBreakTime;
			_secondJumpProbability = secondJumpProbability;
			_jumpHeight = jumpHeight;
			_secondJumpHeight = secondJumpHeight;
		}

		public function get secondJumpProbability() : int
		{
			return _secondJumpProbability;
		}

		public function get secondJumpBreakTime() : int
		{
			return _secondJumpBreakTime;
		}

		public function get jumpBreakTime() : int
		{
			return _jumpBreakTime;
		}

		public function get secondJumpEndTime() : int
		{
			return _secondJumpEndTime;
		}

		public function get jumpEndTime() : int
		{
			return _jumpEndTime;
		}

		public function get secondJumpStartTime() : int
		{
			return _secondJumpStartTime;
		}

		public function get jumpStartTime() : int
		{
			return _jumpStartTime;
		}

		public function get secondJumpSpeedRatio() : Number
		{
			return _secondJumpSpeedRatio;
		}

		public function get jumpSpeedRatio() : Number
		{
			return _jumpSpeedRatio;
		}

		public function get secondJumpHeight() : int
		{
			return _secondJumpHeight;
		}

		public function get jumpHeight() : int
		{
			return _jumpHeight;
		}

		public function set jumpAction(value : int) : void
		{
			_jumpAction = value;
		}

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
