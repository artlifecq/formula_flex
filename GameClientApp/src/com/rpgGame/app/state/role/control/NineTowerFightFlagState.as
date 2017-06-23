package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *9层妖塔 采集旗帜头上buff 
	 * @author Administrator
	 * 
	 */	
	public class NineTowerFightFlagState extends BuffState
	{
		public function NineTowerFightFlagState()
		{
			super(RoleStateType.CONTROL_TOWER_FLAG);
		}
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					var role:SceneRole = (_machine.owner as SceneRole);
					if (role) 
					{
						HeadFace(role.headFace).updateTowerFlag(true);
					}
				}
			}
		}
		override public function leave():void
		{
			super.leave();
			if (_stateReference)
			{
				var role:SceneRole = (_machine.owner as SceneRole);
				if (role) 
				{
					HeadFace(role.headFace).updateTowerFlag(false);
				}
			}
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(NineTowerFightFlagState);
		}
	}
}