package com.rpgGame.coreData.info.move
{

	/**
	 *
	 * 轨迹路径点
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-20 下午2:03:17
	 *
	 */
	public class TrailPathPoint
	{
		private var _x : int;
		private var _y : int;
		private var _z : int;
		private var _speed : int;
		private var _tiltAngle : int;
		private var _baseActionSpeed : int;
		private var _statusType : String;

		public function TrailPathPoint(x : int, y : int, z : int, speed : int, tiltAngle : int, baseActionSpeed : int, statusType : String)
		{
			_x = x;
			_y = y;
			_z = z;
			_speed = speed;
			_tiltAngle = tiltAngle;
			_baseActionSpeed = baseActionSpeed;
			_statusType = statusType;
		}

		public function get x() : int
		{
			return _x;
		}

		public function set y(value : int) : void
		{
			_y = value;
		}

		public function get y() : int
		{
			return _y;
		}

		public function get z() : int
		{
			return _z;
		}

		public function get speed() : int
		{
			return _speed;
		}

		public function get tiltAngle() : int
		{
			return _tiltAngle;
		}

		public function get baseActionSpeed() : int
		{
			return _baseActionSpeed;
		}

		public function get statusType() : String
		{
			return _statusType;
		}
	}
}
