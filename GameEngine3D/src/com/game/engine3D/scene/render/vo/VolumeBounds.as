package com.game.engine3D.scene.render.vo
{
	import flash.geom.Vector3D;

	/**
	 *
	 * 体积边界
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-30 上午10:26:37
	 *
	 */
	public class VolumeBounds
	{
		private var _min : Vector3D;
		private var _max : Vector3D;

		public function VolumeBounds(minX : Number = 0, minY : Number = 0, minZ : Number = 0, maxX : Number = 0, maxY : Number = 0, maxZ : Number = 0)
		{
			_min = new Vector3D(minX, minY, minZ);
			_max = new Vector3D(maxX, maxY, maxZ);
		}

		public function setTo(minX : Number = 0, minY : Number = 0, minZ : Number = 0, maxX : Number = 0, maxY : Number = 0, maxZ : Number = 0) : void
		{
			_min.setTo(minX, minY, minZ);
			_max.setTo(maxX, maxY, maxZ);
		}

		public function get minX() : Number
		{
			return _min.x;
		}

		public function set minX(value : Number) : void
		{
			_min.x = value;
		}

		public function get minY() : Number
		{
			return _min.y;
		}

		public function set minY(value : Number) : void
		{
			_min.y = value;
		}

		public function get minZ() : Number
		{
			return _min.z;
		}

		public function set minZ(value : Number) : void
		{
			_min.z = value;
		}

		public function get maxX() : Number
		{
			return _max.x;
		}

		public function set maxX(value : Number) : void
		{
			_max.x = value;
		}

		public function get maxY() : Number
		{
			return _max.y;
		}

		public function set maxY(value : Number) : void
		{
			_max.y = value;
		}

		public function get maxZ() : Number
		{
			return _max.z;
		}

		public function set maxZ(value : Number) : void
		{
			_max.z = value;
		}

		public function get width() : Number
		{
			return _max.x - _min.x;
		}

		public function get height() : Number
		{
			return _max.y - _min.y;
		}

		public function get depth() : Number
		{
			return _max.z - _min.z;
		}
	}
}
