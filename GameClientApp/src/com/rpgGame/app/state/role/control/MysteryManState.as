package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *神秘人buff 
	 * @author yfl
	 * 
	 */	
	public class MysteryManState extends BuffState
	{
		public function MysteryManState()
		{
			super(RoleStateType.CONTROL_MASTERY_MAN);
		}
		override public function beforeEnter():void
		{
			super.beforeEnter();
		}
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					var role:SceneRole = (_machine.owner as SceneRole);
					if (role&&role!=MainRoleManager.actor) 
					{
						HeadFace(role.headFace).updateMysteryMan();
					}
				}
			}
		}
		override public function afterLeave():void
		{
			super.afterLeave();
			if (_stateReference)
			{
				var role:SceneRole = (_machine.owner as SceneRole);
				if (role&&role!=MainRoleManager.actor) 
				{
					HeadFace(role.headFace).updateMysteryMan();
				}
			}
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(MysteryManState);
		}
	}
}