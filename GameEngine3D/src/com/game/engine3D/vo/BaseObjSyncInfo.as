package com.game.engine3D.vo
{

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
		private var _offsetX : Number;
		private var _offsetY : Number;
		private var _offsetZ : Number;

		public function BaseObjSyncInfo(obj : Object, syncHeight : Boolean = false, syncRotation : Boolean = false)
		{
			_obj = obj;
			_syncHeight = syncHeight;
			_syncRotation = syncRotation;
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

		public function syncPos(position : Vector3D, rotation : Vector3D, initiator : BaseObj3D) : void
		{
			if (!_obj)
				return;
			if (_obj is ObjectContainer3D)
			{
				(_obj as ObjectContainer3D).x = position.x + _offsetX;
				(_obj as ObjectContainer3D).z = position.z + _offsetZ;
				if (_syncHeight)
				{
					(_obj as ObjectContainer3D).y = position.y + _offsetY;
				}
				if (_syncRotation)
				{
					(_obj as ObjectContainer3D).rotationX = rotation.x;
					(_obj as ObjectContainer3D).rotationY = rotation.y;
					(_obj as ObjectContainer3D).rotationZ = rotation.z;
				}
				(_obj as ObjectContainer3D).sceneTransform; //执行变换 
			}
			else if (_obj is BaseObj3D)
			{
				if ((_obj as BaseObj3D).usable)
				{
					(_obj as BaseObj3D).syncX(position.x + _offsetX, initiator);
					(_obj as BaseObj3D).syncZ(position.z + _offsetZ, initiator);
					if (_syncHeight)
					{
						(_obj as BaseObj3D).syncY(position.y + _offsetY, initiator);
					}
					if (_syncRotation)
					{
						(_obj as BaseObj3D).syncRotationX(rotation.x, initiator);
						(_obj as BaseObj3D).syncRotationY(rotation.y, initiator);
						(_obj as BaseObj3D).syncRotationZ(rotation.z, initiator);
					}
				}
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

		public function get obj() : Object
		{
			if (_obj is BaseObj3D)
			{
				if ((_obj as BaseObj3D).usable)
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
			_offsetX = 0;
			_offsetY = 0;
			_offsetZ = 0;
		}
	}
}
