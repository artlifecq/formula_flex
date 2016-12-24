package com.editor.display
{
	import com.editor.cfg.ConfigData;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.SceneManager;
	import com.editor.manager.TrailManager;

	import flash.geom.Vector3D;

	import away3d.primitives.WireframeLines;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;

	/**
	 *
	 * 轨迹组
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-20 下午2:03:17
	 *
	 */
	public class TrailGroup
	{
		private var _flagPoints : Array;
		private var _data : ConfigData;
		private var _uindex : uint;
		private var _mouseEnabled : Boolean;
		private var _lines : WireframeLines;
		private var _isClingGround : Boolean;

		public function TrailGroup(data : ConfigData)
		{
			_data = data;
			_flagPoints = [];
			_uindex = 0;
			_mouseEnabled = false;
			_isClingGround = false;
		}

		public function addFlag(data : ConfigData, position : Vector3D) : FlagPoint3D
		{
			_uindex++;

			var flagPoint : FlagPoint3D = new FlagPoint3D(SceneManager.getInstance().mainScene.sceneRenderLayer, onPolygonVertexMouseDown);
			var pos : Vector3D = new Vector3D();
			pos.setTo(position.x, position.y, position.z);
			if (isClingGround)
			{
				pos.y = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(pos.x, pos.z);
			}
			flagPoint.show(data, _uindex);
			flagPoint.position = pos;
			_flagPoints.push(flagPoint);
			_flagPoints.sortOn(["index"], Array.NUMERIC);
			flagPoint.mouseEnabled = _mouseEnabled;
			updateLines();
			return flagPoint;
		}

		public function createAddFlag(position : Vector3D) : void
		{
			var pos : Vector3D = new Vector3D();
			pos.setTo(position.x, position.y, position.z);
			if (_isClingGround)
			{
				pos.y = 0;
			}
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (tabel)
			{
				var data : ConfigData = DataStructuresManager.getInstance().addValuesToTabel(tabel, data, [TabelFieldData.TRAIL_POINT_X_FIELD, TabelFieldData.TRAIL_POINT_Y_FIELD, //
					TabelFieldData.TRAIL_POINT_Z_FIELD, TabelFieldData.TRAIL_POINT_SPEED_FIELD, TabelFieldData.TILT_ANGLE_FIELD, //
					TabelFieldData.BASE_ACTION_SPEED_FIELD, TabelFieldData.AVATAR_MOTION_FIELD], //
					[int(pos.x), int(pos.y), int(pos.z), 0, 0, 0, ""]);
				addFlag(data, position);
			}
		}

		public function removeFlag(flagPoint : FlagPoint3D) : void
		{
			if (!flagPoint)
				return;
			var index : int = _flagPoints.indexOf(flagPoint);
			if (index > -1)
			{
				_flagPoints.splice(index, 1);
			}
			flagPoint.dispose();
			updateLines();
		}

		public function updateLines() : void
		{
			if (_lines)
			{
				if (_lines.parent)
				{
					_lines.parent.removeChild(_lines);
				}
				_lines.dispose();
				_lines = null;
			}
			var points : Vector.<Vector3D> = new Vector.<Vector3D>();
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				points.push(flagPoint.position);
			}
			_lines = new WireframeLines(points, false, 0x00ff00, 2);
			SceneManager.getInstance().mainScene.sceneRenderLayer.addChild(_lines);
		}

		private function onPolygonVertexMouseDown(flagPoint : FlagPoint3D) : void
		{
			TrailManager.getInstance().selectedFlag = flagPoint;
		}

		public function set mouseEnabled(value : Boolean) : void
		{
			_mouseEnabled = value;
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				flagPoint.mouseEnabled = _mouseEnabled;
			}
		}

		public function getFlagByData(data : ConfigData) : FlagPoint3D
		{
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				if (flagPoint.data == data)
				{
					return flagPoint;
				}
			}
			return null;
		}

		public function get data() : ConfigData
		{
			return _data;
		}

		public function getTrailInfo() : Array
		{
			var infos : Array = [];
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				infos.push([int(flagPoint.position.x), int(flagPoint.position.y), int(flagPoint.position.z)]);
			}
			return infos;
		}

		public function get isClingGround() : Boolean
		{
			return _isClingGround;
		}

		public function set isClingGround(value : Boolean) : void
		{
			if (_isClingGround == value)
			{
				return;
			}
			_isClingGround = value;
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				var pos : Vector3D = new Vector3D();
				pos.setTo(flagPoint.position.x, flagPoint.position.y, flagPoint.position.z);
				if (_isClingGround)
				{
					pos.y = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(pos.x, pos.z);
				}
				flagPoint.changePosition(pos, _isClingGround);
			}
			updateLines();
		}

		public function dispose() : void
		{
			for each (var flagPoint : FlagPoint3D in _flagPoints)
			{
				flagPoint.dispose();
			}
			_flagPoints.length = 0;
			_data = null;
			_mouseEnabled = false;
			if (_lines)
			{
				if (_lines.parent)
				{
					_lines.parent.removeChild(_lines);
				}
				_lines.dispose();
				_lines = null;
			}
		}
	}
}
