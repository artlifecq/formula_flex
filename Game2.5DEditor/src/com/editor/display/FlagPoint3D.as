package com.editor.display
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.manager.DataStructuresManager;

	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;

	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.events.MouseEvent3D;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.SphereGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 标识点
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-20 下午1:03:17
	 *
	 */
	public class FlagPoint3D
	{
		private static var shape : Shape;
		private static var shapeBmd : BitmapData;
		private static var _polygonMaterial : TextureMaterial;
		private static var _polygonOverMaterial : TextureMaterial;
		private static var _polygonSelectedMaterial : TextureMaterial;
		private var _parent : ObjectContainer3D;
		private var _polygon : Mesh;
		private var _position : Vector3D;
		private var _selected : Boolean = false;
		private var _isOver : Boolean = false;
		private var _mouseEnabled : Boolean;
		private var _mouseDownHandler : Function;
		private var _data : ConfigData;
		private var _index : uint;

		public function FlagPoint3D(parent : ObjectContainer3D, mouseDownHandler : Function = null)
		{
			super();
			_parent = parent;
			_mouseDownHandler = mouseDownHandler;
			_position = new Vector3D();
			if (!shape)
			{
				shape = new Shape();
				shape.graphics.beginFill(0xffff00);
				shape.graphics.drawRect(0, 0, 256, 256);
				shape.graphics.endFill();

				shapeBmd = new BitmapData(256, 256, true, 0);
				var m : Matrix = new Matrix();
				shapeBmd.draw(shape, m);

				_polygonMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				_polygonMaterial.blendMode = BlendMode.LAYER;

				shapeBmd = new BitmapData(256, 256, true, 0);
				shape.graphics.clear();
				shape.graphics.beginFill(0x00ff00);
				shape.graphics.drawRect(0, 0, 256, 256);
				shape.graphics.endFill();
				shapeBmd.draw(shape, m);

				_polygonOverMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				_polygonOverMaterial.blendMode = BlendMode.LAYER;

				shapeBmd = new BitmapData(256, 256, true, 0);
				shape.graphics.clear();
				shape.graphics.beginFill(0xff0000);
				shape.graphics.drawRect(0, 0, 256, 256);
				shape.graphics.endFill();
				shapeBmd.draw(shape, m);

				_polygonSelectedMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				_polygonSelectedMaterial.blendMode = BlendMode.LAYER;
			}
		}

		public function set mouseEnabled(value : Boolean) : void
		{
			_mouseEnabled = value;
			if (_polygon)
				_polygon.mouseEnabled = _mouseEnabled;
		}

		public function get isOver() : Boolean
		{
			return _isOver;
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		public function set selected(value : Boolean) : void
		{
			_selected = value;
			if (_selected)
				_polygon.material = _polygonSelectedMaterial;
			else
				_polygon.material = _polygonMaterial;
			updateMouseEnabled();
		}

		public function show(data : ConfigData, index : int) : void
		{
			_data = data;
			_index = index;
			_polygon = new Mesh(new SphereGeometry(64, 16, 16), _polygonMaterial);
			_polygon.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOverEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOutEvent3D);
			_parent.addChild(_polygon);
			_polygon.position = _position;
			_polygon.mouseEnabled = _mouseEnabled;
			updateMouseEnabled();
		}

		private function handleMouseDownEvent3D(e : MouseEvent3D) : void
		{
			if (_mouseDownHandler != null)
			{
				_mouseDownHandler(this);
			}
		}

		private function handleMouseOverEvent3D(e : MouseEvent3D) : void
		{
			if (!_selected)
				_polygon.material = _polygonOverMaterial;
			_isOver = true;
		}

		private function handleMouseOutEvent3D(e : MouseEvent3D) : void
		{
			if (!_selected)
				_polygon.material = _polygonMaterial;
			_isOver = false;
		}

		public function set position(value : Vector3D) : void
		{
			_position = value;
			if (_polygon)
				_polygon.position = _position;
		}

		public function changePosition(value : Vector3D, isClingGround : Boolean) : void
		{
			var pos : Vector3D = new Vector3D();
			pos.setTo(value.x, value.y, value.z);
			position = pos.clone();
			if (isClingGround)
			{
				pos.y = 0;
			}
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(_data.tabelName);
			if (tabel)
			{
				var trailFieldX : TabelFieldData = tabel.getField(TabelFieldData.TRAIL_POINT_X_FIELD);
				if (trailFieldX)
				{
					_data.setValue(trailFieldX.mFieldName, int(pos.x));
				}
				var trailFieldY : TabelFieldData = tabel.getField(TabelFieldData.TRAIL_POINT_Y_FIELD);
				if (trailFieldY)
				{
					_data.setValue(trailFieldY.mFieldName, int(pos.y));
				}
				var trailFieldZ : TabelFieldData = tabel.getField(TabelFieldData.TRAIL_POINT_Z_FIELD);
				if (trailFieldZ)
				{
					_data.setValue(trailFieldZ.mFieldName, int(pos.z));
				}
			}
		}

		public function get position() : Vector3D
		{
			return _position;
		}

		private function clear() : void
		{
			if (_polygon)
			{
				if (_polygon.parent)
					_polygon.parent.removeChild(_polygon);
				_polygon.removeEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
				_polygon.removeEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOverEvent3D);
				_polygon.removeEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOutEvent3D);
				_polygon.dispose();
				_polygon = null;
			}
			_isOver = false;
			_selected = false;
		}

		private function updateMouseEnabled() : void
		{
			if (selected)
				_polygon.mouseEnabled = false;
			else
				_polygon.mouseEnabled = true;
		}

		public function get data() : ConfigData
		{
			return _data;
		}

		public function get index() : uint
		{
			return _index;
		}

		public function dispose() : void
		{
			clear();
			_parent = null;
			_data = null;
		}
	}
}
