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
		private var _instanceArr : Vector.<IInstancePoolClass>;
		
		public function InstancePool(name : String = "", size : int = 2147483647)
		{
			if (size < 0)
			{
				throw new Error("Pool:数量不能小于0");
			}
			_name = name;
			_maxSize = size;
			_instanceArr = new Vector.<IInstancePoolClass>;
		}
		
		public function createObj(clazz : Class, ... args) : IInstancePoolClass
		{
			var instance : IInstancePoolClass = null;
			if (_instanceArr.length == 0)
			{
				instance = ClassConstruct.construct(clazz, args);
			}
			else
			{
				instance = _instanceArr.pop();
				instance.reSet(args);
			}
			return instance;
		}
		
		public function recycleObj(instance : IInstancePoolClass) : void
		{
			if (instance == null)
			{
				return;
			}
			if (!instance.isInPool)
			{
				instance.putInPool();
			}
			if (_instanceArr.indexOf(instance) == -1)
			{
				_instanceArr[_instanceArr.length] = instance;
				resize(_maxSize);
			}
		}
		
		public function get name() : String
		{
			return _name;
		}
		
		public function get length() : int
		{
			return _instanceArr.length;
		}
		
		public function resize(size : int) : void
		{
			if (size < 0)
			{
				return;
			}
			_maxSize = size;
			var instance : IInstancePoolClass = null;
			while (_instanceArr.length > _maxSize)
			{
				instance = _instanceArr.pop();
				if (!instance.isDestroyed)
				{
					instance.instanceDestroy();
				}
			}
		}
		
		public function removeObj(instance : IInstancePoolClass) : void
		{
			if (instance == null)
			{
				return;
			}
			if (!instance.isDestroyed)
			{
				instance.instanceDestroy();
			}
			var index : int = _instanceArr.indexOf(instance);
			if (index > -1)
			{
				_instanceArr.splice(index, 1);
			}
		}
		
		public function removeAllObjs() : void
		{
			var instance : IInstancePoolClass = null;
			var len : int = _instanceArr.length;
			while (len > 0)
			{
				len--;
				instance = _instanceArr[len];
				if (!instance.isDestroyed)
				{
					instance.instanceDestroy();
				}
			}
			_instanceArr.length = 0;
		}
	}
}
