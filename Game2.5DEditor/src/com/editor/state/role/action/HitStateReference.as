package com.editor.state.role.action
{
	import com.game.engine3D.state.role.RoleStateReference;

	import flash.geom.Point;

	/**
	 *
	 * 受击状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-11 下午5:25:12
	 *
	 */
	public class HitStateReference extends RoleStateReference
	{
		private var _atkorPos : Point;

		public function HitStateReference()
		{
			super();
		}

		public function setParams(atkorPos : Point) : void
		{
			_atkorPos = atkorPos;
		}

		public function get atkorPos() : Point
		{
			return _atkorPos;
		}

		override public function dispose() : void
		{
			_atkorPos = null;
			super.dispose();
		}
	}
}
