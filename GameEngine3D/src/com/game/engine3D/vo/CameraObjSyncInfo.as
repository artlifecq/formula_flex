package com.game.engine3D.vo
{
	import flash.geom.Vector3D;

	/**
	 *处理摄像机顶点看一个点 
	 * @author yfl
	 * 
	 */	
	public class CameraObjSyncInfo extends BaseObjSyncInfo
	{
		private var _target:Object;
		public function CameraObjSyncInfo(target:Object,obj:Object, syncHeight:Boolean=false, syncRotation:Boolean=false, syncVisible:Boolean=false)
		{
			_target=target;
			super(obj, syncHeight, syncRotation, syncVisible);
		}
		override public function syncInfo(position:Vector3D, rotation:Vector3D, initiator:BaseObj3D):void
		{
			if (_target&&_target.lookPos) 
			{
				super.syncInfo(_target.lookPos,rotation,initiator);
			}
			else
			{
				super.syncInfo(position,rotation,initiator);
			}
		}
		override public function dispose():void
		{
			super.dispose();
			_target=null;
		}
	}
}