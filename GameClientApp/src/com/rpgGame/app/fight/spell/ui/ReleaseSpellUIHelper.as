package com.rpgGame.app.fight.spell.ui
{
	import com.game.engine3D.utils.MathUtil;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.BlinkStateReference;
	import com.rpgGame.app.state.role.action.ui.AttackUIStateReference;
	import com.rpgGame.app.state.role.control.AttackHardStateReference;
	import com.rpgGame.app.state.role.control.BlinkMoveStateReference;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SpellBlinkType;
	
	import flash.geom.Point;

	/**
	 *
	 * 释放技能助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *主要处理UI上的模型技能释放
	 */
	public class ReleaseSpellUIHelper
	{
		public function ReleaseSpellUIHelper()
		{
		}
		
		public static function fightSoulSpell(spellInfo : ReleaseSpellUIInfo) : void
		{
			if(spellInfo.ribbonImg)
			{
				SpellAnimationUIHelper.addRibbonEffect(spellInfo);
			}
		}
		public static function releaseSpell(spellInfo :ReleaseSpellUIInfo) : void
		{
			/** 施法者 **/
			var ref : AttackUIStateReference = null;
			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				var motion : String = spellInfo.atkMotion;
				spellInfo.motionFinish = !motion;
				ref = spellInfo.atkor.stateMachine.getReference(AttackUIStateReference) as AttackUIStateReference;
				ref.setParams(spellInfo, motion, 1, spellInfo.soarFrameTime,0,spellInfo.releaseCompleteCall);
			}
			//先不管位移
			var blinked : Boolean = false;//spellInfo.blinkType > 0;
			if (blinked)
			{
				if (ref)
				{
					doBlink(ref);
				}
				else
				{
//					SpellHitHelper.fightSpellHitEffect(spellInfo);
				}
			}
			else
			{
				if (ref)
				{
					ref.onAfterExecute(onAttackExecute);
					ref.onStartFrame(onSelfEffectFrame);
					ref.onHitFrame(onAttackHitFrame);
					ref.onHurtFrameFunc(spellInfo.hitCallBack);
//					ref.onBreakFrame(onBreakFrame);
					spellInfo.atkor.stateMachine.transition(RoleStateType.ACTION_ATTACK_UI, ref);
				}
				else
				{
					var targetPos : Point = (spellInfo.targetRole && spellInfo.targetRole.usable) ? new Point(spellInfo.targetRole.x, spellInfo.targetRole.z) : spellInfo.targetPos;
					var atkorPos : Point = (spellInfo.atkor && spellInfo.atkor.usable) ? new Point(spellInfo.atkor.x, spellInfo.atkor.z) : spellInfo.atkorPos;
					if(targetPos == null || atkorPos == null)
					{
						GameLog.addShow("这个技能数据有异常，服务器给的施法者为空，有可能这个施法者可能已经被通知删掉了！！！");
						return;
					}
					var angle : int = MathUtil.getAngle(targetPos.x, targetPos.y, atkorPos.x, atkorPos.y);
					SpellAnimationUIHelper.addDestEffect(targetPos.x, targetPos.y, angle, spellInfo);
				}
				if (spellInfo.passAni)
				{
					SpellAnimationUIHelper.addFlyEffect(spellInfo);
				}
				if(spellInfo.ribbonImg)
				{
					SpellAnimationUIHelper.addRibbonEffect(spellInfo);
				}
				else
				{
					/*if (ref)
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
					}*/
				}
			}

			if (spellInfo.atkor && spellInfo.atkor.usable && spellInfo.atkor.isMainChar)
			{
				var hardRef : AttackHardStateReference = spellInfo.atkor.stateMachine.getReference(AttackHardStateReference) as AttackHardStateReference;
				hardRef.setParams(spellInfo.castTime);
				spellInfo.atkor.stateMachine.transition(RoleStateType.CONTROL_ATTACK_HARD, hardRef, true);
				SkillCDManager.getInstance().addSkillCDTime(spellInfo.spellData);
			}
			if(spellInfo.atkor == MainRoleManager.actor)
			{
				//TrusteeshipManager.getInstance().startFightSoulFight();
			}
		}

		/**
		 * 刀光特效 
		 * @param ref
		 * 
		 */		
		private static function onAttackExecute(ref : AttackUIStateReference) : void
		{
			SpellAnimationUIHelper.addKnifeLightEffect(ref.spellInfo);
		}
		
		/**
		 * 自身施法特效 
		 * @param ref
		 * 
		 */		
		private static function onSelfEffectFrame(ref : AttackUIStateReference):void
		{
			SpellAnimationUIHelper.addSelfEffect(ref.spellInfo);
		}

		/**
		 * 释放地面特效 
		 * @param ref
		 * 
		 */		
		private static function onAttackHitFrame(ref : AttackUIStateReference) : void
		{
			return;
			try
			{
				SpellAnimationUIHelper.addDestEffect(ref.targetRolePos.x, ref.targetRolePos.y, ref.angle, ref.spellInfo);
			}
			catch(e:Error)
			{
				GameLog.addShow("有被攻击者为空的情况，属于异常情况！！！");
			}
		}

		/**
		 * 为位移技能类，提供的接口 
		 * @param attackStateRef
		 * @return 
		 * 
		 */		
		private static function doBlink(attackStateRef : AttackUIStateReference) : Boolean
		{
			var spellInfo : ReleaseSpellUIInfo = attackStateRef.spellInfo;
			/** 施法者 **/
			if (spellInfo.atkor && spellInfo.atkor.usable)
			{
				if (spellInfo.blinkType > 0)
				{
					blinkToPos(spellInfo.atkor, attackStateRef.statusType, spellInfo.atkorPos, spellInfo.targetPos, spellInfo.blinkSpeed, spellInfo.blinkHeight, 
						spellInfo.soarFrameTime, spellInfo.hitFrameTime, spellInfo);
					return true;
				}
			}
			return false;
		}
		public static function blinkToPos(role : SceneRole, statusType : String, atkorPos : Point, targetPos : Point, speed : int, blinkHeight : int, 
										  soarFrameTime : int, hitFrameTime : int, spellInfo : ReleaseSpellUIInfo) : void
		{
			
		}
		
		private static function onBlinkExecute(statusType : String, spellInfo : ReleaseSpellUIInfo, ref : BlinkMoveStateReference) : void
		{
		
		}
		
		private static function onBlinkMoveHitFrame(role : SceneRole, ref : BlinkMoveStateReference) : void
		{
			var spellInfo : ReleaseSpellUIInfo = ref.data as ReleaseSpellUIInfo;
			SpellAnimationUIHelper.addDestEffect(ref.targetPos.x, ref.targetPos.y, ref.angle, spellInfo);
			//			SpellHitHelper.fightSpellHitEffect(spellInfo);
		}
	}
}
