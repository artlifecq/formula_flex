package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.ctrl.ControlTripleSkill;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;

	public class CheckTripleAttackState extends ControlState
	{
		public function CheckTripleAttackState()
		{
			super(RoleStateType.CONTROL_TRIPLE_ATTACK_CHECK);
		}
		override public function execute():void
		{
			super.execute();
			if (_machine && !_machine.isInPool)
			{
				if (_ref) 
				{
					var skill:int=CheckTripleAttackStateReference(_ref).startSkill;
					var ctrl:ControlTripleSkill=TrusteeshipManager.getInstance().tripleSkillCtrl;
					//放完了
					if (ctrl.isLastTripleSkill(skill))
					{
						transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
					}
					else
					{
						var nextSkill:int=ctrl.getNextTripleSkill(skill);
						CastSpellHelper.shortcutsTryCaseSpell(nextSkill);
					}
				}
				removeSelf();
			}
		}
		
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			if (!(_machine as RoleStateMachine).isWalkMoving)
			{
				return true;
			}
			return false;
		}
		
		override public function leavePass(nextState:IState, force:Boolean=false):Boolean
		{
			// TODO Auto Generated method stub
			return super.leavePass(nextState, force);
		}
		
	}
}