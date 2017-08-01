package com.game.engine3D.vo
{
	import flash.geom.Point;
	
	import away3d.utils.GCObject;

	/**
	 *
	 * 区域图数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-15 上午10:26:37
	 *
	 */
	public class AreaMapData extends GCObject
	{
		private var _vertexList : Vector.<Point>;
		private var _type : uint;
		private var _id : uint;
		private var _data : Object;

		public function AreaMapData(vertexList : Vector.<Point>, type : uint, id : uint, data : Object)
		{
			_vertexList = vertexList;
			_type = type;
			_id = id;
			_data = data;
		}

		public function get vertexList() : Vector.<Point>
		{
			return _vertexList;
		}

		public function get type() : uint
		{
			return _type;
		}

		public function get id() : uint
		{
			return _id;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function dispose() : void
		{
			if (_vertexList)
			{
				//_vertexList.length = 0;区域数据不用不用清空-------yt
				_vertexList = null;
			}
			_type = 0;
			_id = 0;
			_data = null;
		}
	}
}
