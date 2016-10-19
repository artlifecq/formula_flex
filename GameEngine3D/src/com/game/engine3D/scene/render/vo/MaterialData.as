package com.game.engine3D.scene.render.vo
{
	import away3d.materials.MaterialBase;

	/**
	 *
	 * 材质数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-9 下午1:26:38
	 *
	 */
	public class MaterialData
	{
		private var _type : String;
		private var _id : Number;
		private var _name : String;
		private var _material : MaterialBase;

		public function MaterialData(type : String, id : Number, name : String, material : MaterialBase)
		{
			_type = type;
			_id = id;
			_name = name;
			_material = material;
		}

		public function get material() : MaterialBase
		{
			return _material;
		}

		public function get name() : String
		{
			return _name;
		}

		public function get id() : Number
		{
			return _id;
		}

		public function get type() : String
		{
			return _type;
		}
	}
}
