package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	
	import away3d.utils.GCObject;
	
	/**
	 *
	 * 基础对象子对象
	 * @author L.L.M.Sunny
	 * 创建时间：2016-10-10 下午1:26:38
	 *
	 */
	public class BaseObjChild extends GCObject
	{
		private var _renderUnit : RenderUnit3D;
		private var _baseObj : BaseObj3D;
		private var _childName : String;
		private var _billboardMode : Boolean;
		private var _recycleWithParent:Boolean;
		
		public function BaseObjChild(renderUnit : RenderUnit3D, baseObj : BaseObj3D, childName : String, billboardMode : Boolean,recycleWithParent:Boolean = true)
		{
			_renderUnit = renderUnit;
			_baseObj = baseObj;
			_childName = childName;
			_billboardMode = billboardMode;
			_recycleWithParent = recycleWithParent;
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
		
		public function get billboardMode() : Boolean
		{
			return _billboardMode;
		}
		
		public function get recycleWithParent() : Boolean
		{
			return _recycleWithParent;
		}
		
		public function destroy() : void
		{
			_renderUnit = null;
			_baseObj = null;
			_childName = null;
			_billboardMode = false;
			_recycleWithParent = true;
		}
	}
}
