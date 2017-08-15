package com.rpgGame.app.display3D
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;

	/**
	 *用行UI层上显示的角色3D模型
	 * @author wewell
	 */
	public class InterAvatar3D extends InterObject3D
	{
		private var role : SceneRole;

		public function InterAvatar3D()
		{
			super();
		}

		public function setRoleData(data : RoleData) : void
		{
			if (this.role == null)
			{
				this.role = SceneRole.create(SceneCharType.DUMMY, data.id);
				role.rotationX = -GlobalConfig.mapCameraAngle;
			}
			this.role.data = data;
			
			//Render3DTextUtil.addHeadFlowerTextToTarget(role);
			role.avatar.shareMaterials = false;
			role.avatar.lightPicker = Stage3DLayerManager.screenLightPicker;
			//执行主换装更新
			AvatarManager.updateAllPart(role);

			transition(RoleStateType.ACTION_IDLE); //切换到“站立状态”

			setRenderUnit(role);
		}

		public function transition(actionType : int) : void
		{
			if (role != null)
				role.stateMachine.transition(actionType); //切换到“站立状态”
		}

		override public function set visible(value : Boolean) : void
		{
			super.visible = value;
			role.visible = value;
		}

		public function get curRoleData() : RoleData
		{
			return role ? this.role.data as RoleData : null;
		}

		public function get curRole() : SceneRole
		{
			return role;
		}

		override public function dispose() : void
		{
			if (role)
			{
				SceneRole.recycle(role);
				role = null;
			}
			super.dispose();
		}
	}
}
