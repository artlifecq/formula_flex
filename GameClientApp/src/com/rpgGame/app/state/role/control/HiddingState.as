package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 * 隐身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class HiddingState extends BuffState
	{
		public function HiddingState(type:uint)
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
						(_machine as RoleStateMachine).actionPause();
					}
					else
						throw new Error("场景隐身状态引用必须是HiddingStateReference类型！");
				}
			}
		}
		
		private function eachVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			render.visible = true;
		}
		
		private function eachUnVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			render.visible = false;
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
				(_machine as RoleStateMachine).actionResume();
				var role : SceneRole = _machine.owner as SceneRole;
				role.forEachRenderUnit(eachVisible);
			}
		}
	}
}