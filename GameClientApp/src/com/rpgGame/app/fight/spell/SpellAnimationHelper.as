package com.rpgGame.app.fight.spell
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.AnimatorLocusPoint;
	import com.rpgGame.app.scene.animator.CommonTrajectoryAnimator;
	import com.rpgGame.app.scene.animator.FrontAxleDoubleAroundAnimator;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.animat.EffectAnimationCfgData;
	import com.rpgGame.coreData.clientConfig.EffectAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	
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
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			/** 施法者 **/
			var atkor : SceneRole = info.atkor;
			if (atkor == null || !atkor.usable || !atkor.isInViewDistance)
				return;
			atkor.avatar.removeRenderUnitsByType(RenderUnitType.KNIFE_LIGHT);
			var animatData : Q_SpellAnimation = info.fromAni;
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData;
				if (animatData.role_res)
				{
					rud = new RenderParamData(RenderUnitID.KNIFE_LIGHT, RenderUnitType.KNIFE_LIGHT, ClientConfig.getEffect(animatData.role_res));
					rud.clearSameType = true;
					
					if (animatData.bind_bone)
						effectRu = atkor.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = atkor.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = 0;
					effectRu.y = 0;
					effectRu.z = 0;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(0);
				}
				else if (animatData.scene_res)
				{
					var destPosition : Vector3D = null;
					if (animatData.bind_bone)
						destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone);
					else
						destPosition = atkor.position;
					if (!destPosition)
						destPosition = atkor.position;
					
					rud = new RenderParamData(knifeLightObjID, SceneCharType.KNIFE_LIGHT_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(0);
				}
				knifeLightObjID++;
			}
		}
		
		private static var selfEffectObjID : int = 1;
		
		public static function addSelfEffect(info : ReleaseSpellInfo) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			/** 施法者 **/
			var atkor : SceneRole = info.atkor;
			if (atkor == null || !atkor.usable || !atkor.isInViewDistance)
				return;
			var animatData : Q_SpellAnimation = info.selfAni;
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData;
				if (animatData.role_res)
				{
					rud = new RenderParamData(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
					rud.clearSameType = true;
					
					if (animatData.bind_bone)
						effectRu = atkor.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = atkor.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = 0;
					effectRu.y = 0;
					effectRu.z = 0;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(0);
				}
				else if (animatData.scene_res)
				{
					var destPosition : Vector3D = null;
					if (animatData.bind_bone)
						destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone);
					else
						destPosition = atkor.position;
					if (!destPosition)
						destPosition = atkor.position;
					
					rud = new RenderParamData(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(0);
				}
				selfEffectObjID++;
			}
		}
		
		public static function addSelfDestEffect(role : SceneRole, animatData : Q_SpellAnimation) : void
		{
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData;
				if (animatData.role_res)
				{
					rud = new RenderParamData(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
					rud.clearSameType = true;
					
					if (animatData.bind_bone)
						effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = role.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = role.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = animatData.offset_x;
					effectRu.y = animatData.offset_y;
//					effectRu.z = animatData.offset_z;
//					effectRu.scaleX = animatData.scale_x > 0 ? animatData.scale_x * 0.01 : 1;
//					effectRu.scaleY = animatData.scale_y > 0 ? animatData.scale_y * 0.01 : 1;
//					effectRu.scaleZ = animatData.scaleZ > 0 ? animatData.scaleZ * 0.01 : 1;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, role.avatar);
					effectRu.play(0);
				}
				else if (animatData.scene_res)
				{
					var destPosition : Vector3D = null;
					if (animatData.bind_bone)
						destPosition = role.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone);
					else
						destPosition = role.position;
					if (!destPosition)
						destPosition = role.position;
					
					rud = new RenderParamData(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = role.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = animatData.offset_x + destPosition.x;
					effectRu.y = animatData.offset_y + destPosition.y;
//					effectRu.z = animatData.offset_z + destPosition.z;
//					effectRu.scaleX = animatData.scale_x > 0 ? animatData.scale_x * 0.01 : 1;
//					effectRu.scaleY = animatData.scale_y > 0 ? animatData.scale_y * 0.01 : 1;
//					effectRu.scaleZ = animatData.scaleZ > 0 ? animatData.scaleZ * 0.01 : 1;
					effectRu.rotationY = role.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(0);
				}
				selfEffectObjID++;
			}
		}
		
		public static function addTargetEffect(target : SceneRole, renderId : int, renderType : String, effectRes : String, bindBone : String = null, repeat : int = 1, offset : Vector3D = null, needInView : Boolean = true, sizeScale : Number = 1) : void
		{
			if (target == null || !target.usable || (needInView && !target.isInViewDistance))
				return;
			if (effectRes)
			{
				if (!offset)
					offset = new Vector3D();
				var rud : RenderParamData = new RenderParamData(renderId, renderType, ClientConfig.getEffect(effectRes));
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
				effectRu.setScale(sizeScale);
				effectRu.rotationY = 0;
				effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
				effectRu.play(0);
			}
		}
		
		public static function addBuffEffect(target : SceneRole, renderId : int, renderType : String, effectRes : String, bindBone : String = null, repeat : int = 1, offset : Vector3D = null, needInView : Boolean = true) : void
		{
			if (target == null || !target.usable || (needInView && !target.isInViewDistance))
				return;
			if (effectRes)
			{
				if (!offset)
					offset = new Vector3D();
				var rud : RenderParamData = new RenderParamData(renderId, renderType, ClientConfig.getEffect(effectRes));
				var effectRu : RenderUnit3D;
				if (bindBone)
				{
					var avatarInfo : AvatarInfo = (target.data as RoleData).avatarInfo;
					var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
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
				effectRu.rotationY = 0;
				effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, target.avatar);
				effectRu.play(0);
			}
		}
		
		private static var hurtEffectObjID : int = 1;
		
		public static function addTargetHurtEffect(targetRole : SceneRole, info : ReleaseSpellInfo, animatData : Q_SpellAnimation) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			/** 受击者 **/
			if (targetRole == null || !targetRole.usable || !targetRole.isInViewDistance)
				return;
			
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData;
				if (animatData.role_res)
				{
					rud = new RenderParamData(hurtEffectObjID, RenderUnitType.HURT, ClientConfig.getEffect(animatData.role_res));
					
					if (animatData.bind_bone)
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rud);
					if (effectRu)
					{
						effectRu.allowCameraAnimator = targetRole.isMainChar || (info.atkor && info.atkor.usable && info.atkor.isMainChar);
						effectRu.repeat = 1;
						effectRu.x = 0;
						effectRu.y = 0;
						effectRu.z = 0;
						effectRu.rotationY = 0;
						effectRu.completeWhenInvisible = true;
						effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, targetRole.avatar);
						effectRu.play(0);
					}
				}
				else if (animatData.scene_res)
				{
					var destPosition : Vector3D = null;
					if (animatData.bind_bone)
						destPosition = targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone);
					else
						destPosition = targetRole.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01);
					if (!destPosition)
						destPosition = targetRole.position;
					
					rud = new RenderParamData(hurtEffectObjID, SceneCharType.SCENE_HURT_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = targetRole.isMainChar || (info.atkor && info.atkor.usable && info.atkor.isMainChar);
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.rotationY = targetRole.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(0);
				}
				hurtEffectObjID++;
			}
		}
		
		private static var _sceneTrapsByAtkorID : Dictionary = new Dictionary(true);
		
		public static function addDestEffect(destX : int, destZ : int, rotationY : int, info : ReleaseSpellInfo) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var animatData : Q_SpellAnimation = info.posAni;
			
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData;
				var repeat : int = 1;
				var lifecycle : int = 0;
				if (info.isTrapSpell)
				{
					repeat = 0;
					if (info.atkor && info.atkor.isMainChar) //只有自己才一直显示陷阱 
						lifecycle = info.repeatTimes * info.repeatInterval;
					else
						lifecycle = 3000;
				}
				if (animatData.scene_res)
				{
					rud = new RenderParamData(info.flySceneObjID, SceneCharType.SCENE_DEST_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud);
					effectRu.allowCameraAnimator = (info.atkor && info.atkor.isMainChar);
					effectRu.repeat = repeat;
					effectRu.x = destX;
					effectRu.z = destZ;
					effectRu.rotationY = rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu, true);
					
					if (lifecycle > 0)
					{
						effectRu.lifecycle = lifecycle;
						effectRu.setPlayCompleteCallBack(removeTrapFromScene, info.atkorID);
						
						var traps : Dictionary = _sceneTrapsByAtkorID[info.atkorID];
						if (!traps)
						{
							traps = new Dictionary(true);
							_sceneTrapsByAtkorID[info.atkorID] = traps;
						}
						traps[info.flySceneObjID] = effectRu;
					}
					else
					{
						effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					}
					effectRu.play(0);
				}
			}
		}
		
		private static function removeTrapFromScene(atkorID : Number, obj : BaseObj3D) : void
		{
			var objId : Number = obj.id;
			SceneManager.removeSceneObjFromScene(obj);
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
					SceneManager.removeSceneObjFromScene(effectRu);
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
					SceneManager.removeSceneObjFromScene(effectRu);
					traps[objId] = null;
					delete traps[objId];
				}
				_sceneTrapsByAtkorID[atkorID] = null;
				delete _sceneTrapsByAtkorID[atkorID];
			}
		}
		
		public static function addFlyEffect(info : ReleaseSpellInfo) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var animatData : Q_SpellAnimation = info.passAni;
			
			if (animatData)
			{
				if (animatData.scene_res)
				{
					var atkorPosition : Vector3D = null;
					var atkorRotationY : Number = 0;
					var destPosition : Vector3D = null;
					/** 施法者 **/
					var atkor : SceneRole = info.atkor;
					if (atkor == null || !atkor.usable)
					{
						var scene : GameScene3D = SceneManager.getScene();
						var posY : Number = scene.sceneMapLayer.queryHeightAt(info.atkorPos.x, info.atkorPos.y);
						atkorPosition = new Vector3D(info.atkorPos.x, posY, info.atkorPos.y);
						atkorRotationY = info.releaseAngle;
						destPosition = new Vector3D(info.atkorPos.x, posY, info.atkorPos.y);
					}
					else
					{
						atkorPosition = atkor.position.clone();
						atkorRotationY = atkor.rotationY;
						if (info.passAni.bind_bone)
							destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, info.passAni.bind_bone);
						else
							destPosition = atkor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02);
						if (!destPosition)
							destPosition = atkor.position.clone();
					}
					
					var effectQueue : Vector.<IRenderAnimator> = new Vector.<IRenderAnimator>();
					var locusPoints : Vector.<AnimatorLocusPoint> = new Vector.<AnimatorLocusPoint>();
					addFlyEffectOnce(info, animatData.scene_res, atkorPosition, atkorRotationY, destPosition, info.throwDelayTime, info.hitFrameTime, info.delayTime, effectQueue, locusPoints);
					for (var i : int = 1; i < info.repeatTimes; i++)
					{
						TweenLite.delayedCall((info.throwDelayTime + info.repeatInterval * i) * 0.001, addFlyEffectOnce, [info, animatData.scene_res, atkorPosition, atkorRotationY, destPosition, 0, 0, 0, effectQueue, locusPoints]);
					}
				}
			}
		}
		
		private static var flySceneObjID : int = 1;
		
		private static function addFlyEffectOnce(info : ReleaseSpellInfo, effectRes : String, atkorPosition : Vector3D, atkorRotationY : Number, destPosition : Vector3D, 
												 moveDelay : int, playDelay : int, releaseDelayTime : int, 
												 effectQueue : Vector.<IRenderAnimator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
			var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_FLY_SPELL + info.flySceneObjID, flySceneObjID);
			var rud : RenderParamData = new RenderParamData(1, "effect", ClientConfig.getEffect(effectRes), effectRes);
			
			var effectRu : RenderUnit3D = effectSet.addRenderUnit(rud);
			effectRu.allowCameraAnimator = (info.atkor && info.atkor.isMainChar);
			
			if (info.matchTerrain)
			{
				SceneManager.addSceneObjToScene(effectSet, true);
			}
			else
			{
				SceneManager.addSceneObjToScene(effectSet);
			}
			
			var renderSetAnimator : IRenderAnimator;
			var effectCfg : EffectAnimation = EffectAnimationCfgData.getInfo(effectRu.renderParamData.sourceName);
			if (effectCfg)
			{
				if (effectCfg.animatorName == FrontAxleDoubleAroundAnimator.name)
				{
					renderSetAnimator = new FrontAxleDoubleAroundAnimator(info, new Vector3D(info.targetPos.x, 0, info.targetPos.y), info.targetRole, info.flyTm, info.flySpeed, info.isTrackTarget, info.matchTerrain, info.isFlyCross, info.isAdaptiveTargetHeight, moveDelay, playDelay, releaseDelayTime, info.throwHeight, info.throwWeightRatio, effectCfg.frontAxleAroundRadius, effectCfg.frontAxleAroundAngularVelocity, effectCfg.convergenceTimes);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setAtkorData(atkorPosition, atkorRotationY, destPosition);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setQueue(effectQueue, locusPoints);
					effectSet.setRenderAnimator(renderSetAnimator);
				}
			}
			if (!renderSetAnimator)
			{
				renderSetAnimator = new CommonTrajectoryAnimator(info, new Vector3D(info.targetPos.x, 0, info.targetPos.y), info.targetRole, info.flyTm, info.flySpeed, info.isTrackTarget, info.matchTerrain, info.isFlyCross, info.isAdaptiveTargetHeight, moveDelay, playDelay, releaseDelayTime, info.throwHeight, info.throwWeightRatio);
				(renderSetAnimator as CommonTrajectoryAnimator).setAtkorData(atkorPosition, atkorRotationY, destPosition);
				(renderSetAnimator as CommonTrajectoryAnimator).setQueue(effectQueue, locusPoints);
				effectSet.setRenderAnimator(renderSetAnimator);
			}
			flySceneObjID++;
		}
		
		private static function avatarRuPlayComplete(avatar : RenderSet3D, ru : RenderUnit3D) : void
		{
			avatar.removeRenderUnit(ru);
		}
	}
}
