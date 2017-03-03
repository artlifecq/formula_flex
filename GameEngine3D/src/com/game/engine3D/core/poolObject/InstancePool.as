package com.game.engine3D.core.poolObject
{
	import org.client.mainCore.utils.ClassConstruct;

	/**
	 *
	 * 实例对象池
	 * @author L.L.M.Sunny
	 * 创建时间：2016-11-7 上午10:26:35
	 *
	 */
	public class InstancePool
	{
		private var _name : String;
		private var _maxSize : int;
		private var _objArr : Vector.<IInstancePoolClass>;

		public function InstancePool(name : String = "", size : int = 2147483647)
		{
			if (size < 0)
			{
				throw new Error("Pool:数量不能小于0");
			}
			_name = name;
			_maxSize = size;
			_objArr = new Vector.<IInstancePoolClass>;
		}

		public function createObj(clazz : Class, ... args) : IInstancePoolClass
		{
			var instance : IInstancePoolClass = null;
			if (_objArr.length == 0)
			{
				instance = ClassConstruct.construct(clazz, args);
			}
			else
			{
				instance = _objArr.pop();
				instance.reSet(args);
			}
			return instance;
		}

		public function disposeObj(obj : IInstancePoolClass) : void
		{
			if (obj == null)
			{
				return;
			}
			obj.instanceDispose();
			if (_objArr.indexOf(obj) == -1)
			{
				_objArr[_objArr.length] = obj;
				resize(_maxSize);
			}
		}

		public function get name() : String
		{
			return _name;
		}

		public function get length() : int
		{
			return _objArr.length;
		}

		public function resize(size : int) : void
		{
			if (size < 0)
			{
				return;
			}
			_maxSize = size;
			var instance : IInstancePoolClass = null;
			while (_objArr.length > _maxSize)
			{
				instance = _objArr.pop();
				instance.instanceDestroy();
			}
		}

		public function removeObj(obj : IInstancePoolClass) : void
		{
			if (obj == null)
			{
				return;
			}
			obj.instanceDestroy();
			var index : int = _objArr.indexOf(obj);
			if (index > -1)
			{
				_objArr.splice(index, 1);
			}
		}

		public function removeAllObjs() : void
		{
			var instance : IInstancePoolClass = null;
			var len : int = _objArr.length;
			while (len > 0)
			{
				len--;
				instance = _objArr[len];
				instance.instanceDestroy();
			}
			_objArr.length = 0;
		}
	}
}
