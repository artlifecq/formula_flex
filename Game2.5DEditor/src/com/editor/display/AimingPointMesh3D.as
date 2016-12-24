package com.editor.display
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;

	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;

	/**
	 *
	 * 瞄准点模型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-24 下午2:03:17
	 *
	 */
	public class AimingPointMesh3D extends Mesh
	{
		private var _meshMaterial : TextureMaterial;
		private var _meshSelectedMaterial : TextureMaterial;
		private var _shapeBmd : BitmapData;
		private var _selectShapeBmd : BitmapData;
		private var _shape : AimingPointShape;
		private var _isSelected : Boolean;

		public function AimingPointMesh3D(text : String)
		{
			_shape = new AimingPointShape(text);
			_shapeBmd = new BitmapData(256, 256, true, 0);
			var m : Matrix = new Matrix();
			m.tx = 128;
			m.ty = 128;
			_shapeBmd.draw(_shape, m);
			_meshMaterial = new TextureMaterial(Cast.bitmapTexture(_shapeBmd));
			_meshMaterial.alphaBlending = true;

			_shape.selected = true;
			_selectShapeBmd = new BitmapData(256, 256, true, 0);
			_selectShapeBmd.draw(_shape, m);
			_meshSelectedMaterial = new TextureMaterial(Cast.bitmapTexture(_selectShapeBmd));
			_meshSelectedMaterial.alphaBlending = true;

			super(new PlaneGeometry(256, 256), _meshMaterial);
		}

		public function get selected() : Boolean
		{
			return _isSelected;
		}

		public function set selected(value : Boolean) : void
		{
			_isSelected = value;
			if (_isSelected)
				this.material = _meshSelectedMaterial;
			else
				this.material = _meshMaterial;
		}

		override public function dispose() : void
		{
			if (_shapeBmd)
			{
				_shapeBmd.dispose();
				_shapeBmd = null;
			}
			if (_selectShapeBmd)
			{
				_selectShapeBmd.dispose();
				_selectShapeBmd = null;
			}
			if (_meshMaterial)
			{
				_meshMaterial.dispose();
				_meshMaterial = null;
			}
			if (_meshSelectedMaterial)
			{
				_meshSelectedMaterial.dispose();
				_meshSelectedMaterial = null;
			}
			if (parent)
				parent.removeChild(this);
			super.dispose();
		}
	}
}
