package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 * 场景角色残影状态
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-30 下午5:01:33
	 */
	
	public class ShadowState extends BuffState
	{
		public function ShadowState()
		{
			super(RoleStateType.CONTROL_SHADOW);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is ShadowStateReference)
					{
						setOnOff(true);
					}
					else
					{
						throw new Error("场景角色残影状态引用必须是ShadowStateReference类型！");
					}
				}
			}
		}
		
		private function setOnOff(flag:Boolean):void
		{
			(_machine.owner as SceneRole).avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.entityPhantom = flag;
						break;
				}
			});
		}
		
		override public function leave() : void
		{
			setOnOff(false);
			super.leave();
		}
	}
}