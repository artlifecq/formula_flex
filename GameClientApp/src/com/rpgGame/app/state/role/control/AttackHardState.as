package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色攻击硬直状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-28 上午11:25:12
	 *
	 */
	public class AttackHardState extends ControlState
	{
		public function AttackHardState()
		{
			super(RoleStateType.CONTROL_ATTACK_HARD);
		}

		override public function execute() : void
		{
			super.execute();
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killDelayedCallsTo(onStopHardStraight);
				if (_ref)
				{
					if (_ref is AttackHardStateReference)
					{
						if ((_ref as AttackHardStateReference).hardTime > 0)
							TweenLite.delayedCall((_ref as AttackHardStateReference).hardTime * 0.001, onStopHardStraight);
						else
							removeSelf();
					}
					else
						throw new Error("攻击硬直状态引用必须是AttackHardStateReference类型！");
				}
			}
		}

		private function onStopHardStraight() : void
		{
			removeSelf();
		}

		override public function leave() : void
		{
			super.leave();
			TweenLite.killDelayedCallsTo(onStopHardStraight);
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isDead)
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)
			{
				return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			TweenLite.killDelayedCallsTo(onStopHardStraight);
			super.dispose();
		}
	}
}
