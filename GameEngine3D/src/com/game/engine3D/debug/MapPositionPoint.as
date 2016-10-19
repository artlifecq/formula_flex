package com.game.engine3D.debug
{
	import com.game.engine3D.core.GameScene3D;

	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;

	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 地图位置点
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-6 上午11:03:17
	 *
	 */
	public class MapPositionPoint
	{
		private static var shape : Shape;
		private static var shapeBmd : BitmapData;
		private static var polygonMaterial : TextureMaterial;
		private static var pointByName : Dictionary = new Dictionary();

		public static function setPositionPoint(scene : GameScene3D, name : String, x : int, y : int, color : uint = 0xff0000) : void
		{
			if (!scene || !name)
				return;
			var mpp : MapPositionPoint = pointByName[name];
			if (!mpp)
			{
				mpp = new MapPositionPoint(scene.sceneMapLayer, color);
				pointByName[name] = mpp;
			}
			mpp.position = new Vector3D(x, scene.sceneMapLayer.queryHeightAt(x, y) + 20, y);
		}

		private var _parent : ObjectContainer3D;
		private var _polygon : Mesh;

		public function MapPositionPoint(parent : ObjectContainer3D, color : uint)
		{
			if (!shape)
			{
				shape = new Shape();
				shape.graphics.beginFill(color);
				shape.graphics.drawCircle(0, 0, 128);
				shape.graphics.endFill();

				shapeBmd = new BitmapData(256, 256, true, 0);
				var m : Matrix = new Matrix();
				m.tx = m.ty = 128;
				shapeBmd.draw(shape, m);

				polygonMaterial = new TextureMaterial(Cast.asyncTexture(shapeBmd, true, false, false));
				polygonMaterial.alpha = 0.8;
			}

			_parent = parent;

			_polygon = new Mesh(new PlaneGeometry(64, 64, 1, 1, true, true), polygonMaterial);
			_parent.addChild(_polygon);
			_polygon.mouseEnabled = false;
		}

		public function set position(value : Vector3D) : void
		{
			if (_polygon)
				_polygon.position = value;
		}

		public function dispose() : void
		{
			if (_polygon)
			{
				if (_polygon.parent)
					_polygon.parent.removeChild(_polygon);
				_polygon.dispose();
				_polygon = null;
			}
			_parent = null;
		}
	}
}
