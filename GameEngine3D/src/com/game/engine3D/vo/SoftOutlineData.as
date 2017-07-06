package com.game.engine3D.vo
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 软轮廓数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-4 下午1:26:38
	 *
	 */
	public class SoftOutlineData extends GCObject
	{
		private var _color : uint;
		private var _alpha : Number;
		private var _size : Number;
		private var _outlineDrawLevel : int;

		public function SoftOutlineData(color : uint = 0xff0000, alpha : Number = 0.8, size : Number = 0.005, outlineDrawLevel : int = 1)
		{
			_color = color;
			_alpha = alpha;
			_size = size;
			_outlineDrawLevel = outlineDrawLevel;
		}

		public function get outlineDrawLevel() : int
		{
			return _outlineDrawLevel;
		}

		public function get size() : Number
		{
			return _size;
		}

		public function get alpha() : Number
		{
			return _alpha;
		}

		public function get color() : uint
		{
			return _color;
		}
	}
}
