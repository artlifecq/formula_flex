package com.editor.display
{
	import com.editor.manager.SceneManager;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.core.poolObject.PoolEntityContainer3D;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.Matrix;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.utils.Cast;

	/**
	 *
	 * 图形区域
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-7 上午10:03:17
	 *
	 */
	public class ShapeArea3D
	{
		private static var shape : Shape;
		private var _shapeBmd : BitmapData;
		private var _polygonMaterial : TextureMaterial;
		private var _parent : ObjectContainer3D;
		private var _container : ObjectContainer3D;
		private var _polygons : Vector.<Mesh>;
		private var _geometrys : Vector.<ClingGroundPlaneGeometry>;

		public function ShapeArea3D(parent : ObjectContainer3D)
		{
			_parent = parent;
            if (GlobalConfig.use25DMap)
                _container = PoolEntityContainer3D.create();
            else
                _container = PoolContainer3D.create();
			//_container = new ObjectContainer3D();
			_parent.addChild(_container);
			_polygons = new Vector.<Mesh>();
			_geometrys = new Vector.<ClingGroundPlaneGeometry>();
			if (!shape)
			{
				shape = new Shape();
				shape.graphics.clear();
			}
		}

		private function clear() : void
		{
			if (_shapeBmd)
			{
				_shapeBmd.dispose();
				_shapeBmd = null;
			}
			if (_polygonMaterial)
			{
				_polygonMaterial.dispose();
				_polygonMaterial = null;
			}
			if (_polygons)
			{
				for each (var polygon : Mesh in _polygons)
				{
					if (polygon.parent)
						polygon.parent.removeChild(polygon);
					polygon.dispose();
				}
				_polygons.length = 0;
			}
			if (_geometrys)
			{
				for each (var geometry : ClingGroundPlaneGeometry in _geometrys)
				{
					geometry.dispose();
				}
				_geometrys.length = 0;
			}
		}

		public function updateFill(x : Number, y : Number, z : Number, color : uint, shapeType : int, range : int, width : int, repeatTimes : int = 1, spaceGap : int = 0, offsetX : int = 0, angle : Number = 0, alpha : Number = 0.5) : void
		{
			clear();

			drawShape(color, alpha, shapeType, width);
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

			var currX : Number = 0;
			var geometry : ClingGroundPlaneGeometry;
			var polygon : Mesh;
			for (var i : int = 0; i < repeatTimes; i++)
			{
				if (shapeType == 1) //直线
				{
					geometry = new ClingGroundPlaneGeometry(SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper, range, width, 10, 10, false, true);
					polygon = new Mesh(geometry, _polygonMaterial);
					polygon.x = currX + offsetX;
					polygon.z = -width * 0.5;
				}
				else if (shapeType == 2) //圆形
				{
					geometry = new ClingGroundPlaneGeometry(SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper, range * 2, range * 2, 10, 10, false, true);
					polygon = new Mesh(geometry, _polygonMaterial);
					polygon.x = currX - range + offsetX;
					polygon.z = -range;
				}
				else if (shapeType == 3) //扇形
				{
					geometry = new ClingGroundPlaneGeometry(SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper, range * 2, range * 2, 10, 10, false, true);
					polygon = new Mesh(geometry, _polygonMaterial);
					polygon.x = currX - range + offsetX;
					polygon.z = -range;
				}
				else if (shapeType == 4) //正方形
				{
					geometry = new ClingGroundPlaneGeometry(SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper, range * 2, range * 2, 10, 10, false, true);
					polygon = new Mesh(geometry, _polygonMaterial);
					polygon.x = currX - range + offsetX;
					polygon.z = -range;
				}
				_container.addChild(polygon);
				geometry.rotationY = angle;
				_polygons.push(polygon);
				_geometrys.push(geometry);
				currX += spaceGap;
			}
			_container.rotationY = 360 - angle;
			setPosition(x, y, z);
		}

		public function setPosition(x : Number, y : Number, z : Number) : void
		{
			_container.x = x;
			_container.y = y;
			_container.z = z;
			var len : int = _polygons.length;
			for (var i : int = 0; i < len; i++)
			{
				var polygon : Mesh = _polygons[i];
				var geometry : ClingGroundPlaneGeometry = _geometrys[i];
				geometry.x = x + polygon.x;
				geometry.y = z + polygon.z;
			}
		}

		private function drawShape(color : uint, alpha : Number, shapeType : int, angle : int) : void
		{
			shape.graphics.clear();
			shape.graphics.beginFill(color, alpha);
			shape.graphics.lineStyle(0, 0, 0);

			if (shapeType == 1)
			{
				shape.graphics.drawRect(0, 0, 256, 256);
			}
			else if (shapeType == 2)
			{
				shape.graphics.drawCircle(128, 128, 128);
			}
			else if (shapeType == 3)
			{
				drawSector(shape, 128, 128, 128, angle * 0.5, -angle * 0.5);
			}
			else if (shapeType == 4)
			{
				shape.graphics.drawRect(0, 0, 256, 256);
			}
			shape.graphics.endFill();
		}

		private function drawSector(shape : Shape, x : Number = 0, y : Number = 0, r : Number = 100, angle : Number = 30, startAngle : Number = 0) : void
		{
			shape.graphics.moveTo(x, y);
			angle = (Math.abs(angle) > 360) ? 360 : angle;
			var n : Number = Math.ceil(Math.abs(angle - startAngle) / 45);
			var angleStep : Number = (angle - startAngle) / n;
			angleStep = angleStep * Math.PI / 180;
			startAngle = startAngle * Math.PI / 180;
			shape.graphics.lineTo(x + r * Math.cos(startAngle), y + r * Math.sin(startAngle));
			for (var i : int = 1; i <= n; i++)
			{
				startAngle += angleStep;
				var angleMid : Number = startAngle - angleStep / 2;
				var bx : Number = x + r / Math.cos(angleStep / 2) * Math.cos(angleMid);
				var by : Number = y + r / Math.cos(angleStep / 2) * Math.sin(angleMid);
				var cx : Number = x + r * Math.cos(startAngle);
				var cy : Number = y + r * Math.sin(startAngle);
				shape.graphics.curveTo(bx, by, cx, cy);
			}
			if (angle != 360)
			{
				shape.graphics.lineTo(x, y);
			}
		}

		public function dispose() : void
		{
			clear();
			if (_container)
			{
				if (_container.parent)
					_container.parent.removeChild(_container);
				_container.dispose();
				_container = null;
			}
			_polygons = null;
			_geometrys = null;
		}
	}
}
