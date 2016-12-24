package com.editor.scene
{
	import com.editor.cfg.ConfigData;
	import com.editor.state.role.RoleStateMachine;
	import com.game.engine3D.vo.BaseRole;
	import com.game.mainCore.libCore.pool.Pool;

	/**
	 *
	 * 场景角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class SceneRole extends BaseRole
	{
		//---------------------------对象池---------------------------
		private static var _pool : Pool = new Pool("SceneRole", 600);

		private static var _cnt : int = 0;

		private var _stateMachine : RoleStateMachine;
		private var _buffSet : BuffSet;
		public var cfg : ConfigData;

		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(type : String, id : Number) : SceneRole
		{
			_cnt++;
			return _pool.createObj(SceneRole, type, id) as SceneRole;
		}

		public static function recycle(role : SceneRole) : void
		{
			if (!role)
				return;
			_cnt--;
			_pool.disposeObj(role);
		}

		public static function get cnt() : int
		{
			return _cnt;
		}

		public function SceneRole(type : String, id : Number)
		{
			super(type, id);
		}

		public function get stateMachine() : RoleStateMachine
		{
			return _stateMachine;
		}

		public function get buffSet() : BuffSet
		{
			return _buffSet;
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_stateMachine = RoleStateMachine.create(this);
			_buffSet = BuffSet.create(this);
		}

		/**销毁对象 */
		override public function destroy() : void
		{
			recycle(this);
		}

		override public function dispose() : void
		{
			if (_stateMachine)
			{
				RoleStateMachine.recycle(_stateMachine);
				_stateMachine = null;
			}
			if (_buffSet)
			{
				BuffSet.recycle(_buffSet);
				_buffSet = null;
			}
			cfg = null;
			super.dispose();
		}
	}
}
