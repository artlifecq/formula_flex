package com.editor.fight.spell
{
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.RoleStateType;
	import com.editor.manager.AvatarPreviewManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.editor.state.role.action.AttackStateReference;
	import com.editor.state.role.control.AttackHardStateReference;
	import com.game.engine3D.utils.MathUtil;

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
				var motion : String = TabelFieldHelper.getOnceMotion(spellInfo.spellData);
				var soarFrameTime : int = TabelFieldHelper.getSoarFrameTime(spellInfo.spellData.tabelName, spellInfo.spellData);
				ref = spellInfo.atkor.stateMachine.getReference(AttackStateReference) as AttackStateReference;
				ref.setParams(spellInfo, motion, AvatarPreviewManager.animationSpeed, soarFrameTime);
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
					SpellHitHelper.addSpellHitEffect(spellInfo, spellInfo.targetRole.stateMachine.isRiding);
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
					SpellAnimationHelper.addDestEffect(targetPos.x, targetPos.y, angle, spellInfo.targetRole.stateMachine.isRiding, spellInfo);
				}
				var mFlySpeed : int = TabelFieldHelper.getFlySpeed(spellInfo.spellData.tabelName, spellInfo.spellData);
				if (mFlySpeed > 0)
				{
					SpellAnimationHelper.addFlyEffect(spellInfo.atkor.stateMachine.isRiding, spellInfo);
				}
				else
				{
					if (ref)
					{
						var hurtDelay : int = Math.max(spellInfo.releaseDelayTime, ref.hitFrameTime, spellInfo.hurtDelayTime);
						if (hurtDelay > 0)
							TweenLite.delayedCall(hurtDelay * 0.001, SpellHitHelper.addSpellHitEffect, [spellInfo, spellInfo.targetRole.stateMachine.isRiding]);
						else
							SpellHitHelper.addSpellHitEffect(spellInfo, spellInfo.targetRole.stateMachine.isRiding);
					}
					else
					{
						SpellHitHelper.addSpellHitEffect(spellInfo, spellInfo.targetRole.stateMachine.isRiding);
					}
				}
			}

			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				var hardRef : AttackHardStateReference = spellInfo.atkor.stateMachine.getReference(AttackHardStateReference) as AttackHardStateReference;
				hardRef.setParams(spellInfo.castTime);
				spellInfo.atkor.stateMachine.transition(RoleStateType.CONTROL_ATTACK_HARD, hardRef, true);
			}
		}

		private static function onAttackExecute(ref : AttackStateReference) : void
		{
			SpellAnimationHelper.addKnifeLightEffect(ref.spellInfo);
			SpellAnimationHelper.addSelfEffect(ref.spellInfo);
		}

		private static function onAttackHitFrame(ref : AttackStateReference) : void
		{
			SpellAnimationHelper.addDestEffect(ref.targetPos.x, ref.targetPos.y, ref.rotationY, (ref.owner as SceneRole).stateMachine.isRiding, ref.spellInfo);
		}

		private static function doBlink(attackStateRef : AttackStateReference) : Boolean
		{
			var spellInfo : ReleaseSpellInfo = attackStateRef.spellInfo;
			/** 施法者 **/
			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				if (spellInfo.blinkType > 0)
				{
					var blinkSpeed : int = TabelFieldHelper.getBlinkSpeed(spellInfo.spellData.tabelName, spellInfo.spellData);
					var blinkHeight : int = TabelFieldHelper.getBlinkHeight(spellInfo.spellData.tabelName, spellInfo.spellData);
					var soarFrameTime : int = TabelFieldHelper.getSoarFrameTime(spellInfo.spellData.tabelName, spellInfo.spellData);

					RoleStateUtil.blinkToPos(spellInfo.atkor, attackStateRef.statusType, spellInfo.atkorPos, spellInfo.targetPos, blinkSpeed, blinkHeight, soarFrameTime, spellInfo.hitFrameTime, spellInfo);
					return true;
				}
			}
			return false;
		}
	}
}
