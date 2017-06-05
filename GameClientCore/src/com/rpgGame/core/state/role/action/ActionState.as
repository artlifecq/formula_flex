package com.rpgGame.core.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.role.BaseActionState;
	import com.game.engine3D.vo.BaseRole;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 *
	 * 场景角色动作状态基类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class ActionState extends BaseActionState
	{
		protected var _useCrossfadeTransition : Boolean;

		public function ActionState(type : uint)
		{
			super(type);
			_useCrossfadeTransition = false;
		}

		override public function beforeEnter() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.beforeEnter();
				var state : IState = _machine.getLastState(ActionState);
				_useCrossfadeTransition = state && (state.type != RoleStateType.ACTION_ATTACK);
				if (this.type == RoleStateType.ACTION_IDLE ||
					this.type == RoleStateType.ACTION_WALK ||
					this.type == RoleStateType.ACTION_RUN ||
					this.type == RoleStateType.ACTION_HIT ||
					this.type == RoleStateType.ACTION_PREWAR ||
					this.type == RoleStateType.ACTION_BEAT_BACK ||
					this.type == RoleStateType.ACTION_COLLECT ||
					this.type == RoleStateType.ACTION_PLAY_ACTION ||
					this.type == RoleStateType.ACTION_ATTACK_UI ||
					this.type == RoleStateType.ACTION_TRAIL) {
				} else {
					var role : BaseRole = _machine.owner as BaseRole;
					GameLog.add("[ActionState] roleName:" + role.name + " changeBaseVirtualParent(true) state:" + this.type);
					role.avatar.forEachRenderUnit(function (unit : RenderUnit3D) : void {
						unit.changeBaseVirtualParent(true);
					});
				}
			}
		}
		
		override public function afterLeave() : void {
			if (_machine && !_machine.isDisposed) {
				super.afterLeave();
				if (this.type == RoleStateType.ACTION_IDLE ||
					this.type == RoleStateType.ACTION_WALK ||
					this.type == RoleStateType.ACTION_RUN ||
					this.type == RoleStateType.ACTION_HIT ||
					this.type == RoleStateType.ACTION_PREWAR ||
					this.type == RoleStateType.ACTION_BEAT_BACK ||
					this.type == RoleStateType.ACTION_COLLECT ||
					this.type == RoleStateType.ACTION_PLAY_ACTION ||
					this.type == RoleStateType.ACTION_TRAIL||
					this.type == RoleStateType.ACTION_ATTACK_UI) {
				} else {
					var role : BaseRole = _machine.owner as BaseRole;
					GameLog.add("[ActionState] roleName:" + role.name + " changeBaseVirtualParent(false) state:" + this.type);
					role.avatar.forEachRenderUnit(function (unit : RenderUnit3D) : void {
						unit.changeBaseVirtualParent(false);
					});
				}
			}
		}

		override public function get tribe() : String
		{
			return getQualifiedClassName(ActionState);
		}

		override public function dispose() : void
		{
			_useCrossfadeTransition = false;
			super.dispose();
		}
	}
}
