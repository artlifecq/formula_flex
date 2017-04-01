package com.editor.display
{
	import com.editor.manager.SceneManager;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;

	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Vector3D;

	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.events.MouseEvent3D;
	import away3d.materials.ColorMaterial;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 区域
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 下午2:03:17
	 *
	 */
	public class Area3D
	{
		private static var shape : Shape;
		private static var gridMaterial : ColorMaterial;
		protected var _selected : Boolean = false;
		protected var _selectedArea : Boolean = false;
		private var _selectedPolygonVertex : PolygonVertex3D;
		protected var _polygonVertexes : Array;
		private var _shapeBmd : BitmapData;
		private var _overShapeBmd : BitmapData;
		private var _selectShapeBmd : BitmapData;
		private var _polygonMaterial : TextureMaterial;
		private var _polygonOverMaterial : TextureMaterial;
		private var _polygonSelectedMaterial : TextureMaterial;
		private var _parent : ObjectContainer3D;
		private var _geometry : ClingGroundPlaneGeometry;
		private var _polygon : Mesh;
		private var _minPosition : Vector3D;
		private var _maxPosition : Vector3D;
		protected var _points : Vector.<Point>;
		protected var _center : Point;
		protected var _areaMouseEnabled : Boolean;
		private var _showBound : Boolean;
		private var _showFill : Boolean;
		private var _visible : Boolean;
		private var _gridGeometry : PlaneGeometry;
		private var _gridMeshs : Array;

		public function Area3D(parent : ObjectContainer3D, showBound : Boolean = false, showFill : Boolean = true)
		{
			_polygonVertexes = [];
			_parent = parent;
			_showBound = showBound;
			_showFill = showFill;
			_visible = true;
			_gridGeometry = null;
			_gridMeshs = [];

			if (!shape)
			{
				shape = new Shape();
				shape.graphics.clear();
			}
			if (!gridMaterial)
			{
				gridMaterial = new ColorMaterial(0x333333, 0.5);
				gridMaterial.blendMode = BlendMode.LAYER;
			}
		}

		public function set areaMouseEnabled(value : Boolean) : void
		{
			_areaMouseEnabled = value;
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				pv.mouseEnabled = _areaMouseEnabled;
			}
			updateAreaMouseEnabled();
		}

		public function get points() : Vector.<Point>
		{
			return _points;
		}

		public function createPolygonVertex(x : Number, z : Number) : PolygonVertex3D
		{
			var polygonVertex : PolygonVertex3D = new PolygonVertex3D(_parent, onPolygonVertexMouseDown);
			var position : Vector3D = new Vector3D(x, SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(x, z), z);
			polygonVertex.position = position;
			polygonVertex.show();
			_polygonVertexes.push(polygonVertex);
			polygonVertex.visible = _visible;
			polygonVertex.mouseEnabled = _areaMouseEnabled;
			updateFill();
			return polygonVertex;
		}

		public function updateGrids(gridWidth : int, gridHeight : int, gridPoses : Array) : void
		{
			clearGrids();
			if (gridWidth > 0 && gridHeight > 0)
			{
				_gridGeometry = new PlaneGeometry(gridWidth, gridHeight, 1, 1, false, true);
				for each (var pos : Point in gridPoses)
				{
					var mesh : Mesh = new Mesh(_gridGeometry, gridMaterial);
					_parent.addChild(mesh);
					mesh.showBounds = true;
                    mesh.position = new Vector3D(pos.x, pos.y, 0);
					//mesh.position = new Vector3D(pos.x, SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(pos.x, pos.y), pos.y);
					_gridMeshs.push(mesh);
				}
			}
		}

		public function checkPlacementArea() : Boolean
		{
			var vertexesLen : int = _polygonVertexes.length;
			var valid : Boolean = false;
			var position : Vector3D;
			if (vertexesLen > 0)
			{
				var pv : PolygonVertex3D;
				for (var i : int = 0; i < vertexesLen; i++)
				{
					pv = _polygonVertexes[i];
					position = pv.position.clone();
                    position.y = position.z;
                    position.z = 0;
					if (!PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, position))
						valid = true;
				}
			}
			return valid;
		}

		public function checkPlacementAreaByCenter(x : Number, z : Number) : Boolean
		{
			var vertexesLen : int = _polygonVertexes.length;
			var valid : Boolean = false;
			var position : Vector3D;
			if (vertexesLen > 0)
			{
				var dx : int = x - _center.x;
				var dy : int = z - _center.y;
				var pv : PolygonVertex3D;
				for (var i : int = 0; i < vertexesLen; i++)
				{
					pv = _polygonVertexes[i];
					position = pv.position.clone();
					position.x = position.x + dx;
					position.z = position.z + dy;
					position.y = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(position.x, position.z);
					if (!PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, position))
						valid = true;
				}
			}
			return valid;
		}

		public function checkPlacementPos(x : Number, z : Number, target : PolygonVertex3D = null) : Boolean
		{
			var vertexesLen : int = _polygonVertexes.length;
			var valid : Boolean = false;
			var position : Vector3D;
			if (vertexesLen > 0)
			{
				var pv : PolygonVertex3D;
				for (var i : int = 0; i < vertexesLen; i++)
				{
					pv = _polygonVertexes[i];
					if (pv != target)
					{
						position = pv.position.clone();
						if (!PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, position))
							valid = true;
					}
				}
			}
			if (!valid)
			{
				position = new Vector3D(x, z, 0);
				valid = !PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, position);
			}
			return valid;
		}

		public function removePolygonVertex(pv : PolygonVertex3D) : void
		{
			if (pv)
			{
				if (pv == _selectedPolygonVertex)
					selectPolygonVertex = null;
				var index : int = _polygonVertexes.indexOf(pv);
				if (index != -1)
				{
					_polygonVertexes.splice(index, 1);
					pv.dispose();
				}
				updateFill();
			}
		}

		public function setPolygonVertexPos(x : Number, z : Number) : void
		{
			if (selectPolygonVertex)
			{
				var y : Number = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(x, z);
				var position : Vector3D = new Vector3D(x, y, z);
				selectPolygonVertex.position = position;
				updateFill();
			}
		}

		public function setAreaPos(x : Number, z : Number) : void
		{
			var dx : int = x - _center.x;
			var dy : int = z - _center.y;
			var vertexesLen : int = _polygonVertexes.length;
			var pv : PolygonVertex3D;
			var position : Vector3D;
			for (var i : int = 0; i < vertexesLen; i++)
			{
				pv = _polygonVertexes[i];
				position = pv.position;
				position.x = position.x + dx;
				position.z = position.z + dy;
				position.y = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(position.x, position.z) + 20;
				pv.position = position;
			}
			updateFill();
		}

		public function set selectPolygonVertex(pv : PolygonVertex3D) : void
		{
			if (_selectedPolygonVertex)
				_selectedPolygonVertex.selected = false;
			_selectedPolygonVertex = pv;
			if (_selectedPolygonVertex)
				_selectedPolygonVertex.selected = true;
			else
				selectedArea = true;
			updateAreaMouseEnabled();
		}

		public function get selectPolygonVertex() : PolygonVertex3D
		{
			return _selectedPolygonVertex;
		}

		public function get selected() : Boolean
		{
			return _selected;
		}

		public function updateSelected() : void
		{
			if (!selectPolygonVertex)
			{
				if (_selected)
				{
					if (_polygonVertexes.length > 2)
					{
						selectedArea = true;
					}
					else
					{
						selectPolygonVertex = _polygonVertexes[0];
						selectedArea = false;
					}
				}
				else
				{
					selectedArea = false;
				}
			}
			else
			{
				if (!_selected)
				{
					selectPolygonVertex = null;
					selectedArea = false;
				}
			}
			updateAreaMouseEnabled();
		}

		public function set selected(value : Boolean) : void
		{
			if (_selected == value)
				return;
			_selected = value;
			updateSelected();
		}

		public function get selectedArea() : Boolean
		{
			return _selectedArea;
		}

		public function set selectedArea(value : Boolean) : void
		{
			_selectedArea = value;
			if (_polygon)
			{
				if (_selectedArea)
					_polygon.material = _polygonSelectedMaterial;
				else
					_polygon.material = _polygonMaterial;
			}
			updateAreaMouseEnabled();
		}

		private function onPolygonVertexMouseDown(polygonVertex : PolygonVertex3D) : void
		{
			selectPolygonVertex = polygonVertex;
			selectedArea = false;
			updateAreaMouseEnabled();
			updateCamera();
		}

		private function clear() : void
		{
			clearGrids();
			if (_shapeBmd)
			{
				_shapeBmd.dispose();
				_shapeBmd = null;
			}
			if (_overShapeBmd)
			{
				_overShapeBmd.dispose();
				_overShapeBmd = null;
			}
			if (_selectShapeBmd)
			{
				_selectShapeBmd.dispose();
				_selectShapeBmd = null;
			}
			if (_polygonMaterial)
			{
				_polygonMaterial.dispose();
				_polygonMaterial = null;
			}
			if (_polygonOverMaterial)
			{
				_polygonOverMaterial.dispose();
				_polygonOverMaterial = null;
			}
			if (_polygonSelectedMaterial)
			{
				_polygonSelectedMaterial.dispose();
				_polygonSelectedMaterial = null;
			}
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
			if (_geometry)
			{
				_geometry.dispose();
				_geometry = null;
			}
			_minPosition = null;
			_maxPosition = null;
			_center = null;
			_points = null;
		}

		private function updatePosition() : void
		{
			_minPosition = new Vector3D(int.MAX_VALUE, int.MAX_VALUE, int.MAX_VALUE);
			_maxPosition = new Vector3D(int.MIN_VALUE, int.MIN_VALUE, int.MIN_VALUE);

			var vertexesLen : int = _polygonVertexes.length;
			var pv : PolygonVertex3D;
			var hy : Number;
			_points = new Vector.<Point>();
			for (var i : int = 0; i < vertexesLen; i++)
			{
				pv = _polygonVertexes[i];
				hy = SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(pv.position.x, pv.position.z);

				if (pv.position.x < _minPosition.x)
					_minPosition.x = pv.position.x;
				if (hy < _minPosition.y)
					_minPosition.y = hy;
				if (pv.position.z < _minPosition.z)
					_minPosition.z = pv.position.z;

				if (pv.position.x > _maxPosition.x)
					_maxPosition.x = pv.position.x;
				if (hy > _maxPosition.y)
					_maxPosition.y = hy;
				if (pv.position.z > _maxPosition.z)
					_maxPosition.z = pv.position.z;
				_points.push(new Point(int(pv.position.x), int(pv.position.z)));
			}
			_center = MathUtil.clockwiseSortPoints(_points);
		}

		private function updatePolygonPos() : void
		{
			_polygon.x = _minPosition.x;
			//_polygon.z = _minPosition.z;
			//_polygon.y = 10;
            _polygon.y = _minPosition.z;
            _polygon.z = 0;

			_geometry.x = _minPosition.x;
			_geometry.y = _minPosition.z;
		}

		protected function updateFill() : void
		{
			clear();
			updatePosition();

			drawShape(0x0000ff);
			if (_shapeBmd)
			{
				_shapeBmd.dispose();
				_shapeBmd = null;
			}
			_shapeBmd = new BitmapData(256, 256, true, 0);
			var m : Matrix = new Matrix();
			m.scale(1, -1); //倒置坐标
			m.ty = 256;
			_shapeBmd.draw(shape, m);
			_polygonMaterial = new TextureMaterial(Cast.asyncTexture(_shapeBmd, true, false, false));
			_polygonMaterial.blendMode = BlendMode.LAYER;

			drawShape(0x00ff00);
			_overShapeBmd = new BitmapData(256, 256, true, 0);
			_overShapeBmd.draw(shape, m);
			_polygonOverMaterial = new TextureMaterial(Cast.asyncTexture(_overShapeBmd, true, false, false));
			_polygonOverMaterial.blendMode = BlendMode.LAYER;

			drawShape(0xff0000);
			_selectShapeBmd = new BitmapData(256, 256, true, 0);
			_selectShapeBmd.draw(shape, m);
			_polygonSelectedMaterial = new TextureMaterial(Cast.asyncTexture(_selectShapeBmd, true, false, false));
			_polygonSelectedMaterial.blendMode = BlendMode.LAYER;

			_geometry = new ClingGroundPlaneGeometry(SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper, _maxPosition.x - _minPosition.x, _maxPosition.z - _minPosition.z, 50, 50, false, true);
			_polygon = new Mesh(_geometry, _polygonMaterial);
			_polygon.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDownEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOverEvent3D);
			_polygon.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOutEvent3D);
			_parent.addChild(_polygon);
			_polygon.visible = _visible;
			updateAreaMouseEnabled();

			if (_selectedArea)
				_polygon.material = _polygonSelectedMaterial;

			updatePolygonPos();
		}

		private function drawShape(color : uint, alpha : Number = 0.5) : void
		{
			var w : int = 256;
			var h : int = 256;
			var scaleX : Number = w / (_maxPosition.x - _minPosition.x);
			var scaleY : Number = h / (_maxPosition.z - _minPosition.z);

			shape.graphics.clear();
			if (_showBound)
			{
				shape.graphics.beginFill(0x666666, alpha);
				shape.graphics.drawRect(0, 0, w, h);
				shape.graphics.endFill();
			}

			if (_showFill)
			{
				shape.graphics.beginFill(color, alpha);
				var pLen : int = _points.length;
				for (var i : int = 0; i < pLen; i++)
				{
					var p : Point = _points[i];
					var nPvX : int = scaleX * (p.x - _minPosition.x);
					var nPvY : int = scaleY * (p.y - _minPosition.z);
					if (i == 0)
						shape.graphics.moveTo(nPvX, nPvY);
					else
						shape.graphics.lineTo(nPvX, nPvY);
				}
				shape.graphics.endFill();
			}

//			shape.graphics.beginFill(0xffff00);
//			shape.graphics.drawRect(scaleX * (_center.x - _minPosition.x - 128), scaleY * (_center.y - _minPosition.z - 128), 256 * scaleX, 256 * scaleY);
//			shape.graphics.endFill();
		}

		private function handleMouseDownEvent3D(e : MouseEvent3D) : void
		{
			if (selectPolygonVertex)
				return;
			selectedArea = true;
			selectPolygonVertex = null;
			updateAreaMouseEnabled();

			updateCamera();
		}

		private function updateCamera() : void
		{
			//CameraManager.targetPlayer.position = position;
		}

		private function handleMouseOverEvent3D(e : MouseEvent3D) : void
		{
			if (selectPolygonVertex)
				return;
			if (!_selectedArea)
				_polygon.material = _polygonOverMaterial;
		}

		private function handleMouseOutEvent3D(e : MouseEvent3D) : void
		{
			if (selectPolygonVertex)
				return;
			if (!_selectedArea)
				_polygon.material = _polygonMaterial;
		}

		private function updateAreaMouseEnabled() : void
		{
			if (_polygon)
			{
				if (selectPolygonVertex || selectedArea)
					_polygon.mouseEnabled = false;
				else
					_polygon.mouseEnabled = _areaMouseEnabled;
			}
		}

		public function getBornArae() : String
		{
			var pStrs : Array = [];
			var pLen : int = _points.length;
			for (var i : int = 0; i < pLen; i++)
			{
				var p : Point = _points[i];
				pStrs.push(p.x + "=" + p.y);
			}
			return pStrs.join(";");
		}

		public function get position() : Vector3D
		{
			if (_center)
				return new Vector3D(_center.x, SceneManager.getInstance().mainScene.sceneMapLayer.queryHeightAt(_center.x, _center.y), _center.y);
			return null;
		}

		public function get vertexesCount() : int
		{
			return _polygonVertexes.length;
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
			if (_polygonVertexes)
			{
				for each (var pv : PolygonVertex3D in _polygonVertexes)
				{
					pv.visible = _visible;
				}
			}
			if (_gridMeshs)
			{
				for each (var mesh : Mesh in _gridMeshs)
				{
					mesh.visible = _visible;
				}
			}
		}

		public function clearGrids() : void
		{
			if (_gridGeometry)
			{
				_gridGeometry.dispose();
				_gridGeometry = null;
			}
			if (_gridMeshs)
			{
				var gridLen : int = _gridMeshs.length;
				var mesh : Mesh;
				for (var i : int = 0; i < gridLen; i++)
				{
					mesh = _gridMeshs[i];
					if (mesh.parent)
						mesh.parent.removeChild(mesh);
					mesh.dispose();
					mesh = null;
				}
				_gridMeshs.length = 0;
			}
		}

		public function dispose() : void
		{
			clear();
			if (_polygonVertexes)
			{
				var vertexesLen : int = _polygonVertexes.length;
				var pv : PolygonVertex3D;
				for (var i : int = 0; i < vertexesLen; i++)
				{
					pv = _polygonVertexes[i];
					pv.dispose();
				}
				_polygonVertexes.length = 0;
				_polygonVertexes = null;
			}
			_visible = false;
			_gridMeshs = null;
		}
	}
}
