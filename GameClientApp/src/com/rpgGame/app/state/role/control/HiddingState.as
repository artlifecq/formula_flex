package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 * 隐身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class HiddingState extends BuffState
	{
		public function HiddingState()
		{
			super(RoleStateType.CONTROL_HIDDING);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_stateReference)
				{
					if (_stateReference is HiddingStateReference)
					{
						var role : SceneRole = _machine.owner as SceneRole;
						role.forEachRenderUnit(eachUnVisible);
					}
					else
						throw new Error("场景隐身状态引用必须是HiddingStateReference类型！");
				}
			}
		}
		
		private function eachVisible(role : BaseRole, render : RenderUnit3D) : void
		{
//			render.visible = true;
			render.alpha = 1;
		}
		
		private function eachUnVisible(role : BaseRole, render : RenderUnit3D) : void
		{
//			render.visible = false;
			render.alpha = 0;
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
				role.forEachRenderUnit(eachVisible);
			}
		}
	}
}