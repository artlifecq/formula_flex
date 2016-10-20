package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;

	/**
	 *
	 * 基础对象子对象
	 * @author L.L.M.Sunny
	 * 创建时间：2016-10-10 下午1:26:38
	 *
	 */
	public class BaseObjChild
	{
		private var _renderUnit : RenderUnit3D;
		private var _baseObj : BaseObj3D;
		private var _childName : String;

		public function BaseObjChild(renderUnit : RenderUnit3D, baseObj : BaseObj3D, childName : String)
		{
			_renderUnit = renderUnit;
			_baseObj = baseObj;
			_childName = childName;
		}

		public function get renderUnit() : RenderUnit3D
		{
			return _renderUnit;
		}

		public function get baseObj() : BaseObj3D
		{
			return _baseObj;
		}

		public function get childName() : String
		{
			return _childName;
		}

		public function destroy() : void
		{
			_renderUnit = null;
			_baseObj = null;
			_childName = null;
		}
	}
}
