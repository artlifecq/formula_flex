package game.rpgGame.login.display3D
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import away3d.containers.View3D;
	
	import game.rpgGame.login.data.RoleData;
	import game.rpgGame.login.scene.AvatarManager;
	import game.rpgGame.login.scene.SceneRole;
	import game.rpgGame.login.state.RoleStateType;
	
	public class InterAvatar3D extends InterObject3D
	{
		private var _role : SceneRole;
		
		public function InterAvatar3D(view3D:View3D=null)
		{
			super(view3D);
		}
		
		public function get role():SceneRole
		{
			return _role;
		}

		public function setRoleData(data : RoleData) : void
		{
			if (this._role == null)
			{
				this._role = SceneRole.create("0",data.id);
				_role.rotationX = GlobalConfig.mapCameraAngle + 20;
			}
			this._role.data = data;
			
			_role.avatar.shareMaterials = false;
			_role.avatar.lightPicker = Stage3DLayerManager.screenLightPicker;
			//执行主换装更新
			AvatarManager.updateAvatar(_role);
			
			transition(RoleStateType.ACTION_IDLE); //切换到“站立状态”
			
			setRenderUnit(_role);
		}
		
		public function transition(actionType : int) : void
		{
			if (role != null)
				role.stateMachine.transition(actionType); //切换到“站立状态”
		}
		
		override public function set visible(value : Boolean) : void
		{
			super.visible = value;
			_role.visible = value;
		}
	}
}