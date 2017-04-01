package com.game.engine3D.vo
{
	
	import com.game.engine3D.scene.display.IBindable;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 *
	 * 基本3D元素同步信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-25 上午10:26:37
	 *
	 */
	public class BaseObjSyncInfo
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
					ObjectContainer3D(_obj).visible = initiator.graphicDis.parent;
				}
				ObjectContainer3D(_obj).sceneTransform; //执行变换 
			}
			else if (_obj is BaseObj3D)
			{
				if (BaseObj3D(_obj).usable)
				{
					BaseObj3D(_obj).syncX(position.x + _offsetX, initiator);
					BaseObj3D(_obj).syncZ(position.z + _offsetZ, initiator);
					if (_syncHeight)
					{
						BaseObj3D(_obj).syncY(position.y + _offsetY, initiator);
					}
					if (_syncRotation)
					{
						BaseObj3D(_obj).syncRotationX(rotation.x, initiator);
						BaseObj3D(_obj).syncRotationY(rotation.y, initiator);
						BaseObj3D(_obj).syncRotationZ(rotation.z, initiator);
					}
					if (_syncVisible)
					{
						BaseObj3D(_obj).visible = initiator.graphicDis.parent;
					}
				}
			}
			else if (_obj is IBindable)
			{
				IBindable(_obj).updateTranform();
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
