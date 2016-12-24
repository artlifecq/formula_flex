package com.editor.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 播放动作状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-24 下午3:25:12
	 *
	 */
	public class PlayActionStateReference extends RoleStateReference
	{
		private var _statusType : String;
		private var _repeat : int;
		private var _time : int;

		public function PlayActionStateReference()
		{
			super();
		}

		public function setParams(statusType : String, repeat : int = 0, time : int = 0) : void
		{
			_statusType = statusType;
			_repeat = repeat;
			_time = time;
		}

		public function get statusType() : String
		{
			return _statusType;
		}

		public function get repeat() : int
		{
			return _repeat;
		}

		public function get time() : int
		{
			return _time;
		}

		override public function dispose() : void
		{
			_statusType = null;
			_repeat = 0;
			_time = 0;
			super.dispose();
		}
	}
}
