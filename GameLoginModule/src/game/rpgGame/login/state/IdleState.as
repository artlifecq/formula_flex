package game.rpgGame.login.state
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.role.BaseActionState;
	import com.game.engine3D.vo.BaseRole;
	
	import game.rpgGame.login.scene.RenderUnitType;
	import game.rpgGame.login.scene.RoleActionType;
	
	/**
	 *
	 * 场景角色闲置状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 下午5:25:12
	 *
	 */
	public class IdleState extends BaseActionState
	{
		public function IdleState()
		{
			super(RoleStateType.ACTION_IDLE);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			}
		}
		
		
		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);
			
			var statusType : String = RoleActionType.getActionType(RoleActionType.IDLE, false);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(statusType,  null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE,null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, null, time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}
		
		override public function pause() : void
		{
			super.pause();
			syncAnimation(true);
		}
		
		override public function resume() : void
		{
			super.resume();
			syncAnimation(false);
		}
		
		override public function afterEnter() : void
		{
			super.afterEnter();
			syncAnimation(false, 0);
		}
		
	}
}
