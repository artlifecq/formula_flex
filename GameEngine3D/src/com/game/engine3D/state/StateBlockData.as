package com.game.engine3D.state
{

	/**
	 *
	 * 状态阻塞数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class StateBlockData
	{
		private var _type : int;
		private var _ref : StateReference;
		private var _force : Boolean;

		public function StateBlockData(type : int, ref : StateReference, force : Boolean = false)
		{
			_type = type;
			_ref = ref;
			_force = force;
		}

		public function get type() : int
		{
			return _type;
		}

		public function get ref() : StateReference
		{
			return _ref;
		}

		public function get force() : Boolean
		{
			return _force;
		}

		public function dispose() : void
		{
			_type = 0;
			_force = false;
			if (_ref)
			{
				_ref.dispose();
				_ref = null;
			}
		}
	}
}
