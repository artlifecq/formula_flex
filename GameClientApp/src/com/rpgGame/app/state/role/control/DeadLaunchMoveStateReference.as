package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	import flash.geom.Point;

	/**
	 *
	 * 死亡击飞移动状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-11 下午5:25:12
	 *
	 */
	public class DeadLaunchMoveStateReference extends RoleStateReference
	{
		private var _atkorPos : Point;
		private var _launchHeight : int;
		private var _beatDistance : int;
		private var _beatSpeed : int;

		public function DeadLaunchMoveStateReference()
		{
			super();
		}

		public function setParams(atkorPos : Point, launchHeight : int, beatDistance : int, beatSpeed : int) : void
		{
			_atkorPos = atkorPos;
			_launchHeight = launchHeight;
			_beatDistance = beatDistance;
			_beatSpeed = beatSpeed;
		}

		public function get atkorPos() : Point
		{
			return _atkorPos;
		}

		public function get launchHeight() : int
		{
			return _launchHeight;
		}

		public function get beatDistance() : int
		{
			return _beatDistance;
		}

		public function get beatSpeed() : int
		{
			return _beatSpeed;
		}

		override public function dispose() : void
		{
			_atkorPos = null;
			_launchHeight = 0;
			_beatDistance = 0;
			_beatSpeed = 0;
			super.dispose();
		}
	}
}
