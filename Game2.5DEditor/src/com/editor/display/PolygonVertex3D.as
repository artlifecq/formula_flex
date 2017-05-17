package com.editor.display
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.events.MouseEvent3D;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 多边形顶点
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 下午1:03:17
	 *
	 */
	public class PolygonVertex3D
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
		private var _data : Object;
		private var _visible : Boolean;

		public function PolygonVertex3D(parent : ObjectContainer3D, mouseDownHandler : Function = null)
		{
			super();
			_visible = true;
			_parent = parent;
			_mouseDownHandler = mouseDownHandler;
			_position = new Vector3D();
			if (!shape)
			{
				shape = new Shape();
				shape.graphics.beginFill(0xffff00);
				shape.graphics.drawCircle(0, 0, 128);
				shape.graphics.endFill();

				shapeBmd = new BitmapData(256, 256, true, 0);
				var m : Matrix = new Matrix();
				m.tx = m.ty = 128;
				shapeBmd.draw(shape, m);

				_polygonMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				_polygonMaterial.blendMode = BlendMode.LAYER;

				shapeBmd = new BitmapData(256, 256, true, 0);
				shape.graphics.clear();
				shape.graphics.beginFill(0x00ff00);
				shape.graphics.drawCircle(0, 0, 128);
				shape.graphics.endFill();
				shapeBmd.draw(shape, m);

				_polygonOverMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				_polygonOverMaterial.blendMode = BlendMode.LAYER;

				shapeBmd = new BitmapData(256, 256, true, 0);
				shape.graphics.clear();
				shape.graphics.beginFill(0xff0000);
				shape.graphics.drawCircle(0, 0, 128);
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

		public function show() : void
		{
			_polygon = new Mesh(new PlaneGeometry(64, 64, 1, 1, false, true), _polygonMaterial);
			_polygon.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOverEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOutEvent3D);
			_parent.addChild(_polygon);
            var p : Vector3D = _position.clone();
            p.y = p.z;
            p.z = 0;
			_polygon.position = p;
			_polygon.mouseEnabled = _mouseEnabled;
			_polygon.visible = _visible;
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
            if (_polygon) {
                var p : Vector3D = new Vector3D(value.x, value.z, 0);
                _polygon.position = p;
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
			_data = null;
		}

		private function updateMouseEnabled() : void
		{
			if (selected)
				_polygon.mouseEnabled = false;
			else
				_polygon.mouseEnabled = true;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function set data(value : Object) : void
		{
			_data = value;
		}

		public function get visible() : Boolean
		{
			return _visible;
		}

		public function set visible(value : Boolean) : void
		{
			_visible = value;
			if (_polygon)
				_polygon.visible = _visible;
		}

		public function dispose() : void
		{
			clear();
			_parent = null;
			_visible = false;
		}
	}
}
