package com.game.engine3D.core
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.vo.AreaMapData;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;

	/**
	 *
	 * 区域图，可以包含原始数据的查图
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-15 上午10:26:37
	 *
	 */
	public class AreaMap
	{
		private var _bitmapData : BitmapData;
		private var _shape : Shape;
		private var _min : Vector3D;
		private var _max : Vector3D;
		private var _offsetX : Number;
		private var _offsetY : Number;
		private var _scaleX : Number;
		private var _scaleY : Number;
		private var _dataMap : Dictionary;

		public function AreaMap(width : int = 1024, height : int = 1024)
		{
			_bitmapData = new BitmapData(width, height, false, 0);
			_shape = new Shape();
			_dataMap = new Dictionary();
		}

		public function setBounds(min : Vector3D, max : Vector3D) : void
		{
			_min = min;
			_max = max;

			if(GlobalConfig.use25DMap)
			{
				_scaleX = _bitmapData.width / (_max.x - _min.x);
				_scaleY = _bitmapData.height / (_max.y - _min.y);
				_offsetX = _min.x;
				_offsetY = _min.y;
			}
			else
			{
				_scaleX = _bitmapData.width / (_max.x - _min.x);
				_scaleY = _bitmapData.height / (_max.z - _min.z);
				_offsetX = _min.x;
				_offsetY = _min.z;
			}
		}

		public function addFlag(areaMapData : AreaMapData) : void
		{
			removeFlag(areaMapData.type, areaMapData.id);
			if (areaMapData.vertexList)
			{
				var r : uint = areaMapData.type << 16;
				var gb : uint = areaMapData.id;
				var color : uint = r | gb;
				_shape.graphics.clear();
				_shape.graphics.beginFill(color, 1);
				var len : int = areaMapData.vertexList.length;
				for (var i : int = 0; i < len; i++)
				{
					var point : Point = areaMapData.vertexList[i];
					if (i == 0)
						_shape.graphics.moveTo(point.x - _offsetX, point.y - _offsetY);
					else
						_shape.graphics.lineTo(point.x - _offsetX, point.y - _offsetY);
				}
				_shape.graphics.endFill();
				var matrix : Matrix = new Matrix();
				matrix.scale(_scaleX, _scaleY);
				_bitmapData.draw(_shape, matrix);
				_dataMap[color] = areaMapData;
				trace(GlobalConfig.DEBUG_HEAD + " " + "添加区域：" + "type:" + areaMapData.type + ",id:" + areaMapData.id + ",value:" + color);
			}
		}

		public function getFlag(x : int, y : int) : AreaMapData
		{
			var color : uint = _bitmapData.getPixel((x - _offsetX) * _scaleX, (y - _offsetY) * _scaleY);
			return _dataMap[color];
		}

		public function removeFlag(type : uint, id : uint) : void
		{
			var r : uint = type << 16;
			var gb : uint = id;
			var color : uint = r | gb;
			var areaMapData : AreaMapData = _dataMap[color];
			if (areaMapData)
			{
				_shape.graphics.clear();
				_shape.graphics.beginFill(0, 1);
				var len : int = areaMapData.vertexList.length;
				for (var i : int = 0; i < len; i++)
				{
					var point : Point = areaMapData.vertexList[i];
					if (i == 0)
						_shape.graphics.moveTo(point.x - _offsetX, point.y - _offsetY);
					else
						_shape.graphics.lineTo(point.x - _offsetX, point.y - _offsetY);
				}
				_shape.graphics.endFill();
				var matrix : Matrix = new Matrix();
				matrix.scale(_scaleX, _scaleY);
				_bitmapData.draw(_shape, matrix);
				areaMapData.dispose();
				_dataMap[color] = null;
				delete _dataMap[color];
				trace(GlobalConfig.DEBUG_HEAD + " " + "删除区域：" + "type:" + type + ",id:" + id + ",value:" + color);
			}
		}

		public function clear() : void
		{
			if (_shape)
			{
				_shape.graphics.clear();
			}
			if (_bitmapData)
			{
				_bitmapData.fillRect(_bitmapData.rect, 0);
			}
			if (_dataMap)
			{
				for (var key : * in _dataMap)
				{
					var areaMapData : AreaMapData = _dataMap[key];
					areaMapData.dispose();
					_dataMap[key] = null;
					delete _dataMap[key];
				}
			}
		}

		public function getBitmapData() : BitmapData
		{
			return _bitmapData;
		}

		public function dispose() : void
		{
			clear();
			if (_bitmapData)
			{
				_bitmapData.dispose();
				_bitmapData = null;
			}
			_shape = null;
			_dataMap = null;
		}
	}
}
