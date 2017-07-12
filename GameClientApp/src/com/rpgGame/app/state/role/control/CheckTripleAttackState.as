package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
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
			if (_ref) 
			{
				var skill:int=CheckTripleAttackStateReference(_ref).skill;
				var ref:TripleAttackSpellLockStateReference=_machine.getReference(TripleAttackSpellLockStateReference) as TripleAttackSpellLockStateReference;
				//放完了
				if (ref.isLast(skill))
				{
					_machine.removeState(RoleStateType.CONTROL_TRIPLE_ATTACK_LOCK);
					transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
				}
				else
				{
					var nextSkill:int=ref.getNextSkill(skill);
					CastSpellHelper.shortcutsTryCaseSpell(nextSkill);
					if (ref.isLast(nextSkill)) 
					{
						_machine.removeState(RoleStateType.CONTROL_TRIPLE_ATTACK_LOCK);
					}
				}
			}
			removeSelf();
		}
	}
}