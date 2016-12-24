package com.editor.fight.spell
{
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.manager.SpellFightManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.editor.state.role.action.DeadLaunchStateReference;
	import com.editor.state.role.action.HitStateReference;
	import com.editor.state.role.control.HurtStateReference;

	import flash.geom.Point;
	import flash.geom.Vector3D;


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

		public static function addSpellHitEffect(info : ReleaseSpellInfo, isRiding : Boolean) : void
		{
			var mRoleRes : String = TabelFieldHelper.getHurtRoleEffect(info.spellData, isRiding);
			var mSceneRes : String = TabelFieldHelper.getHurtSceneEffect(info.spellData, isRiding);
			var mBindBone : String = TabelFieldHelper.getHurtBindBone(info.spellData, isRiding);
			var offset : Vector3D = TabelFieldHelper.getHurtEffectOffset(info.spellData);
			var scale : Vector3D = TabelFieldHelper.getHurtEffectScale(info.spellData);

			var mSputteringRoleRes : String = TabelFieldHelper.getSputteringHurtRoleEffect(info.spellData, isRiding);
			var mSputteringSceneRes : String = TabelFieldHelper.getSputteringHurtSceneEffect(info.spellData, isRiding);
			var mSputteringBindBone : String = TabelFieldHelper.getSputteringHurtBindBone(info.spellData, isRiding);
			var sputteringOffset : Vector3D = TabelFieldHelper.getSputteringHurtEffectOffset(info.spellData);
			var sputteringScale : Vector3D = TabelFieldHelper.getSputteringHurtEffectScale(info.spellData);

			if (!mSputteringRoleRes && !mSputteringSceneRes)
			{
				mSputteringRoleRes = mRoleRes;
				mSputteringSceneRes = mSceneRes;
			}

			for each (var role : SceneRole in SpellFightManager.getInstance().enemyEntities)
			{
				if (role && role.usable)
				{
					if (role == info.targetRole)
						SpellAnimationHelper.addTargetHurtEffect(role, info, mRoleRes, mSceneRes, mBindBone, offset, scale);
					else
						SpellAnimationHelper.addTargetHurtEffect(role, info, mSputteringRoleRes, mSputteringSceneRes, mSputteringBindBone, sputteringOffset, sputteringScale);

					//击退位移
					var distance : int = TabelFieldHelper.getBeatBackDistance(info.spellData.tabelName, info.spellData);
					if (distance > 0)
					{
						var beatSpeed : int = TabelFieldHelper.getBeatBackSpeed(info.spellData.tabelName, info.spellData);
						var targetX : int = role.x + distance;
						var targetZ : int = role.z;
						var newPosition : Point = new Point(targetX, targetZ);
						RoleStateUtil.beatToPos(role, newPosition, info.atkorPos, beatSpeed);
					}
					else
					{
//					if (hurtVo.stiffTime > 0)
//					{
//						var fallRef : FallStateReference = role.stateMachine.fallStateReference;
//						fallRef.setParams(hurtVo.stiffTime);
//						role.stateMachine.transition(RoleStateType.ACTION_FALL, fallRef);
//					}
					}
					//显示被击特效
					var atkorPos : Point = (info.atkor && info.atkor.usable) ? new Point(info.atkor.x, info.atkor.z) : info.atkorPos;
					var hitRef : HitStateReference = role.stateMachine.getReference(HitStateReference) as HitStateReference;
					hitRef.setParams(atkorPos);
					role.stateMachine.transition(RoleStateType.ACTION_HIT, hitRef);
					var hurtRef : HurtStateReference = role.stateMachine.getReference(HurtStateReference) as HurtStateReference;
					hurtRef.setParams(info, null);
					role.stateMachine.transition(RoleStateType.CONTROL_HURT, hurtRef);
					(role.data as RoleData).hp -= info.hurtLife;
					if ((role.data as RoleData).hp <= 0)
					{
						dealCharDeath(info.atkor, role, info);
					}


//					for each (var buffInfo : BuffInfo in info.stateList)
//					{
//						var state : StateProto = BuffStateDataManager.getData(buffInfo.cfgId);
//						if (state)
//						{
//							if (state.isHush)
//							{
//								var stiffRef : StiffStateReference = role.stateMachine.getReference(StiffStateReference) as StiffStateReference;
//								stiffRef.setParams(buffInfo, state);
//								role.stateMachine.transition(RoleStateType.CONTROL_STIFF, stiffRef);
//							}
					role.buffSet.addBuffEffect(info);
//						}
//					}
				}
			}
		}

		private static function dealCharDeath(atkor : SceneRole, target : SceneRole, info : ReleaseSpellInfo) : void
		{
			target.mouseEnable = false;
			var deadLaunchHeight : int = TabelFieldHelper.getDeadLaunchHeight(info.spellData.tabelName, info.spellData);
			var deadLaunchDistance : int = TabelFieldHelper.getDeadLaunchDistance(info.spellData.tabelName, info.spellData);
			var deadLaunchSpeed : int = TabelFieldHelper.getDeadLaunchSpeed(info.spellData.tabelName, info.spellData);
			var deadBeatDistance : int = TabelFieldHelper.getDeadBeatDistance(info.spellData.tabelName, info.spellData);
			var deadBeatSpeed : int = TabelFieldHelper.getDeadBeatSpeed(info.spellData.tabelName, info.spellData);
			if ((deadBeatDistance > 0 && deadBeatSpeed > 0) || (deadLaunchHeight > 0 && deadLaunchDistance > 0 && deadLaunchSpeed > 0))
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
		}
	}
}
