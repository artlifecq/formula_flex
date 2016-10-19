package com.game.engine3D.scene.render.vo
{
	import away3d.materials.methods.EffectMethodBase;

	/**
	 *
	 * 方法数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-9-21 下午1:26:38
	 *
	 */
	public class MethodData
	{
		private var _method : EffectMethodBase;
		private var _materialNames : Array;

		public function MethodData(method : EffectMethodBase, materialNames : Array = null)
		{
			_method = method;
			_materialNames = materialNames;
		}

		public function get method() : EffectMethodBase
		{
			return _method;
		}

		public function get materialNames() : Array
		{
			return _materialNames;
		}
	}
}
