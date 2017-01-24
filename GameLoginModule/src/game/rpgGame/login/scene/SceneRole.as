package game.rpgGame.login.scene
{
	import com.game.engine3D.vo.BaseRole;
	import com.game.mainCore.libCore.pool.Pool;
	
	import game.rpgGame.login.state.RoleStateMachine;
	
	/**
	 *
	 * 场景角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午11:12:28
	 *
	 */
	public class SceneRole extends BaseRole
	{
		private static var _pool : Pool = new Pool("LoginSceneRole", 10);
		private static var _cnt : int = 0;
		
		public function get stateMachine():RoleStateMachine
		{
			return _stateMachine;
		}

		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(type : String, id : Number) : SceneRole
		{
			_cnt++;
			return _pool.createObj(SceneRole, type,id) as SceneRole;
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
		
		private var _stateMachine : RoleStateMachine;
		
		public function SceneRole(type : Number,id : Number)
		{
			super(type, id);
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_stateMachine = RoleStateMachine.create(this);
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
			super.dispose();
		}
		
	}
}