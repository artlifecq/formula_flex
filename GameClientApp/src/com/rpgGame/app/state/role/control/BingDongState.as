package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色冰冻状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-24 下午5:25:12
	 *
	 */
	public class BingDongState extends BuffState
	{
		public function BingDongState()
		{
			super(RoleStateType.CONTROL_BING_DONG);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_stateReference)
				{
					if (_stateReference is BingDongStateReference)
					{
						var role : SceneRole = _machine.owner as SceneRole;
						role.forEachRenderUnit(eachSetBingDongTexture);
						(_machine as RoleStateMachine).actionPause();
					}
					else
						throw new Error("场景角色冰冻状态引用必须是BingDongStateReference类型！");
				}
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(BingDongState);
		}
		
		
		private function eachSetBingDongTexture(role : BaseRole, render : RenderUnit3D) : void
		{
			render.setIndependentTexture(ClientConfig.getDynTexture("bingdongbuff"),0);
		}

		private function eachRestoreTexture(role : BaseRole, render : RenderUnit3D) : void
		{
			render.restoreTexture();
		}

		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isInPool)
			{
				(_machine as RoleStateMachine).actionResume();
				var role : SceneRole = _machine.owner as SceneRole;
				role.forEachRenderUnit(eachRestoreTexture);
			}
		}
	}
}
