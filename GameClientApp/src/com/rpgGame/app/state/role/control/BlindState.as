package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 * 致盲
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-31 下午3:41:19
	 */
	
	public class BlindState extends BuffState
	{
		public function BlindState()
		{
			super(RoleStateType.CONTROL_BLIND);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is BlindStateReference)
					{
						var role:SceneRole = (_machine.owner as SceneRole);
						if(role && role.isMainCamouflage)
						{
//							RacingManager.setBlind(true);
						}
					}
					else
					{
						throw new Error("场景角色致盲状态引用必须是BlindStateReference类型！");
					}
				}
			}
		}
		
		override public function leave() : void
		{
			var role:SceneRole = (_machine.owner as SceneRole);
			if(role && role.isMainCamouflage)
			{
//				RacingManager.setBlind(false);
			}
			super.leave();
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(BlindState);
		}
		
	}
}