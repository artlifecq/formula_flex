package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.ui.main.fight.FightStateView;
	import com.rpgGame.coreData.type.RoleStateType;

	public class FightLeaveEnterBuffState extends BuffState
	{
		public function FightLeaveEnterBuffState()
		{
			super(RoleStateType.CONTROL_ENTER_LEAVE_FIGHT);
		}
		override public function afterExecute():void
		{
			super.afterExecute();
			FightStateView.show(true);
		}
		override public function afterLeave():void
		{
			super.afterLeave();
			FightStateView.show(false);
		}
	}
}