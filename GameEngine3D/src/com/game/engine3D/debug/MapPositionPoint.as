package com.game.engine3D.debug
{
	import com.game.engine3D.core.GameScene3D;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;
	import away3d.utils.GCObject;
	
	import gs.TweenLite;

	/**
	 *
	 * 地图位置点
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-6 上午11:03:17
	 *
	 */
	public class MapPositionPoint extends GCObject
	{
		private static var shape : Shape;
		private static var shapeBmd : BitmapData;
		private static var polygonMaterial : TextureMaterial;

		public static function addPositionPoint(scene : GameScene3D, x : int, y : int, shapeType : int = 1, color : uint = 0xff0000, width : int = 64, height : int = 64, autoDisposeDelay : int = 0, offsetHeight : int = 20) : MapPositionPoint
		{
			if (!scene)
				return null;
			var mpp : MapPositionPoint = new MapPositionPoint(scene, x, y, shapeType, color, width, height, autoDisposeDelay, offsetHeight);
			return mpp;
		}

		private var _parent : ObjectContainer3D;
		private var _planeGeometry : PlaneGeometry;
		private var _polygon : Mesh;

		public function MapPositionPoint(scene : GameScene3D, x : int, y : int, shapeType : int, color : uint, width : int, height : int, autoDisposeDelay : int, offsetHeight : int)
		{
			_parent = scene.sceneMapLayer;
			if (!shape)
			{
				shape = new Shape();
			}
			shape.graphics.clear();
			shape.graphics.beginFill(color);
			if (shapeType == 1) //圆形
			{
				shape.graphics.drawCircle(0, 0, 128);
			}
			else
			{
				shape.graphics.drawRect(0, 0, 256, 256);
			}
			shape.graphics.endFill();

			shapeBmd = new BitmapData(256, 256, true, 0);
			var m : Matrix = new Matrix();
			if (shapeType == 1) //圆形
			{
				m.tx = m.ty = 128;
			}
			else
			{
				m.tx = m.ty = 0;
			}
			shapeBmd.draw(shape, m);

			polygonMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));

			if (shapeType == 3) //直线
			{
				_planeGeometry = new PlaneGeometry(width, height, 1, 1, true, true);
			}
			else
			{
				_planeGeometry = new PlaneGeometry(width * 2, height * 2, 1, 1, true, true);
			}
			_polygon = new Mesh(_planeGeometry, polygonMaterial);
			_parent.addChild(_polygon);
			_polygon.mouseEnabled = false;
			if (shapeType == 3) //直线
			{
				x = x + width * 0.5;
			}
			_polygon.position = new Vector3D(x, scene.sceneMapLayer.queryHeightAt(x, y) + offsetHeight, y);
			if (autoDisposeDelay > 0)
			{
				TweenLite.delayedCall(autoDisposeDelay * 0.001, dispose);
			}
		}

		public function dispose() : void
		{
			TweenLite.killDelayedCallsTo(dispose);
			if (_polygon)
			{
				if (_polygon.parent)
					_polygon.parent.removeChild(_polygon);
				_polygon.dispose();
				_polygon = null;
			}
			if (_planeGeometry)
			{
				_planeGeometry.dispose();
				_planeGeometry = null;
			}
			_parent = null;
		}
	}
}
