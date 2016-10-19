package com.game.engine3D.vo
{

	/**
	 *
	 * 引用集合
	 * @author L.L.M.Sunny
	 * 创建时间：2016-1-14 上午10:15:16
	 *
	 */
	public class ReferenceSet
	{
		private var _references : Array;

		public function ReferenceSet()
		{
			_references = [];
		}

		public function hasRef(ref : Object) : Boolean
		{
			var index : int = _references.indexOf(ref);
			if (index < 0)
			{
				return true;
			}
			return false;
		}

		public function addRef(ref : Object) : Boolean
		{
			var index : int = _references.indexOf(ref);
			if (index < 0)
			{
				_references.push(ref);
				return true;
			}
			return false;
		}

		public function removeRef(ref : Object) : Boolean
		{
			var index : int = _references.indexOf(ref);
			if (index > -1)
			{
				_references.splice(index, 1);
				return true;
			}
			return false;
		}

		public function get refCount() : int
		{
			return _references.length;
		}

		public function dispose() : void
		{
			if (_references)
			{
				_references.length = 0;
				_references = null;
			}
		}
	}
}
