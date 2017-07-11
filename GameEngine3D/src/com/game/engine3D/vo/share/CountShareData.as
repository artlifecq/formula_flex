package com.game.engine3D.vo.share
{
	import away3d.utils.GCObject;


	/**
	 * 共享数据对象
	 * */
	public class CountShareData extends GCObject
	{
		/**引用数量*/
		private var _count : int = 0; //这个最开始给0

		public var destroyTm : int = 0;

//		private var _countSet:HashSet;

		public function CountShareData()
		{
//			if(!_countSet)
//			{
//				_countSet = new HashSet();
//			}
		}

		public function addCount(obj : *) : void
		{
//			_countSet.add(obj);
			_count++;
			//
//			if(_count != _countSet.length)
//			{
//				throw new Error("222222222222222222222222");
//			}
		}

		public function removeCount(obj : *) : void
		{
//			_countSet.remove(obj);
			_count--;
			//
//			if(_count != _countSet.length)
//			{
//				throw new Error("222222222222222222222222");
//			}
		}

		public function get count() : int
		{
//			trace("count : "+_count,"countSet : "+_countSet.length);
//			return _countSet.length;
			return _count;
		}

		/**释放(外部需要复写此方法,对该对象执行销毁)*/
		public function destroy() : void
		{
//			if(_countSet)
//			{
//				_countSet.clear();
//				_countSet = null;
//			}
		}
	}
}
