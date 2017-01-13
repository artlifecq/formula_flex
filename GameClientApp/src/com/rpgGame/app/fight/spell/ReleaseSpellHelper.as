package com.rpgGame.app.fight.spell
{
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.AttackStateReference;
	import com.rpgGame.app.state.role.control.AttackHardStateReference;
	import com.rpgGame.coreData.type.RoleStateType;

	import flash.geom.Point;

	import gs.TweenLite;

	/**
	 *
	 * 释放技能助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class ReleaseSpellHelper
	{
		public function ReleaseSpellHelper()
		{
		}

		public static function releaseSpell(spellInfo : ReleaseSpellInfo) : void
		{
			/** 施法者 **/
			var ref : AttackStateReference = null;
			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				var motion : String = spellInfo.atkMotion;
				spellInfo.motionFinish = !motion;
				ref = spellInfo.atkor.stateMachine.getReference(AttackStateReference) as AttackStateReference;
				ref.setParams(spellInfo, motion, 1, spellInfo.soarFrameTime);
			}
			var blinked : Boolean = spellInfo.blinkType > 0;
			if (blinked)
			{
				if (ref)
				{
					doBlink(ref);
				}
				else
				{
					SpellHitHelper.fightSpellHitEffect(spellInfo);
				}
			}
			else
			{
				if (ref)
				{
					ref.onAfterExecute(onAttackExecute);
					ref.onHitFrame(onAttackHitFrame);
					spellInfo.atkor.stateMachine.transition(RoleStateType.ACTION_ATTACK, ref, true);
				}
				else
				{
					var targetPos : Point = (spellInfo.targetRole && spellInfo.targetRole.usable) ? new Point(spellInfo.targetRole.x, spellInfo.targetRole.z) : spellInfo.targetPos;
					var atkorPos : Point = (spellInfo.atkor && spellInfo.atkor.usable) ? new Point(spellInfo.atkor.x, spellInfo.atkor.z) : spellInfo.atkorPos;
					var angle : int = MathUtil.getAngle(targetPos.x, targetPos.y, atkorPos.x, atkorPos.y);
					SpellAnimationHelper.addDestEffect(targetPos.x, targetPos.y, angle, spellInfo);
				}
				if (spellInfo.passAni)
				{
					SpellAnimationHelper.addFlyEffect(spellInfo);
				}
				else
				{
					if (ref)
					{
						var hurtDelay : int = ref.hitFrameTime;
						if (spellInfo.hurtDelay > hurtDelay)
							hurtDelay = spellInfo.hurtDelay;
						if (hurtDelay > 0)
							TweenLite.delayedCall(hurtDelay * 0.001, SpellHitHelper.fightSpellHitEffect, [ref.spellInfo]);
						else
							SpellHitHelper.fightSpellHitEffect(ref.spellInfo);
					}
					else
					{
						SpellHitHelper.fightSpellHitEffect(spellInfo);
					}
				}
			}

			if (spellInfo.atkor && spellInfo.atkor.usable && spellInfo.atkor.isMainChar)
			{
				var hardRef : AttackHardStateReference = spellInfo.atkor.stateMachine.getReference(AttackHardStateReference) as AttackHardStateReference;
				hardRef.setParams(spellInfo.castTime);
				spellInfo.atkor.stateMachine.transition(RoleStateType.CONTROL_ATTACK_HARD, hardRef, true);
			}
		}

		/**
		 * 刀光特效 
		 * @param ref
		 * 
		 */		
		private static function onAttackExecute(ref : AttackStateReference) : void
		{
			SpellAnimationHelper.addKnifeLightEffect(ref.spellInfo);
			onSelfEffectFrame(ref);
		}
		
		/**
		 * 自身施法特效 
		 * @param ref
		 * 
		 */		
		private static function onSelfEffectFrame(ref : AttackStateReference):void
		{
			SpellAnimationHelper.addSelfEffect(ref.spellInfo);
		}

		/**
		 * 释放地面特效 
		 * @param ref
		 * 
		 */		
		private static function onAttackHitFrame(ref : AttackStateReference) : void
		{
			SpellAnimationHelper.addDestEffect(ref.targetRolePos.x, ref.targetRolePos.y, ref.angle, ref.spellInfo);
		}

		/**
		 * 为位移技能类，提供的接口 
		 * @param attackStateRef
		 * @return 
		 * 
		 */		
		private static function doBlink(attackStateRef : AttackStateReference) : Boolean
		{
			var spellInfo : ReleaseSpellInfo = attackStateRef.spellInfo;
			/** 施法者 **/
			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				if (spellInfo.blinkType > 0)
				{
					RoleStateUtil.blinkToPos(spellInfo.atkor, attackStateRef.statusType, spellInfo.atkorPos, spellInfo.targetPos, spellInfo.blinkSpeed, spellInfo.blinkHeight, 
						spellInfo.soarFrameTime, spellInfo.hitFrameTime, spellInfo.breakFrameTime, spellInfo);
					return true;
				}
			}
			return false;
		}
	}
}
