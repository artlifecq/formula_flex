package com.game.engine3D.vo.map
{

	/**
	 *
	 * 客户端地图区域格子数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-9 下午2:03:17
	 *
	 */
	public class ClientMapAreaGridData
	{
		private var _id : int;
		private var _gridX : int;
		private var _gridY : int;
		private var _gridWidth : int;
		private var _gridHeight : int;
		private var _gridLeft : int;
		private var _gridRight : int;
		private var _gridTop : int;
		private var _gridBottom : int;

		public function ClientMapAreaGridData(id : int, gridX : int, gridY : int, gridWidth : int, gridHeight : int)
		{
			_id = id;
			_gridX = gridX;
			_gridY = gridY;
			_gridWidth = gridWidth;
			_gridHeight = gridHeight;
			var halfWidth : int = _gridWidth * 0.5;
			var halfHeight : int = _gridHeight * 0.5;
			_gridLeft = _gridX - halfWidth;
			_gridRight = _gridX + halfWidth;
			_gridTop = _gridY - halfHeight;
			_gridBottom = _gridY + halfHeight;
		}

		public function get id() : int
		{
			return _id;
		}

		public function get gridX() : int
		{
			return _gridX;
		}

		public function get gridY() : int
		{
			return _gridY;
		}

		public function get gridWidth() : int
		{
			return _gridWidth;
		}

		public function get gridHeight() : int
		{
			return _gridHeight;
		}

		public function get gridLeft() : int
		{
			return _gridLeft;
		}

		public function get gridRight() : int
		{
			return _gridRight;
		}

		public function get gridTop() : int
		{
			return _gridTop;
		}

		public function get gridBottom() : int
		{
			return _gridBottom;
		}
	}
}
