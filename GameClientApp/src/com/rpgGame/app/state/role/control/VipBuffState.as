package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RoleStateType;

	public class VipBuffState extends BuffState
	{
		private static const BUFF2VIP:Object={};
		
		public function VipBuffState()
		{
			super(RoleStateType.CONTROL_VIP);
		}
		override public function execute():void
		{
			super.execute();
			if (_stateReference)
			{
				var role:SceneRole = (_machine.owner as SceneRole);
				var ref:VipBuffStateReference=_ref as VipBuffStateReference;
				if (role&&ref) 
				{
					var viplv:int=BUFF2VIP[ref.buffData._data.q_buff_id];
					HeadFace(role.headFace).setVipFlag(viplv);
				}
			}
		}
		override public function afterLeave():void
		{
			super.afterLeave();
			var role:SceneRole = (_machine.owner as SceneRole);
			if (role) 
			{
				HeadFace(role.headFace).setVipFlag(0);
			}
		}
	}
}