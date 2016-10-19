package com.game.engine2D.tools
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.ds.HashMap;

	public class FunctionCache
	{
		/**-----------------------------------------------------------------------------------------------------------------------------------------*/
		/** 第一次访问开始计时，超时删除，没有引用计数 **/
		public static const POLICY_FIRST_READ:uint = 0;
		/** 最后次访问开始计时，超时删除，没有引用计数 **/
		public static const POLICY_LAST_READ:uint = 1;
		/** 手动释放，当所有引用计数为0的时候，超时删除，再次访问后取消删除 **/
		public static const POLICY_LAST_REMOVE:uint = 2;

		private static var _preTime:int = 0;
		private static var _curTime:int = 0;
		
		public var _cacheItemPool:Pool = new Pool("CacheItem");
		
//		setup();
		private static function setup():void
		{
			var ret:GameTimer = new GameTimer("FunctionCache", 1024, 0, onUpdateAllFunctions);
			ret.start();
			_preTime = getTimer() >> 10;
			_curTime = _preTime;
		}
		
		private static var _arrFunctionCache:Vector.<FunctionCache> = new Vector.<FunctionCache>();

		private static function onUpdateAllFunctions() : void
		{
			_curTime = (getTimer() >> 10);
			var len:uint = _arrFunctionCache.length;
			for (var idx:uint=0; idx<len; idx++)
			{
				_arrFunctionCache[idx].onUpdateFunctions();
			}
			_preTime = _curTime;
		}
		
		/**-----------------------------------------------------------------------------------------------------------------------------------------*/
		private var _dicCalcBuf:HashMap = new HashMap();
		private var _disposeTimeList:HashMap = new HashMap();
		private var _function:Function = null;
		private var _delay:uint = 0;
		private var _fnDispose:Function = null;
		
		private var _policy:uint;
		
		/**
		 * 创建一个函数缓存池 
		 * @param name 函数缓存池名字
		 * @param fun 被缓存的函数
		 * @param delay 释放延时
		 * @param fnDispose 释放时调用的回调函数
		 * @param policy 释放策略
		 * @author 康露 2014年9月19日
		 */
		public function FunctionCache(name:String, fun:Function, delay:uint, fnDispose:Function=null, policy:uint=FunctionCache.POLICY_FIRST_READ)
		{
			_function = fun;
			_delay = delay;
			_fnDispose = fnDispose;
			_policy = policy;

			_arrFunctionCache.push(this);
		}
		
		private function onUpdateFunctions() : void
		{// 每秒扫描一次，把过时的计算结果清除掉
			for (var time:int=_preTime; time<_curTime; time++)
			{
				var items:HashMap = _disposeTimeList.getValue(time);
				if (null == items)
					continue;
				items.forEach(function(key:*,item:CacheItem):void
					{
						if (_fnDispose != null)
						{
							_fnDispose(item.retValue);
						}
						_dicCalcBuf.remove(item.param);
//						_cacheItemPool.disposeObj(item);
					});
				_disposeTimeList.remove(time);
			}
		}
		
		private function addDisposeItem(item:CacheItem) : void
		{
			var items:HashMap = _disposeTimeList.getValue(item.disposeTime);
			if (null == items)
			{
				items = new HashMap();
				_disposeTimeList.add(item.disposeTime, items);
			}
			items.add(item.param, item);
		}
		
		public function removeDisposeItem(item:CacheItem) : void
		{
			var items:HashMap = _disposeTimeList.getValue(item.disposeTime);
			if (null == items)
			{
				return;
			}
			items.remove(item.param);
			if (0 == items.length)
			{
				_disposeTimeList.remove(item.disposeTime);
			}
		}
		
		/**
		 * 对于一些需要大量计算的函数，本函数提供计算结果缓存，在delay时间内，如果再次调用这个函数，那么会返回相同的结果
		 * @param fun 计算函数
		 * @param param 函数参数
		 * @param delay 计算结果保留时间，以毫秒为单位，实际上只会精确到1024毫秒。。。
		 * @param caller 引用者标记
		 * @return 返回计算结果
		 * 
		 */
		public function call(param:*) : *
		{
			var disposeTime:int;
			var item:CacheItem = _dicCalcBuf.getValue(param);
			if (null!=item)// && CacheItem.nilValue!=item.retValue)
			{
				switch (_policy)
				{
					case POLICY_LAST_READ:
					{
						var time:int = (getTimer() + _delay) >> 10;
						if (item.disposeTime != time)
						{
							removeDisposeItem(item);
							item.disposeTime = time;
							addDisposeItem(item);
						}
						break;
					}
					case POLICY_LAST_REMOVE:
					{
						removeDisposeItem(item);
						break;
					}
				}
				return item.retValue;
			}
			
			item = new CacheItem();//_cacheItemPool.createObj(CacheItem) as CacheItem;
			_dicCalcBuf.add(param, item);
			
			item.param = param;
			item.retValue = _function(param);
			if (_policy != POLICY_LAST_REMOVE)
			{
				item.disposeTime = (getTimer() + _delay) >> 10;
				addDisposeItem(item);
			} else
			{
				item.addRef();
			}

			return item.retValue;
		}
		
		/**
		 * 手动删除一个缓存 
		 * @param param 缓存的参数
		 * @param caller 缓存的引用者标记
		 * @author 康露 2014年9月20日
		 */
		public function remove(param:*) : void
		{
			var item:CacheItem = _dicCalcBuf.getValue(param);
			if (null == item)
				return;

			item.disposeTime = (getTimer() + _delay) >> 10;
			if (_policy == POLICY_LAST_REMOVE)
			{
				item.delRef();
				if (item.refCount == 0)
				{
					addDisposeItem(item);
				}
			}
		}
	}
}



class CacheItem// implements IPoolClass
{
	public function CacheItem()
	{
		reSet(null);
	}
	
	public function dispose():void
	{
		param = null;
		disposeTime = 0x7fffffff;
		retValue = null;
//		_caller = null;
	}
	
	public function reSet($parameters:Array):void
	{
		param = null;
		disposeTime = 0x7fffffff;
		retValue = null;
//		_caller = null;
	}
	
	public function addRef() : void
	{
		_ref ++;
	}
	
	public function delRef() : void
	{
		_ref--;
	}
	
	public function get refCount() : int
	{
		return _ref;
	}
	
//	public function get caller() : HashSet
//	{
//		if (null == _caller)
//			_caller = new HashSet();
//		return _caller;
//	}
	
	public var param:*;
	public var disposeTime:int;
	public var retValue:*;
//	private var _caller:HashSet;
	private var _ref:int = 0;
}
