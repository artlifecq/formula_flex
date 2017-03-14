package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.scene.render.RenderUnit3D;

	/**
	 *
	 * 渲染单元子对象
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-30 下午1:26:38
	 *
	 */
	public class RenderUnitChild
	{
		private var _renderUnit : RenderUnit3D;
		private var _childName : String;
		private var _boneName : String;
		private var _compositeIndex : int;
		private var _meshIndex : int;

		public function RenderUnitChild(renderUnit : RenderUnit3D, childName : String = null, boneName : String = null, compositeIndex : int = -1, meshIndex : int = 0)
		{
			_renderUnit = renderUnit;
			_childName = childName;
			_boneName = boneName;
			_compositeIndex = compositeIndex;
			_meshIndex = meshIndex;
		}

		public function get renderUnit() : RenderUnit3D
		{
			return _renderUnit;
		}

		public function get childName() : String
		{
			return _childName;
		}

		public function get boneName() : String
		{
			return _boneName;
		}
		
		public function set boneName(value : String) : void
		{
			this._boneName = value;
		}

		public function get compositeIndex() : int
		{
			return _compositeIndex;
		}

		public function get meshIndex() : int
		{
			return _meshIndex;
		}

		public function destroy() : void
		{
			_renderUnit = null;
			_childName = null;
			_boneName = null;
			_compositeIndex = -1;
			_meshIndex = 0;
		}
	}
}
