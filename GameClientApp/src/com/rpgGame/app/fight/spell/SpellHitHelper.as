package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.RoleHpStatusManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.DeadLaunchStateReference;
	import com.rpgGame.app.state.role.action.FallStateReference;
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

		/**
		 * 这个是用来处理类似陷阱类的伤害显示，有持续性伤害的显示 
		 * @param info
		 * 
		 */		
		public static function waveSpellHitEffect(info : ReleaseSpellInfo) : void
		{
			if (!ReleaseSpellInfo.isCurrReleaseInfo(info.flySceneObjID))
			{
				showSpellHitEffect(info);
			}
		}

		public static function fightSpellHitEffect(info : ReleaseSpellInfo) : void
		{
			if (ReleaseSpellInfo.isCurrReleaseInfo(info.flySceneObjID))
			{
				showSpellHitEffect(info);
			}
			info.motionFinish = true;
		}
		
		public static function showSpellSingleHitEffect(info : ReleaseSpellInfo):void
		{
			var hurted : Boolean = false;
			var role : SceneRole;
			var hurtAnimation : Q_SpellAnimation = info.hurtAnimation;
			
			hurted = true;
			
			role = SceneManager.getSceneObjByID(info.singleHurtVo.roleID) as SceneRole;
			if (role && role.usable)
			{
				if (RoleHpStatusManager.checkShowHpBarWhenHurt(role, info.atkor))
				{
					role.headFace.show();
				}
				
				SpellAnimationHelper.addTargetHurtEffect(role, info, hurtAnimation);
				
				if (role.isMainChar && info.atkor && info.atkor.usable)
				{
					info.atkor.updateInteractTime();
				}
				if (info.atkor && info.atkor.usable && info.atkor.isMainChar)
				{
					role.updateInteractTime();
				}
				//击退位移
				if (info.singleHurtVo.hasPositionChange)
				{
					RoleStateUtil.beatToPos(role, info.singleHurtVo.newPosition, info.atkorPos, info.beatBackSpeed);
				}
				else
				{
					if (info.singleHurtVo.stiffTime > 0)//击飞
					{
						var fallRef : FallStateReference = role.stateMachine.getReference(FallStateReference) as FallStateReference;
						fallRef.setParams(info.singleHurtVo.stiffTime);
						role.stateMachine.transition(RoleStateType.ACTION_FALL, fallRef);
					}
				}
				
				//显示被击特效
				var atkorPos : Point = (info.atkor && info.atkor.usable) ? new Point(info.atkor.x, info.atkor.z) : info.atkorPos;
				var hitRef : HitStateReference = role.stateMachine.getReference(HitStateReference) as HitStateReference;
				hitRef.setParams(atkorPos);
				role.stateMachine.transition(RoleStateType.ACTION_HIT, hitRef);
				var hurtRef : HurtStateReference = role.stateMachine.getReference(HurtStateReference) as HurtStateReference;
				hurtRef.setParams(info, info.singleHurtVo);
				role.stateMachine.transition(RoleStateType.CONTROL_HURT, hurtRef);
			}
		}

		private static function showSpellHitEffect(info : ReleaseSpellInfo) : void
		{
			var hurted : Boolean = false;
			var role : SceneRole;
			if (info.hurtList && info.hurtList.length > 0)
			{
				var hurtAnimation : Q_SpellAnimation = info.hurtAnimation;
				var sputteringHurtAnimation : Q_SpellAnimation = info.sputteringHurtAnimation;
				if (!sputteringHurtAnimation)
					sputteringHurtAnimation = hurtAnimation;

				hurted = true;
				for each (var hurtVo : FightHurtResult in info.hurtList)
				{
					role = SceneManager.getSceneObjByID(hurtVo.roleID) as SceneRole;
					if (role && role.usable)
					{
						if (RoleHpStatusManager.checkShowHpBarWhenHurt(role, info.atkor))
						{
							role.headFace.show();
						}

						if (role == info.targetRole)
						{
							SpellAnimationHelper.addTargetHurtEffect(role, info, hurtAnimation);
						}
						else
						{
							SpellAnimationHelper.addTargetHurtEffect(role, info, sputteringHurtAnimation);
						}

						if (role.isMainChar && info.atkor && info.atkor.usable)
						{
							info.atkor.updateInteractTime();
						}
						if (info.atkor && info.atkor.usable && info.atkor.isMainChar)
						{
							role.updateInteractTime();
						}
						//击退位移
						if (hurtVo.hasPositionChange)
						{
							RoleStateUtil.beatToPos(role, hurtVo.newPosition, info.atkorPos, info.beatBackSpeed);
						}
						else
						{
							if (hurtVo.stiffTime > 0)//击飞
							{
								var fallRef : FallStateReference = role.stateMachine.getReference(FallStateReference) as FallStateReference;
								fallRef.setParams(hurtVo.stiffTime);
								role.stateMachine.transition(RoleStateType.ACTION_FALL, fallRef);
							}
						}

						//显示被击特效
						var atkorPos : Point = (info.atkor && info.atkor.usable) ? new Point(info.atkor.x, info.atkor.z) : info.atkorPos;
						var hitRef : HitStateReference = role.stateMachine.getReference(HitStateReference) as HitStateReference;
						hitRef.setParams(atkorPos);
						role.stateMachine.transition(RoleStateType.ACTION_HIT, hitRef);
						var hurtRef : HurtStateReference = role.stateMachine.getReference(HurtStateReference) as HurtStateReference;
						hurtRef.setParams(info, hurtVo);
						role.stateMachine.transition(RoleStateType.CONTROL_HURT, hurtRef);
					}
				}
			}
//			if (info.stateList && info.stateList.length > 0)
//			{
//				for each (var buffData : BuffData in info.stateList)
//				{
//					role = SceneManager.getSceneObjByID(buffData.roleId) as SceneRole;
//					if (role)
//					{
//						var data : Q_buff = BuffStateDataManager.getData(buffData.cfgId);
//						if (data)
//						{
//							var buffRef : BuffStateReference;
////							if (data.is_stun) //眩晕
////							{
////								buffRef = role.stateMachine.getReference(StunStateReference) as StunStateReference;
////								buffRef.setParams(buffInfo.disappearTime);
////								role.stateMachine.transition(RoleStateType.CONTROL_STUN, buffRef);
////							}
////							else if (data.is_unmovable) //不能移动
////							{
////								buffRef = role.stateMachine.getReference(UnmovableStateReference) as UnmovableStateReference;
////								buffRef.setParams(buffInfo.disappearTime);
////								role.stateMachine.transition(RoleStateType.CONTROL_UNMOVABLE, buffRef);
////							}
////							else if (data.is_hush) //沉默
////							{
////								buffRef = role.stateMachine.getReference(HushStateReference) as HushStateReference;
////								buffRef.setParams(buffInfo.disappearTime);
////								role.stateMachine.transition(RoleStateType.CONTROL_HUSH, buffRef);
////							}
////							else if (data.is_hun_luan) //混乱
////							{
////								buffRef = role.stateMachine.getReference(HunLuanStateReference) as HunLuanStateReference;
////								buffRef.setParams(buffInfo.disappearTime);
////								role.stateMachine.transition(RoleStateType.CONTROL_HUN_LUAN, buffRef);
////							}
////							else if (false) //定身
////							{
////								buffRef = role.stateMachine.getReference(StiffStateReference) as StiffStateReference;
////								buffRef.setParams(buffInfo.disappearTime);
////								role.stateMachine.transition(RoleStateType.CONTROL_STIFF, buffRef);
////							}
//							role.buffSet.addBuff(buffData);
//						}
//					}
//				}
//			}
//			if (info.isTrapSpell)
//			{
//				if (hurted)
//				{
//					var expended : Boolean = ReleaseSpellInfo.expendReleaseInfo(info.flySceneObjID);
//					if (expended)
//					{
//						SpellAnimationHelper.removeSceneTrapEffect(info.atkorID, info.flySceneObjID);
//					}
//				}
//			}
//			else
//			{
				ReleaseSpellInfo.removeReleaseInfo(info.flySceneObjID);
//			}
		}

		public static function showSingleHurt(info : ReleaseSpellInfo, attackerId : Number, hurtRoleID : Number, hurtType : uint, hurtAmount : int) : void
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
			if (roleData.totalStat.hp > 0)
			{
				showHurtText(info.atkor, attackerId, role, hurtType, hurtAmount);
				YunBiaoManager.showInvivcibleBiaoEffect(info.atkor, attackerId, role, hurtType, hurtAmount);
			}

			if (roleData.totalStat.hp <= 0)
			{
				dealCharDeath(info, role);
			}
		}

		private static function dealCharDeath(info : ReleaseSpellInfo, target : SceneRole) : void
		{
			SpellAnimationHelper.removeTrapEffectsByAtkorID(target.id);
			EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DEATH, target);
			target.mouseEnable = false;
			var deadLaunchHeight : int = info.deadLaunchHeight;
			var deadLaunchDistance : int = info.deadLaunchDistance;
			var deadLaunchSpeed : int = info.deadLaunchSpeed;
			var deadBeatDistance : int = info.deadBeatDistance;
			var deadBeatSpeed : int = info.deadBeatSpeed;
			var deadBeatProbability : int = info.deadBeatProbability;
			var deadLaunchProbability : int = info.deadLaunchProbability;
			var prob : int = ((deadBeatDistance > 0 && deadBeatSpeed > 0) || (deadLaunchHeight > 0 && deadLaunchDistance > 0 && deadLaunchSpeed > 0)) ? 100 * Math.random() : 0;
			if (prob < deadBeatProbability) //击退
			{
				deadLaunchHeight = 0;
			}
			var canDeadBeat : Boolean = (target.type == SceneCharType.MONSTER && !(target.data as MonsterData).immuneDeadBeat && prob < (deadBeatProbability + deadLaunchProbability));
			if (canDeadBeat)
			{
				var atkorPos : Point = (info.atkor && info.atkor.usable) ? new Point(info.atkor.x, info.atkor.z) : info.atkorPos;
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
