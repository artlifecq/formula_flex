package game.rpgGame.login.scene
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.vo.BaseRole;
	
	import game.rpgGame.login.data.EvilConfig;
	import game.rpgGame.login.state.RoleStateMachine;
	
	
	/**
	 *
	 * 场景角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class SceneRole extends BaseRole
	{
		/** 半径 **/
		protected var _radius : int = EvilConfig.ELE_DEFAULT_RADIUS;
		//---------------------------对象池---------------------------
		private static var _pool : InstancePool = new InstancePool("SceneRole", 600);
		
		private static var _cnt : int = 0;
		
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
		
		private var _stateMachine : RoleStateMachine;
		protected var _fightChange : Boolean = false;
		public var mapAreaTypes : Array = [];
		public var isWheel : Boolean = false;
		
		public function SceneRole(type : String, id : Number)
		{
			super(type, id);
		}
		
		public function get stateMachine() : RoleStateMachine
		{
			return _stateMachine;
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_stateMachine = RoleStateMachine.create(this);
			mapAreaTypes.length = 0;
			isWheel = false;
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
			mapAreaTypes.length = 0;
			isWheel = false;
			super.dispose();
		}
		
		public function get fightChange() : Boolean
		{
			return _fightChange;
		}
		
		public function set fightChange(value : Boolean) : void
		{
			_fightChange = value;
		}
	}
}
