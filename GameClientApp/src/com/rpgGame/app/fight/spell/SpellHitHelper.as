package com.rpgGame.app.fight.spell
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.RoleHpStatusManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.DeadLaunchStateReference;
	import com.rpgGame.app.state.role.action.HitStateReference;
	import com.rpgGame.app.state.role.control.HurtStateReference;
	import com.rpgGame.core.events.SceneCharacterEvent;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 技能受击助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-18 下午5:22:16
	 *
	 */
	public class SpellHitHelper
	{
		public function SpellHitHelper()
		{
		}

		public static function fightSpellHitEffect(info : SpellResultInfo) : void
		{
			showSpellHitEffect(info);
		}

		private static function showSpellHitEffect(info : SpellResultInfo) : void
		{
			var hurted : Boolean = false;
			var role : SceneRole;
			var atkor:SceneRole;
			if (info.hurtList && info.hurtList.length > 0)
			{
				hurted = true;
				for each (var hurtVo : FightHurtResult in info.hurtList)
				{
					var hurtAnimation : Q_SpellAnimation = hurtVo.hurtAnimation;
					var sputteringHurtAnimation : Q_SpellAnimation = hurtVo.sputteringHurtAnimation;
					if (!sputteringHurtAnimation)
						sputteringHurtAnimation = hurtAnimation;
					
					role = SceneManager.getSceneObjByID(hurtVo.targetID) as SceneRole;
					if (role && role.usable)
					{
						if (RoleHpStatusManager.checkShowHpBarWhenHurt(role, hurtVo.atkor as SceneRole))
						{
							role.headFace.show();
						}

						if (role == hurtVo.targetRole)
						{
							SpellAnimationHelper.addTargetHurtEffect(role, hurtVo, hurtAnimation);
						}
						else
						{
							SpellAnimationHelper.addTargetHurtEffect(role, hurtVo, sputteringHurtAnimation);
						}

						if (role.isMainChar && hurtVo.atkor && hurtVo.atkor.usable)
						{
							hurtVo.atkor.updateInteractTime();
						}
						if (hurtVo.atkor && hurtVo.atkor.usable && hurtVo.atkor.isMainChar)
						{
							role.updateInteractTime();
						}
						//击退位移
						if (hurtVo.hasPositionChange)
						{
							RoleStateUtil.beatToPos(role, hurtVo.newPosition, hurtVo.atkorPos, hurtVo.beatBackSpeed);
						}
						else if(hurtVo.hasPositionFly)//击飞位移
						{
							RoleStateUtil.fallToPos(hurtVo.stiffTime,role, hurtVo.newPosition, hurtVo.atkorPos, hurtVo.deadLaunchSpeed);
						}
						
						if(role.isHiding)//如果是隐身的话，就不执行角色的受击动作和伤害变色
						{
							return;
						}
						
						//显示被击特效
						atkor=SceneManager.getSceneObjByID(hurtVo.atkorID) as SceneRole;
						var atkorPos : Point
						if(atkor != null)
						{
							atkorPos = new Point(atkor.x, atkor.z);
						}
						var hitRef : HitStateReference = role.stateMachine.getReference(HitStateReference) as HitStateReference;
						hitRef.setParams(atkorPos);
						role.stateMachine.transition(RoleStateType.ACTION_HIT, hitRef);
						var hurtRef : HurtStateReference = role.stateMachine.getReference(HurtStateReference) as HurtStateReference;
						hurtRef.setParams(/*info, */hurtVo);
						role.stateMachine.transition(RoleStateType.CONTROL_HURT, hurtRef);
						
						GameLog.addShow("*************************本次伤害值为： \t" + hurtVo.curLife);
					}
				}
			}
		}

		public static function showSingleHurt(hortVo : FightHurtResult, attackerId : Number, hurtRoleID : Number, hurtType : uint, hurtAmount : int) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(hurtRoleID) as SceneRole;
			if (role == null)
			{
				return;
			}
			var roleData : RoleData = role.data as RoleData;
			if (roleData == null)
			{
				return;
			}
			showHurtText(hortVo.atkor as SceneRole, attackerId, role, hurtType, hurtAmount);
			if (roleData.totalStat.hp > 0)
			{
				YunBiaoManager.showInvivcibleBiaoEffect(hortVo.atkor as SceneRole, attackerId, role, hurtType, hurtAmount);
			}

			if (roleData.totalStat.hp <= 0)
			{
				dealCharDeath(hortVo, role);
			}
		}

		private static function dealCharDeath(hortVo : FightHurtResult, target : SceneRole) : void
		{
			SpellAnimationHelper.removeTrapEffectsByAtkorID(target.id);
			EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DEATH, target);
			target.mouseEnable = false;
			
			var deadLaunchHeight : int = hortVo.deadLaunchHeight;
			var deadLaunchDistance : int = hortVo.deadLaunchDistance;
			var deadLaunchSpeed : int = hortVo.deadLaunchSpeed;
			
			var deadBeatDistance : int = hortVo.deadBeatDistance;
			var deadBeatSpeed : int = hortVo.deadBeatSpeed;
			
			var deadBeatProbability : int = hortVo.deadBeatProbability;
			var deadLaunchProbability : int = hortVo.deadLaunchProbability;
			
			var prob : int = ((deadBeatDistance > 0 && deadBeatSpeed > 0) || (deadLaunchHeight > 0 && deadLaunchDistance > 0 && deadLaunchSpeed > 0)) ? 100 * Math.random() : 0;
			if (prob < deadBeatProbability) //击退
			{
				deadLaunchHeight = 0;
			}
			var canDeadBeat : Boolean = false;//(target.type == SceneCharType.MONSTER && !(target.data as MonsterData).immuneDeadBeat && prob < (deadBeatProbability + deadLaunchProbability));
			if (canDeadBeat)
			{
				var atkorPos : Point = (hortVo.atkor && hortVo.atkor.usable) ? new Point(hortVo.atkor.x, hortVo.atkor.z) : hortVo.atkorPos;
				var ref : DeadLaunchStateReference = target.stateMachine.getReference(DeadLaunchStateReference) as DeadLaunchStateReference;
				if (deadLaunchHeight > 0)
					ref.setParams(atkorPos, deadLaunchHeight, deadLaunchDistance, deadLaunchSpeed);
				else
					ref.setParams(atkorPos, 0, deadBeatDistance, deadBeatSpeed);
				target.stateMachine.transition(RoleStateType.ACTION_DEAD_LAUNCH, ref);
			}
			else
			{
				target.stateMachine.transition(RoleStateType.ACTION_DEATH);
			}
			ClientTriggerManager.deathTrigger(target);
		}

		/**
		 * 伤害飘字
		 * @param atkor
		 * @param attackerId
		 * @param hurter
		 * @param hurtType
		 * @param hurtAmount
		 *
		 */
		public static function showHurtText(atkor : SceneRole, attackerId : Number, hurter : SceneRole, hurtType : uint, hurtAmount : int) : void
		{
			if (attackerId != 0)
			{
				atkor = SceneManager.getSceneObjByID(attackerId) as SceneRole;
			}
			if (hurter == null)
			{
				return;
			}
			var baseInfo : RoleData = hurter.data as RoleData;
			if (baseInfo == null)
			{
				return;
			}
			if (RoleHpStatusManager.checkShowHpBarWhenAttack(atkor, hurter))
			{
				atkor.headFace.show();
			}
			//飘血飘字,等技能完成后再调整
			FightFaceHelper.showHurtText(atkor, hurter, hurtType, hurtAmount);
		}
	}
}
