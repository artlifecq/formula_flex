package com.editor.fight.spell
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.EffectAnimationConfig;
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.AvatarInfo;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleData;
	import com.editor.data.TabelData;
	import com.editor.enum.BoneNameEnum;
	import com.editor.enum.SceneCharType;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.SceneManager;
	import com.editor.scene.SceneRole;
	import com.editor.scene.animator.AnimatorLocusPoint;
	import com.editor.scene.animator.CommonTrajectoryAnimator;
	import com.editor.scene.animator.FrontAxleDoubleAroundAnimator;
	import com.editor.scene.animator.ServerTrajectorySimulator;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.BaseObj3D;

	import flash.geom.Vector3D;
	import flash.utils.Dictionary;

	import gs.TweenLite;

	/**
	 *
	 * 技能动画助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午4:02:13
	 *
	 */
	public class SpellAnimationHelper
	{
		public function SpellAnimationHelper()
		{
		}

		private static var knifeLightObjID : int = 1;

		public static function addKnifeLightEffect(info : ReleaseSpellInfo) : void
		{
			/** 施法者 **/
			var atkor : SceneRole = info.atkor;
			if (atkor == null || !atkor.usable)
				return;
			atkor.avatar.removeRenderUnitsByType(RenderUnitType.KNIFE_LIGHT);
			/** 特效 **/
			if (info.spellData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var mRoleRes : String = TabelFieldHelper.getReleaseRoleEffect(info.spellData, atkor.stateMachine.isRiding);
				var mSceneRes : String = TabelFieldHelper.getReleaseSceneEffect(info.spellData, atkor.stateMachine.isRiding);
				var mBindBone : String = TabelFieldHelper.getReleaseBindBone(info.spellData, atkor.stateMachine.isRiding);
				var offset : Vector3D = TabelFieldHelper.getReleaseEffectOffset(info.spellData);
				var scale : Vector3D = TabelFieldHelper.getReleaseEffectScale(info.spellData);
				if (mRoleRes)
				{
					rud = new RenderParamData3D(RenderUnitID.KNIFE_LIGHT, RenderUnitType.KNIFE_LIGHT, GlobalConfig.getEffectFilePath(mRoleRes));
					rud.clearSameType = true;

					if (mBindBone)
						effectRu = atkor.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone, rud);
					else
						effectRu = atkor.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = 1;
					effectRu.x = offset.x;
					effectRu.y = offset.y;
					effectRu.z = offset.z;
					effectRu.scaleX = scale.x > 0 ? scale.x * 0.01 : 1;
					effectRu.scaleY = scale.y > 0 ? scale.y * 0.01 : 1;
					effectRu.scaleZ = scale.z > 0 ? scale.z * 0.01 : 1;
					effectRu.rotationY = 0;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(0);
				}
				else if (mSceneRes)
				{
					var destPosition : Vector3D = null;
					if (mBindBone)
						destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone);
					else
						destPosition = atkor.position;
					if (!destPosition)
						destPosition = atkor.position;

					rud = new RenderParamData3D(knifeLightObjID, SceneCharType.KNIFE_LIGHT_EFFECT, GlobalConfig.getEffectFilePath(mSceneRes));

					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = 1;
					effectRu.x = offset.x + destPosition.x;
					effectRu.y = offset.y + destPosition.y;
					effectRu.z = offset.z + destPosition.z;
					effectRu.scaleX = scale.x > 0 ? scale.x * 0.01 : 1;
					effectRu.scaleY = scale.y > 0 ? scale.y * 0.01 : 1;
					effectRu.scaleZ = scale.z > 0 ? scale.z * 0.01 : 1;
					effectRu.rotationY = atkor.rotationY;
					SceneManager.getInstance().addSceneObjToMainScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.getInstance().removeSceneObjFromMainScene);
					effectRu.play(0);
				}
				knifeLightObjID++;
			}
		}

		private static var selfEffectObjID : int = 1;

		public static function addSelfEffect(info : ReleaseSpellInfo) : void
		{
			/** 施法者 **/
			var atkor : SceneRole = info.atkor;
			if (atkor == null || !atkor.usable)
				return;
			/** 特效 **/
			if (info.spellData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var mRoleRes : String = TabelFieldHelper.getSelfRoleEffect(info.spellData, atkor.stateMachine.isRiding);
				var mSceneRes : String = TabelFieldHelper.getSelfSceneEffect(info.spellData, atkor.stateMachine.isRiding);
				var mBindBone : String = TabelFieldHelper.getSelfBindBone(info.spellData, atkor.stateMachine.isRiding);
				var offset : Vector3D = TabelFieldHelper.getSelfEffectOffset(info.spellData);
				var scale : Vector3D = TabelFieldHelper.getSelfEffectScale(info.spellData);
				if (mRoleRes)
				{
					rud = new RenderParamData3D(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, GlobalConfig.getEffectFilePath(mRoleRes));
					rud.clearSameType = true;

					if (mBindBone)
						effectRu = atkor.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone, rud);
					else
						effectRu = atkor.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = 1;
					effectRu.x = offset.x;
					effectRu.y = offset.y;
					effectRu.z = offset.z;
					effectRu.scaleX = scale.x > 0 ? scale.x * 0.01 : 1;
					effectRu.scaleY = scale.y > 0 ? scale.y * 0.01 : 1;
					effectRu.scaleZ = scale.z > 0 ? scale.z * 0.01 : 1;
					effectRu.rotationY = 0;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(0);
				}
				else if (mSceneRes)
				{
					var destPosition : Vector3D = null;
					if (mBindBone)
						destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone);
					else
						destPosition = atkor.position;
					if (!destPosition)
						destPosition = atkor.position;

					rud = new RenderParamData3D(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, GlobalConfig.getEffectFilePath(mSceneRes));

					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = 1;
					effectRu.x = offset.x + destPosition.x;
					effectRu.y = offset.y + destPosition.y;
					effectRu.z = offset.z + destPosition.z;
					effectRu.scaleX = scale.x > 0 ? scale.x * 0.01 : 1;
					effectRu.scaleY = scale.y > 0 ? scale.y * 0.01 : 1;
					effectRu.scaleZ = scale.z > 0 ? scale.z * 0.01 : 1;
					effectRu.rotationY = atkor.rotationY;
					SceneManager.getInstance().addSceneObjToMainScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.getInstance().removeSceneObjFromMainScene);
					effectRu.play(0);
				}
				selfEffectObjID++;
			}
		}

		public static function addTargetEffect(target : SceneRole, renderId : int, renderType : String, roleRes : String, bindBone : String, clearSameType : Boolean = true, repeat : int = 1, offset : Vector3D = null) : void
		{
			if (target == null || !target.usable)
				return;
			if (roleRes)
			{
				if (!offset)
					offset = new Vector3D();
				var rud : RenderParamData3D = new RenderParamData3D(renderId, renderType, GlobalConfig.getEffectFilePath(roleRes));
				rud.clearSameType = clearSameType;
				var effectRu : RenderUnit3D;
				if (bindBone)
					effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, bindBone, rud);
				else
					effectRu = target.avatar.addRenderUnit(rud);

				effectRu.allowCameraAnimator = target.isMainChar;
				effectRu.repeat = repeat;
				effectRu.x = offset.x;
				effectRu.y = offset.y;
				effectRu.z = offset.z;
				effectRu.rotationY = 0;
				effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
				effectRu.play(0);
			}
		}

		public static function addBuffEffect(target : SceneRole, renderId : int, renderType : String, roleRes : String, bindBone : String, clearSameType : Boolean = true, repeat : int = 1, offset : Vector3D = null, scale : Vector3D = null) : void
		{
			if (target == null || !target.usable)
				return;
			if (roleRes)
			{
				if (!offset)
					offset = new Vector3D();
				if (!scale)
					scale = new Vector3D();
				var rud : RenderParamData3D = new RenderParamData3D(renderId, renderType, GlobalConfig.getEffectFilePath(roleRes));
				rud.clearSameType = clearSameType;
				var effectRu : RenderUnit3D;
				if (bindBone)
				{
					var avatarInfo : AvatarInfo = (target.data as RoleData).avatarInfo;
					var rpd_mount : RenderParamData3D = avatarInfo.rpd_mount;
					if (rpd_mount)
					{
						effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.MOUNT, RenderUnitID.MOUNT, bindBone, rud);
					}
					else
					{
						effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, bindBone, rud);
					}
				}
				else
					effectRu = target.avatar.addRenderUnit(rud);

				effectRu.allowCameraAnimator = target.isMainChar;
				effectRu.repeat = repeat;
				effectRu.x = offset.x;
				effectRu.y = offset.y;
				effectRu.z = offset.z;
				effectRu.scaleX = scale.x > 0 ? scale.x * 0.01 : 1;
				effectRu.scaleY = scale.y > 0 ? scale.y * 0.01 : 1;
				effectRu.scaleZ = scale.z > 0 ? scale.z * 0.01 : 1;
				effectRu.rotationY = 0;
				effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
				effectRu.play(0);
			}
		}

		private static var hurtEffectObjID : int = 1;

		public static function addTargetHurtEffect(targetRole : SceneRole, info : ReleaseSpellInfo, mRoleRes : String, mSceneRes : String, mBindBone : String, offset : Vector3D, scale : Vector3D) : void
		{
			/** 受击者 **/
			if (targetRole == null || !targetRole.usable)
				return;
			if (info.spellData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;

				if (mRoleRes)
				{
					rud = new RenderParamData3D(hurtEffectObjID, RenderUnitType.HURT, GlobalConfig.getEffectFilePath(mRoleRes));
					if (mBindBone)
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone, rud);
					else
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rud);
					if (effectRu)
					{
						effectRu.repeat = 1;
						effectRu.allowCameraAnimator = true;
						effectRu.x = offset.x;
						effectRu.y = offset.y;
						effectRu.z = offset.z;
						effectRu.scaleX = (scale && scale.x > 0) ? scale.x * 0.01 : 1;
						effectRu.scaleY = (scale && scale.y > 0) ? scale.y * 0.01 : 1;
						effectRu.scaleZ = (scale && scale.z > 0) ? scale.z * 0.01 : 1;
						effectRu.rotationY = 0;
						effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, targetRole.avatar);
						effectRu.play(0);
					}
				}
				else if (mSceneRes)
				{
					var destPosition : Vector3D = null;
					if (mBindBone)
						destPosition = targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone);
					else
						destPosition = targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01);
					if (!destPosition)
						destPosition = targetRole.position;

					rud = new RenderParamData3D(hurtEffectObjID, SceneCharType.SCENE_HURT_EFFECT, GlobalConfig.getEffectFilePath(mSceneRes));

					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = 1;
					effectRu.x = offset.x + destPosition.x;
					effectRu.y = offset.y + destPosition.y;
					effectRu.z = offset.z + destPosition.z;
					effectRu.scaleX = (scale && scale.x > 0) ? scale.x * 0.01 : 1;
					effectRu.scaleY = (scale && scale.y > 0) ? scale.y * 0.01 : 1;
					effectRu.scaleZ = (scale && scale.z > 0) ? scale.z * 0.01 : 1;
					effectRu.rotationY = targetRole.rotationY;
					SceneManager.getInstance().addSceneObjToMainScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.getInstance().removeSceneObjFromMainScene);
					effectRu.play(0);
				}
				hurtEffectObjID++;
			}
		}

		private static var _sceneTrapsByAtkorID : Dictionary = new Dictionary(true);

		public static function addDestEffect(destX : int, destZ : int, rotationY : int, isRiding : Boolean, info : ReleaseSpellInfo) : void
		{
			if (info.spellData)
			{
				var offset : Vector3D = TabelFieldHelper.getDestEffectOffset(info.spellData);
				var scale : Vector3D = TabelFieldHelper.getDestEffectScale(info.spellData);

				var mSceneRes : String = TabelFieldHelper.getDestSceneEffect(info.spellData, isRiding);
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var repeat : int = 1;
				var lifecycle : int = 0;
				if (info.isTrapSpell)
				{
					repeat = 0;
					lifecycle = info.repeatTimes * info.repeatInterval;
				}
				if (mSceneRes)
				{
					rud = new RenderParamData3D(info.flySceneObjID, SceneCharType.SCENE_DEST_EFFECT, GlobalConfig.getEffectFilePath(mSceneRes));

					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = true;
					effectRu.repeat = repeat;
					effectRu.x = offset.x + destX;
					effectRu.y = offset.y;
					effectRu.z = offset.z + destZ;
					effectRu.scaleX = (scale && scale.x > 0) ? scale.x * 0.01 : 1;
					effectRu.scaleY = (scale && scale.y > 0) ? scale.y * 0.01 : 1;
					effectRu.scaleZ = (scale && scale.z > 0) ? scale.z * 0.01 : 1;
					effectRu.rotationY = rotationY;
					SceneManager.getInstance().addSceneObjToMainScene(effectRu, true);

					if (lifecycle > 0)
					{
						effectRu.lifecycle = lifecycle;
						effectRu.setPlayCompleteCallBack(removeTrapFromScene, info.atkor.id);

						var traps : Dictionary = _sceneTrapsByAtkorID[info.atkor.id];
						if (!traps)
						{
							traps = new Dictionary(true);
							_sceneTrapsByAtkorID[info.atkor.id] = traps;
						}
						traps[info.flySceneObjID] = effectRu;
					}
					else
					{
						effectRu.setPlayCompleteCallBack(SceneManager.getInstance().removeSceneObjFromMainScene);
					}
					effectRu.play(0);
				}
			}
		}

		private static function removeTrapFromScene(atkorID : Number, obj : BaseObj3D) : void
		{
			var objId : Number = obj.id;
			SceneManager.getInstance().removeSceneObjFromMainScene(obj);
			var traps : Dictionary = _sceneTrapsByAtkorID[atkorID];
			if (traps)
			{
				traps[objId] = null;
				delete traps[objId];
			}
		}

		public static function removeSceneTrapEffect(atkorID : Number, objId : Number) : void
		{
			var traps : Dictionary = _sceneTrapsByAtkorID[atkorID];
			if (traps)
			{
				var effectRu : RenderUnit3D = traps[objId];
				if (effectRu)
				{
					SceneManager.getInstance().removeSceneObjFromMainScene(effectRu);
					traps[objId] = null;
					delete traps[objId];
				}
			}
		}

		public static function removeTrapEffectsByAtkorID(atkorID : Number) : void
		{
			var traps : Dictionary = _sceneTrapsByAtkorID[atkorID];
			if (traps)
			{
				for (var objId : * in traps)
				{
					var effectRu : RenderUnit3D = traps[objId];
					SceneManager.getInstance().removeSceneObjFromMainScene(effectRu);
					traps[objId] = null;
					delete traps[objId];
				}
				_sceneTrapsByAtkorID[atkorID] = null;
				delete _sceneTrapsByAtkorID[atkorID];
			}
		}

		public static function addFlyEffect(isRiding : Boolean, info : ReleaseSpellInfo) : void
		{
			if (info.spellData)
			{
				var mSceneRes : String = TabelFieldHelper.getFlySceneEffect(info.spellData, isRiding);
				if (mSceneRes)
				{
					var mBindBone : String = TabelFieldHelper.getThrowBindBone(info.spellData, isRiding);
					var atkorPosition : Vector3D = null;
					var atkorRotationY : Number = 0;
					var destPosition : Vector3D = null;
					/** 施法者 **/
					var atkor : SceneRole = info.atkor;
					if (atkor == null || !atkor.usable)
					{
						var scene : GameScene3D = SceneManager.getInstance().mainScene;
						var posY : Number = scene.sceneMapLayer.queryHeightAt(info.atkorPos.x, info.atkorPos.y);
						atkorPosition = new Vector3D(info.atkorPos.x, posY, info.atkorPos.y);
						atkorRotationY = 0;
						destPosition = new Vector3D(info.atkorPos.x, posY, info.atkorPos.y);
					}
					else
					{
						atkorPosition = atkor.position.clone();
						atkorRotationY = atkor.rotationY;
						if (mBindBone)
							destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, mBindBone);
						else
							destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02);
						if (!destPosition)
							destPosition = atkor.position.clone();
					}

					var mFlyTime : int = TabelFieldHelper.getFlyTime(info.spellData.tabelName, info.spellData);
					var mFlySpeed : int = TabelFieldHelper.getFlySpeed(info.spellData.tabelName, info.spellData);
					var mThrowHeight : int = TabelFieldHelper.getThrowHeight(info.spellData);
					var mThrowWeightRatio : int = TabelFieldHelper.getThrowWeightRatio(info.spellData);

					var effectQueue : Vector.<IRenderAnimator> = new Vector.<IRenderAnimator>();
					var locusPoints : Vector.<AnimatorLocusPoint> = new Vector.<AnimatorLocusPoint>();
					var i : int = 0;
					addFlyEffectOnce(info, mSceneRes, atkorPosition, atkorRotationY, destPosition, info.throwDelayTime, info.hitFrameTime, info.releaseDelayTime, mFlyTime, mFlySpeed, mThrowHeight, mThrowWeightRatio, effectQueue, locusPoints);
					for (i = 1; i < info.repeatTimes; i++)
					{
						TweenLite.delayedCall((info.throwDelayTime + info.repeatInterval * i) * 0.001, addFlyEffectOnce, [info, mSceneRes, atkorPosition, atkorRotationY, destPosition, 0, 0, 0, mFlyTime, mFlySpeed, mThrowHeight, mThrowWeightRatio, effectQueue, locusPoints]);
					}

					var simulatorQueue : Vector.<ServerTrajectorySimulator> = new Vector.<ServerTrajectorySimulator>();
					var serverLocusPoints : Vector.<AnimatorLocusPoint> = new Vector.<AnimatorLocusPoint>();
					addServerSimulatorOnce(info, atkorPosition, info.releaseDelayTime, mFlyTime, mFlySpeed, simulatorQueue, serverLocusPoints);
					for (i = 1; i < info.repeatTimes; i++)
					{
						TweenLite.delayedCall((info.throwDelayTime + info.repeatInterval * i) * 0.001, addServerSimulatorOnce, [info, atkorPosition, 0, mFlyTime, mFlySpeed, simulatorQueue, serverLocusPoints]);
					}
				}
			}
		}

		private static var flySceneObjID : int = 1;

		private static function addFlyEffectOnce(info : ReleaseSpellInfo, effectRes : String, atkorPosition : Vector3D, atkorRotationY : Number, destPosition : Vector3D, moveDelay : int, playDelay : int, releaseDelayTime : int, mFlyTime : int, mFlySpeed : int, throwHeight : int, throwWeightRatio : int, effectQueue : Vector.<IRenderAnimator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
			var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_FLY_SPELL + info.flySceneObjID, flySceneObjID);
			var rud : RenderParamData3D = new RenderParamData3D(1, "effect", GlobalConfig.getEffectFilePath(effectRes), effectRes);

			var effectRu : RenderUnit3D = effectSet.addRenderUnit(rud);
			effectRu.allowCameraAnimator = true;

			if (info.matchTerrain)
			{
				SceneManager.getInstance().addSceneObjToMainScene(effectSet, true);
			}
			else
			{
				SceneManager.getInstance().addSceneObjToMainScene(effectSet);
			}
			info.flySceneObjID = effectSet.id;

			var renderSetAnimator : IRenderAnimator;
			var effectCfg : EffectAnimationConfig = null;
			var effectTabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.EffectAnimationConfigName);
			if (effectTabel)
			{
				var rtnDatas : Array = ConfigData.getCfgByFieldValue(effectTabel.desc, "res", effectRu.renderParamData.sourceName);
				effectCfg = rtnDatas.length > 0 ? rtnDatas[0] as EffectAnimationConfig : null;
			}
			if (effectCfg)
			{
				if (effectCfg.mAnimatorName == FrontAxleDoubleAroundAnimator.name)
				{
					renderSetAnimator = new FrontAxleDoubleAroundAnimator(info, new Vector3D(info.targetPos.x, 0, info.targetPos.y), info.targetRole, mFlyTime, mFlySpeed, info.isTrackTarget, info.matchTerrain, info.isFlyCross, info.isAdaptiveTargetHeight, moveDelay, playDelay, releaseDelayTime, throwHeight, throwWeightRatio, effectCfg.mFrontAxleAroundRadius, effectCfg.mFrontAxleAroundAngularVelocity, effectCfg.mConvergenceTimes);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setAtkorData(atkorPosition, atkorRotationY, destPosition);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setQueue(effectQueue, locusPoints);
					effectSet.setRenderAnimator(renderSetAnimator);
				}
			}
			if (!renderSetAnimator)
			{
				renderSetAnimator = new CommonTrajectoryAnimator(info, new Vector3D(info.targetPos.x, 0, info.targetPos.y), info.targetRole, mFlyTime, mFlySpeed, info.isTrackTarget, info.matchTerrain, info.isFlyCross, info.isAdaptiveTargetHeight, moveDelay, playDelay, releaseDelayTime, throwHeight, throwWeightRatio);
				(renderSetAnimator as CommonTrajectoryAnimator).setAtkorData(atkorPosition, atkorRotationY, destPosition);
				(renderSetAnimator as CommonTrajectoryAnimator).setQueue(effectQueue, locusPoints);
				effectSet.setRenderAnimator(renderSetAnimator);
			}
			flySceneObjID++;
		}

		private static function addServerSimulatorOnce(info : ReleaseSpellInfo, atkorPosition : Vector3D, releaseDelayTime : int, mFlyTime : int, mFlySpeed : int, simulatorQueue : Vector.<ServerTrajectorySimulator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
			var serverSimulator : ServerTrajectorySimulator = new ServerTrajectorySimulator(info, new Vector3D(info.targetPos.x, 0, info.targetPos.y), info.targetRole, mFlyTime, mFlySpeed, info.isTrackTarget, info.isFlyCross, releaseDelayTime);
			serverSimulator.setAtkorData(atkorPosition);
			serverSimulator.setQueue(simulatorQueue, locusPoints);
			serverSimulator.run();
		}

		private static function avatarRuPlayComplete(avatar : RenderSet3D, ru : RenderUnit3D) : void
		{
			avatar.removeRenderUnit(ru);
		}
	}
}
