package com.rpgGame.app.scene
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.graphics.BaseHeadFace;
	import com.rpgGame.app.graphics.BubbleDialogFace;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.cfg.EvilConfig;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import starling.display.Sprite;
	
	
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
		private var _buffSet : BuffSet;
		private var _headFace : BaseHeadFace;
		private var _dialogFace : BubbleDialogFace;
		protected var _fightChange : Boolean = false;
		public var mapAreaTypes : Array = [];
		public var isWheel : Boolean = false;
		public var isSwimming:Boolean = false;
		
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
			mapAreaTypes.length = 0;
			isWheel = false;
			
			
		}
		
		public function get headFace() : BaseHeadFace
		{
			return _headFace;
		}
		
		public function set headFace(value : BaseHeadFace) : void
		{
			_headFace = value;
		}
		
		public function get dialogFace() : BubbleDialogFace
		{
			return _dialogFace;
		}
		
		public function set dialogFace(value : BubbleDialogFace) : void
		{
			_dialogFace = value;
		}
		
		
		public function get boneNameContainer() : Sprite
		{
			if (_headFace == null)
				return null;
			
			return _headFace;
		}
		
		/**销毁对象 */
		override public function destroy() : void
		{
			recycle(this);
		}
		
		override protected function addToGraphic() : void
		{
			super.addToGraphic();
			if (_headFace)
				_headFace.show();
			if (_dialogFace)
				_dialogFace.show();
		}
		
		override protected function removeFromGraphic() : void
		{
			super.removeFromGraphic();
			if (_headFace)
				_headFace.hide();
			if (_dialogFace)
				_dialogFace.hide();
		}
		
		override public function setAttachVisible(attachType : String, visible : Boolean) : void
		{
			super.setAttachVisible(attachType, visible);
			if (_headFace)
				_headFace.displayVisible(attachType, visible);
		}
		
		override protected function onAddCamouflageEntity() : void
		{
			super.onAddCamouflageEntity();
			if (_headFace)
				_headFace.isCamouflage = true;
			
			//设置成伪装者的时候需要隐藏血纹场景模型
			setFightSoulRoleVisible(false);
		}
		
		override protected function onRemoveCamouflageEntity() : void
		{
			super.onRemoveCamouflageEntity();
			if (_headFace)
				_headFace.isCamouflage = false;
			setFightSoulRoleVisible(true);
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
			if (_headFace)
			{
				_headFace.recycleSelf();
				_headFace = null;
			}
			if (_dialogFace)
			{
				_dialogFace.recycleSelf();
				_dialogFace = null;
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
		
		private function setFightSoulRoleVisible(flag : Boolean) : void
		{
			if (this.data is HeroData && (this.data as HeroData).fightSoulLevel > 0)
			{
				var role : SceneRole = SceneManager.getScene().getSceneObjByID(this.id, SceneCharType.FIGHT_SOUL) as SceneRole;
				if (role)
				{
					role.visible = flag;
				}
			}
		}
	}
}
