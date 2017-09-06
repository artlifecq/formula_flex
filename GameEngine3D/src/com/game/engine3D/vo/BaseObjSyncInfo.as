package com.game.engine3D.vo
{
	
	import com.game.engine3D.scene.display.IBindable;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.utils.GCObject;
	
	/**
	 *
	 * 基本3D元素同步信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-25 上午10:26:37
	 *
	 */
	public class BaseObjSyncInfo extends GCObject
	{
		private var _obj : Object;
		private var _syncHeight : Boolean;
		private var _syncRotation : Boolean;
		private var _syncVisible : Boolean;
		private var _offsetX : Number;
		private var _offsetY : Number;
		private var _offsetZ : Number;
		
		public function BaseObjSyncInfo(obj : Object, syncHeight : Boolean = false, syncRotation : Boolean = false, syncVisible : Boolean = false)
		{
			_obj = obj;
			_syncHeight = syncHeight;
			_syncRotation = syncRotation;
			_syncVisible = syncVisible;
			_offsetX = 0;
			_offsetY = 0;
			_offsetZ = 0;
		}
		
		public function setOffset(x : Number, y : Number, z : Number) : void
		{
			_offsetX = x;
			_offsetY = y;
			_offsetZ = z;
		}
		
		public function syncInfo(position : Vector3D, rotation : Vector3D, initiator : BaseObj3D) : void
		{
			if (!_obj)
				return;
			if (_obj is ObjectContainer3D)
			{
				ObjectContainer3D(_obj).x = position.x + _offsetX;
//				ObjectContainer3D(_obj).y = position.y + _offsetY;
				ObjectContainer3D(_obj).z = position.z + _offsetZ;
				if (_syncHeight)
				{
					(_obj as ObjectContainer3D).y = position.y + _offsetY;
				}
				if (_syncRotation)
				{
					ObjectContainer3D(_obj).rotationX = rotation.x;
					ObjectContainer3D(_obj).rotationY = rotation.y;
					ObjectContainer3D(_obj).rotationZ = rotation.z;
				}
				if (_syncVisible)
				{
					ObjectContainer3D(_obj).visible = initiator.graphicDis.parent != null;
				}
				ObjectContainer3D(_obj).sceneTransform; //执行变换 
			}
			else if (_obj is BaseObj3D)
			{
				if (BaseObj3D(_obj).usable)
				{
					BaseObj3D(_obj).syncPosition(position.x + _offsetX,position.y + _offsetY,position.z + _offsetZ,_syncHeight,initiator);
				
					if (_syncRotation)
					{
						BaseObj3D(_obj).syncRotation(rotation.x,rotation.y,rotation.z,initiator);
					}
					if (_syncVisible)
					{
						BaseObj3D(_obj).visible = initiator.graphicDis.parent != null;
					}
				}
			}
			else if (_obj is IBindable)
			{
				IBindable(_obj).updateTranform();
			}
			else if (_obj is IBaseObjSync)
			{
				IBaseObjSync(_obj).syncInfo(initiator, position, rotation, initiator.graphicDis.parent != null);
			}
		}
		
		public function get syncHeight() : Boolean
		{
			return _syncHeight;
		}
		
		public function get syncRotation() : Boolean
		{
			return _syncRotation;
		}
		
		public function get syncVisible() : Boolean
		{
			return _syncVisible;
		}
		
		public function get obj() : Object
		{
			if (_obj is BaseObj3D)
			{
				if (BaseObj3D(_obj).usable)
					return _obj;
				else
					return null;
			}
			return _obj;
		}
		
		public function dispose() : void
		{
			_obj = null;
			_syncHeight = false;
			_syncRotation = false;
			_syncVisible = false;
			_offsetX = 0;
			_offsetY = 0;
			_offsetZ = 0;
		}
	}
}
