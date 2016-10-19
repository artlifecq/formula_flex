package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * buff状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 下午2:25:12
	 *
	 */
	public class BuffStateReference extends RoleStateReference
	{
		private var _disappearTime : Number;

		public function BuffStateReference()
		{
			super();
		}

		public function setParams(disappearTime : Number) : void
		{
			_disappearTime = disappearTime;
		}

		public function get disappearTime() : Number
		{
			return _disappearTime;
		}

		override public function dispose() : void
		{
			_disappearTime = 0;
			super.dispose();
		}
	}
}
