package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.fight.spell.CastSpellInfo;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import app.message.SpellProto;

	/**
	 *
	 * 攻击对象
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 下午4:25:12
	 *
	 */
	public class AttackTarget extends AIState
	{
		public function AttackTarget()
		{
			super(AIStateType.ATTACK_TARGET);
		}

		override public function execute() : void
		{
			super.execute();
			releaseSpell();
		}

		private function findUseableSpell() : Q_skill_model
		{
			var castSpell : Q_skill_model = CastSpellHelper.getNextCastSpell();
			/*var nextSpell : SpellProto = TrusteeshipManager.getInstance().nextSpell;
			if (nextSpell && !SkillCDManager.getInstance().getSkillHasCDTime(nextSpell))
				castSpell = nextSpell;*/

			if (false) //旧的挂机模式，先留着。@L.L.M.Sunny 
			{
				if (!castSpell)
				{
					var randomSpells : Vector.<Q_skill_model> = TrusteeshipManager.getInstance().getActiveSpellList();

					if (false) //随机需求放开这里，@L.L.M.Sunny 
					{
						var tmpSpell : Q_skill_model = null;
						var randomId : int = 0;
						var spellLen : int = randomSpells.length;
						for (var i : int = 0; i < spellLen; i++)
						{
							tmpSpell = randomSpells[i];
							randomId = Math.floor(Math.random() * spellLen);
							randomSpells[i] = randomSpells[randomId];
							randomSpells[randomId] = tmpSpell;
						}
						randomSpells.sort(onSortSpell);
					}
					for each (var spellData : Q_skill_model in randomSpells)
					{
						if (!SkillCDManager.getInstance().getSkillHasCDTime(spellData))
						{
							castSpell = spellData;
							break;
						}
					}
				}

				if (!castSpell) //武器默认技能
				{
					var defaultSpell : Q_skill_model = CastSpellHelper.getDefaultSpell();
					if (defaultSpell)
					{
						if (!SkillCDManager.getInstance().getSkillHasCDTime(defaultSpell))
						{
							castSpell = defaultSpell;
						}
						else
						{
							var relateSpells : Vector.<Q_skill_model> = SpellDataManager.getRelateSpells(defaultSpell.q_relate_spells);
//							var relateSpells : Array = defaultSpell.q_relate_spells.split(",");
							for each (var tmpData : Q_skill_model in relateSpells)
							{
								if (!SkillCDManager.getInstance().getSkillHasCDTime(tmpData))
								{
									castSpell = defaultSpell;
									break;
								}
							}
						}
					}
				}
			}
			return castSpell;
		}

		private function releaseSpell() : void
		{
			var spellData : Q_skill_model = findUseableSpell();
			if (spellData)
			{
				var roleList : Vector.<SceneRole> = TrusteeshipManager.getInstance().getRoleList();
				CastSpellHelper.tryCaseSpell(new CastSpellInfo(spellData), roleList, true);
			}
			transition(AIStateType.AI_NONE);
		}

		private function onSortSpell(spellA : SpellProto, spellB : SpellProto) : int
		{
			if (spellA.spellType > spellA.spellType)
				return 1;
			else
				return -1;
			return 0;
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			return false;
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				if (!force)
					return false;
			}
			if (MainRoleManager.actor.stateMachine.isJumpRising)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBlinkMoving)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBeatMoving)
			{
				return false;
			}
			if (!MainRoleManager.actor.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isAttackHarding)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isLockCaseSpell)
			{
				return false;
			}
			return true;
		}
	}
}
