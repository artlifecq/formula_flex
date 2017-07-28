package com.rpgGame.app.fight.spell
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.AnimatorLocusPoint;
	import com.rpgGame.app.scene.animator.CommonTrajectoryAnimator;
	import com.rpgGame.app.scene.animator.FrontAxleDoubleAroundAnimator;
	import com.rpgGame.app.scene.animator.RibbonAnimator;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.animat.EffectAnimationCfgData;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.EffectAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	
	import gs.TweenLite;
	import com.rpgGame.app.scene.animator.CommonTrajectoryAnimator2;
	
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
		
		/**
		 * 加刀光特效 ，施法特效。
		 * @param info
		 * 
		 */		
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
				var rud : RenderParamData3D;
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(RenderUnitID.KNIFE_LIGHT, RenderUnitType.KNIFE_LIGHT, ClientConfig.getEffect(animatData.role_res));
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
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(1,speed);
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
					
					rud = new RenderParamData3D(knifeLightObjID, SceneCharType.KNIFE_LIGHT_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(1,speed);
				}
				knifeLightObjID++;
			}
		}
		
		private static var selfEffectObjID : int = 1;
		/**
		 * 在角色身上加特效 
		 * @param info
		 * 
		 */		
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
				var rud : RenderParamData3D;
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
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
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(1,speed);
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
					
					rud = new RenderParamData3D(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(1,speed);
				}
				selfEffectObjID++;
			}
		}
		
		/**
		 *  
		 * @param role
		 * @param animatData
		 * 
		 */		
		public static function addSelfDestEffect(role : SceneRole, animatData : Q_SpellAnimation) : void
		{
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
					rud.clearSameType = true;
					
					if (animatData.bind_bone)
						effectRu = role.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = role.avatar.addRenderUnit(rud);
					effectRu.allowCameraAnimator = role.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = animatData.offset_x;
					effectRu.y = animatData.offset_y;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, role.avatar);
					effectRu.play(1,speed);
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
					
					rud = new RenderParamData3D(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = role.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = animatData.offset_x + destPosition.x;
					effectRu.y = animatData.offset_y + destPosition.y;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = role.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(1,speed);
				}
				selfEffectObjID++;
			}
		}
		
		/**
		 * 为目标角色添加特效 
		 * @param target
		 * @param renderId
		 * @param renderType
		 * @param effectRes
		 * @param bindBone
		 * @param repeat
		 * @param offset
		 * @param needInView
		 * @param sizeScale
		 * 
		 */		
		public static function addTargetEffect(target : SceneRole, renderId : int, renderType : String, effectRes : String, bindBone : String = null, 
											   repeat : int = 1, offset : Vector3D = null, needInView : Boolean = true, sizeScale : Number = 1,speed:Number=1) : RenderUnit3D
		{
			if (target == null || !target.usable || (needInView && !target.isInViewDistance))
				return null;
			if (effectRes)
			{
				if (!offset)
					offset = new Vector3D();
				var rud : RenderParamData3D = new RenderParamData3D(renderId, renderType, ClientConfig.getEffect(effectRes));
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
				effectRu.play(1,speed);
                return effectRu;
			}
            return null;
		}
		
		/**
		 * 为目标角色添加buff相关特效 
		 * @param target
		 * @param renderId
		 * @param renderType
		 * @param effectRes
		 * @param bindBone
		 * @param repeat
		 * @param offset
		 * @param needInView
		 * 
		 */		
		public static function addBuffEffect(target : SceneRole, renderId : int, renderType : String, effectRes : String, bindBone : String = null,
											 repeat : int = 1, offset : Vector3D = null, needInView : Boolean = true) : RenderUnit3D
		{
			if (target == null || !target.usable || (needInView && !target.isInViewDistance))
				return null;
			if (effectRes)
			{
				if (!offset)
					offset = new Vector3D();
				var rud : RenderParamData3D = new RenderParamData3D(renderId, renderType, ClientConfig.getEffect(effectRes));
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
						//effectRu = target.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, bindBone, rud);
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
				effectRu.play(1);
                return effectRu;
			}
            return null;
		}
		
		private static var hurtEffectObjID : int = 1;
		/**
		 * 为目标角色添加受伤特效 
		 * @param targetRole
		 * @param info
		 * @param animatData
		 * 
		 */		
		public static function addTargetHurtEffect(targetRole : SceneRole, fightHurtResult : FightHurtResult, animatData : Q_SpellAnimation) : void
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
				var rud : RenderParamData3D;
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(hurtEffectObjID, RenderUnitType.HURT, ClientConfig.getEffect(animatData.role_res));
					
					if (animatData.bind_bone)
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, animatData.bind_bone, rud);
					else
						effectRu = targetRole.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_01, rud);
					if (effectRu)
					{
						effectRu.allowCameraAnimator = targetRole.isMainChar || (fightHurtResult.atkor && fightHurtResult.atkor.usable && fightHurtResult.atkor.isMainChar);
						effectRu.repeat = 1;
						effectRu.x = 0;
						effectRu.y = 0;
						effectRu.z = 0;
						effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
						effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
						effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
						effectRu.rotationY = 0;
						effectRu.completeWhenInvisible = true;
						effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, targetRole.avatar);
						effectRu.play(1,speed);
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
					
					rud = new RenderParamData3D(hurtEffectObjID, SceneCharType.SCENE_HURT_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = targetRole.isMainChar || (fightHurtResult.atkor && fightHurtResult.atkor.usable && fightHurtResult.atkor.isMainChar);
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = targetRole.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(1,speed);
				}
				hurtEffectObjID++;
			}
		}
		
		private static var bornEffectID:int = 0;
		public static function addBornEffect(role : SceneRole,destX : int, destZ : int,effectID:int,mountResID:String="",finishFunc:Function=null):void
		{
			var animatData:Q_SpellAnimation = AnimationDataManager.getData(effectID);
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var repeat : int = 1;
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				if (animatData.scene_res)
				{
					rud = new RenderParamData3D(bornEffectID, SceneCharType.BORN_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = (role && role.isMainChar);
					effectRu.repeat = repeat;
					effectRu.x = destX;
					effectRu.z = destZ;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu, true);
					if(finishFunc!=null)
						effectRu.setPlayCompleteCallBack(finishFunc, role,mountResID);
					else
						effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(1,speed);
				}
			}
			bornEffectID++;
		}
		
		
		private static var _sceneWarningID : Dictionary = new Dictionary(true);
		/**
		 * 添加预警特效
		 * @param destX
		 * @param destZ
		 * @param rotationY
		 * @param animatData
		 * 
		 */		
		public static function addWarningEffect(atkor:SceneRole,destX : int, destZ : int, rotationY : int, animatData : Q_SpellAnimation) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var repeat : int = 1;
				var lifecycle : int = 0;
				//				if (info.isTrapSpell)//如果该技能是陷进特效的话，就算出陷进特效的持续时间
				//				{
				//					repeat = 0;
				//					if (info.atkor && info.atkor.isMainChar) //只有自己才一直显示陷阱 
				//						lifecycle = info.repeatTimes * info.repeatInterval;
				//					else
				//						lifecycle = 3000;
				//				}
				
				
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
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
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(1,speed);
				}else if (animatData.scene_res)
				{
					rud = new RenderParamData3D(1, SceneCharType.SCENE_DEST_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = false;
					effectRu.repeat = repeat;
					effectRu.x = destX;
					effectRu.z = destZ;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu, true);
					
					//					if (lifecycle > 0)
					//					{
					//						effectRu.lifecycle = lifecycle;
					//						effectRu.setPlayCompleteCallBack(removeTrapFromScene, info.atkorID);
					//						
					//						var traps : Dictionary = _sceneTrapsByAtkorID[info.atkorID];
					//						if (!traps)
					//						{
					//							traps = new Dictionary(true);
					//							_sceneTrapsByAtkorID[info.atkorID] = traps;
					//						}
					//						traps[info.flySceneObjID] = effectRu;
					//					}
					//					else
					//					{
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					//					}
					effectRu.play(1,speed);
				}
			}
		}
		
		
		
		private static var _sceneTrapsByAtkorID : Dictionary = new Dictionary(true);
		
		/**
		 * 添加地面特效(陷进特效也是地面特效)
		 * @param destX
		 * @param destZ
		 * @param rotationY
		 * @param info
		 * 
		 */		
		public static function addDestEffect(destX : int, destZ : int, rotationY : int, info : ReleaseSpellInfo) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var animatData : Q_SpellAnimation = info.posAni;
			
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				var repeat : int = 1;
				var lifecycle : int = 0;
//				if (info.isTrapSpell)//如果该技能是陷进特效的话，就算出陷进特效的持续时间
//				{
//					repeat = 0;
//					if (info.atkor && info.atkor.isMainChar) //只有自己才一直显示陷阱 
//						lifecycle = info.repeatTimes * info.repeatInterval;
//					else
//						lifecycle = 3000;
//				}
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				if (animatData.scene_res)
				{
					rud = new RenderParamData3D(1, SceneCharType.SCENE_DEST_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = (info.atkor && info.atkor.isMainChar);
					effectRu.repeat = repeat;
					effectRu.x = destX;
					effectRu.z = destZ;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu, true);
					
//					if (lifecycle > 0)
//					{
//						effectRu.lifecycle = lifecycle;
//						effectRu.setPlayCompleteCallBack(removeTrapFromScene, info.atkorID);
//						
//						var traps : Dictionary = _sceneTrapsByAtkorID[info.atkorID];
//						if (!traps)
//						{
//							traps = new Dictionary(true);
//							_sceneTrapsByAtkorID[info.atkorID] = traps;
//						}
//						traps[info.flySceneObjID] = effectRu;
//					}
//					else
//					{
						effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
//					}
					effectRu.play(1,speed);
				}
			}
		}
		
		/**
		 * 删除陷进特效 
		 * @param atkorID
		 * @param obj
		 * 
		 */		
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
		
		/**
		 * 删除陷阱特效 
		 * @param atkorID
		 * @param objId
		 * 
		 */		
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
		
		/**
		 * 根据角色id，删除陷进特效 
		 * @param atkorID
		 * 
		 */		
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
		
		private static var ribbonEffectID:uint = 0;
		public static function addRibbonEffect(info:ReleaseSpellInfo):void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var imgUrl:String = info.ribbonImg;
			if(imgUrl != ""&&info.flyTargets&&info.flyTargets.length>0)//没有目标也不播放----yt---以前的条件if(imgUrl != null || imgUrl != null)
			{
				var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_RIBBON_SPELL, ribbonEffectID,true);
				effectSet.setGroundXY(info.atkor.x,info.atkor.z);
				if (info.matchTerrain)
				{
					SceneManager.addSceneObjToScene(effectSet, true);
				}
				else
				{
					SceneManager.addSceneObjToScene(effectSet);
				}
				var ribbonAnimator : IRenderAnimator;
				if (!ribbonAnimator)
				{
					ribbonAnimator = new RibbonAnimator();
					(ribbonAnimator as RibbonAnimator).initRibbonData(imgUrl,info.flyTargets,info.atkor,info.isAttachUnit);
					effectSet.setRenderAnimator(ribbonAnimator);
				}
				
				ribbonEffectID++;
			}
		}
		
		
		/**
		 * 添加弹道特效 
		 * @param info
		 * 
		 */		
		public static function addFlyEffect(info : ReleaseSpellInfo) : void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var animatData : Q_SpellAnimation = info.passAni;
			
			if (animatData)
			{
				if (animatData.scene_res)
				{
					var effectQueue : Vector.<IRenderAnimator> = new Vector.<IRenderAnimator>();
					var locusPoints : Vector.<AnimatorLocusPoint> = new Vector.<AnimatorLocusPoint>();
					for (var i : int = 0; i < info.flyTargetPosList.length; i++)
					{
						var targetPosition:Vector3D = new Vector3D(info.flyTargetPosList[i].x,0,info.flyTargetPosList[i].y);
						TweenLite.delayedCall((info.throwDelayTime + info.flyInterval * i) * 0.001, addFlyEffectOnce, [info, animatData.scene_res, targetPosition,null, 0, 0,effectQueue, locusPoints]);
					}
					
					var startTime:Number = info.flyTargetPosList.length * info.flyInterval;
					for(var j:int = 0;j<info.flyTargets.length;j++)
					{
						if(info.flyTargets[j] == null)continue;
						TweenLite.delayedCall((startTime + info.throwDelayTime + info.flyInterval * j) * 0.001, addFlyEffectOnce, [info, animatData.scene_res, info.flyTargets[j].position.clone(),info.flyTargets[j],0, 0, effectQueue, locusPoints]);
					}
//					addFlyEffectOnce(info, animatData.scene_res, atkorPosition, atkorRotationY, destPosition, info.throwDelayTime, info.hitFrameTime/*, info.delayTime*/, effectQueue, locusPoints);
//					for (var i : int = 1; i < info.flyCount; i++)
//					{
//						
//					}
				}
			}
		}
		
		private static var flySceneObjID : int = 1;
		
		public static var use2:Boolean=false;
		/**
		 * 添加一个弹道特效 
		 * @param info
		 * @param effectRes
		 * @param atkorPosition
		 * @param atkorRotationY
		 * @param destPosition
		 * @param moveDelay
		 * @param playDelay
		 * @param releaseDelayTime
		 * @param effectQueue
		 * @param locusPoints
		 * 
		 */		
		private static function addFlyEffectOnce(info : ReleaseSpellInfo, 
                                                 effectRes : String, 
												 targetPosition:Vector3D,targetRole:SceneRole,
												 moveDelay : int, playDelay : int, /*releaseDelayTime : int,*/ 
												 effectQueue : Vector.<IRenderAnimator>, locusPoints : Vector.<AnimatorLocusPoint>) : void
		{
            var atkorPosition : Vector3D = null;
            var atkorRotationY : Number = 0;
            var destPosition : Vector3D = null;
            /** 施法者 **/
            var atkor : SceneRole = info.atkor;
            if (atkor == null || !atkor.usable)
            {
                //						var scene : GameScene3D = SceneManager.getScene();
                //						var posY : Number = scene.sceneMapLayer.queryHeightAt(info.atkorPos.x, info.atkorPos.y);
                var posY:Number = info.atkorPos.y;//2.5d没有高度值，因为只有2维的，默认为0
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
            
			var effectSet : RenderSet3D = RenderSet3D.create(SceneCharType.SCENE_FLY_SPELL/* + info.flySceneObjID*/, flySceneObjID,true);
			var rud : RenderParamData3D = new RenderParamData3D(1, "effect", ClientConfig.getEffect(effectRes), effectRes);
			
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
					renderSetAnimator = new FrontAxleDoubleAroundAnimator(info, targetPosition, info.targetRole, info.flyTm, info.flySpeed, info.isTrackTarget, 
						info.matchTerrain, info.isFlyCross, info.isAdaptiveTargetHeight, moveDelay, playDelay, info.throwHeight,
						info.throwWeightRatio, effectCfg.frontAxleAroundRadius, effectCfg.frontAxleAroundAngularVelocity, effectCfg.convergenceTimes);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setAtkorData(atkor,atkorPosition, atkorRotationY, destPosition);
					(renderSetAnimator as FrontAxleDoubleAroundAnimator).setQueue(effectQueue, locusPoints);
					effectSet.setRenderAnimator(renderSetAnimator);
				}
			}
			if (!renderSetAnimator)
			{
				if (use2) 
				{
					renderSetAnimator = new CommonTrajectoryAnimator2(
						info, 
						targetPosition, 
						targetRole, 
						info.flyTm, 
						info.flySpeed, 
						info.isTrackTarget, 
						info.matchTerrain, 
						info.isFlyCross, 
						info.isAdaptiveTargetHeight, 
						moveDelay, 
						playDelay, 
						info.throwHeight, 
						info.throwWeightRatio);
					(renderSetAnimator as CommonTrajectoryAnimator2).setQueue(effectQueue, locusPoints);
					(renderSetAnimator as CommonTrajectoryAnimator2).setAtkorData(atkorPosition, atkorRotationY, destPosition);
				}
				else
				{
					renderSetAnimator = new CommonTrajectoryAnimator(
						info, 
						targetPosition, 
						targetRole, 
						info.flyTm, 
						info.flySpeed, 
						info.isTrackTarget, 
						info.matchTerrain, 
						info.isFlyCross, 
						info.isAdaptiveTargetHeight, 
						moveDelay, 
						playDelay, 
						info.throwHeight, 
						info.throwWeightRatio);
					(renderSetAnimator as CommonTrajectoryAnimator).setQueue(effectQueue, locusPoints);
					(renderSetAnimator as CommonTrajectoryAnimator).setAtkorData(atkor,atkorPosition, atkorRotationY, destPosition);
				}
				
				
				effectSet.setRenderAnimator(renderSetAnimator);
			}
			flySceneObjID++;
		}
		
		/**
		 * 从角色身上删除 技能添加的特效，主要用于回调用 
		 * @param avatar
		 * @param ru
		 * 
		 */		
		private static function avatarRuPlayComplete(avatar : RenderSet3D, ru : RenderUnit3D) : void
		{
			avatar.removeRenderUnit(ru);
		}
		
		/**
		 * 同步施法特效 
		 * @param time
		 * @param spellID
		 * @param role
		 * 
		 */		
		public static function synSelfSpellAnimator(time:Number,spellID:int,role:SceneRole):void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			/** 施法者 **/
			var atkor : SceneRole = role;
			if (atkor == null || !atkor.usable || !atkor.isInViewDistance)
				return;
			var spellEffectData:Q_SpellEffect = SpellDataManager.getSpellEffectData(spellID);
			var animatData : Q_SpellAnimation = AnimationDataManager.getData(spellEffectData.self_dest_animation);
			/** 特效 **/
			if (animatData)
			{
				var effectRu : RenderUnit3D;
				var rud : RenderParamData3D;
				
				var speed:Number=animatData.speed>0?animatData.speed*0.01:1;
				if (animatData.role_res)
				{
					rud = new RenderParamData3D(RenderUnitID.SPELL_SELF_EFFECT, RenderUnitType.SPELL_SELF_EFFECT, ClientConfig.getEffect(animatData.role_res));
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
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = 0;
					effectRu.completeWhenInvisible = true;
					effectRu.setPlayCompleteCallBack(avatarRuPlayComplete, atkor.avatar);
					effectRu.play(time,speed);
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
					
					rud = new RenderParamData3D(selfEffectObjID, SceneCharType.SCENE_SELF_EFFECT, ClientConfig.getEffect(animatData.scene_res));
					
					effectRu = RenderUnit3D.create(rud,true);
					effectRu.allowCameraAnimator = atkor.isMainChar;
					effectRu.repeat = 1;
					effectRu.x = destPosition.x;
					effectRu.y = destPosition.y;
					effectRu.z = destPosition.z;
					effectRu.scaleX=animatData.scale_x>0?animatData.scale_x*0.01:1;
					effectRu.scaleY=animatData.scale_y>0?animatData.scale_y*0.01:1;
					effectRu.scaleZ=animatData.scale_z>0?animatData.scale_z*0.01:1;
					effectRu.rotationY = atkor.rotationY;
					effectRu.completeWhenInvisible = true;
					SceneManager.addSceneObjToScene(effectRu);
					effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
					effectRu.play(time,speed);
				}
				selfEffectObjID++;
			}
		}
		
		/**
		 * 同步地面特效 
		 * @param time
		 * @param spellID
		 * @param role
		 * 
		 */		
		public static function synDestSpellAnimator(time:Number,spellID:int,role:SceneRole):void
		{
			if (SceneManager.isSceneOtherRenderLimit)
				return;
			var spellEffectData:Q_SpellEffect = SpellDataManager.getSpellEffectData(spellID);
			var animatData : Q_SpellAnimation = AnimationDataManager.getData(spellEffectData.dest_animation);

			/** 特效 **/
			if (animatData)
			{
//				var effectRu : RenderUnit3D;
//				var rud : RenderParamData3D;
//				var repeat : int = 1;
//				var lifecycle : int = 0;
//			
//				if (animatData.scene_res)
//				{
//					rud = new RenderParamData3D(info.flySceneObjID, SceneCharType.SCENE_DEST_EFFECT, ClientConfig.getEffect(animatData.scene_res));
//					
//					effectRu = RenderUnit3D.create(rud,true);
//					effectRu.allowCameraAnimator = (role && role.isMainChar);
//					effectRu.repeat = repeat;
//					effectRu.x = destX;
//					effectRu.z = destZ;
//					effectRu.rotationY = rotationY;
//					effectRu.completeWhenInvisible = true;
//					SceneManager.addSceneObjToScene(effectRu, true);
//					
//					if (lifecycle > 0)
//					{
//						effectRu.lifecycle = lifecycle;
//						effectRu.setPlayCompleteCallBack(removeTrapFromScene, info.atkorID);
//						
//						var traps : Dictionary = _sceneTrapsByAtkorID[info.atkorID];
//						if (!traps)
//						{
//							traps = new Dictionary(true);
//							_sceneTrapsByAtkorID[info.atkorID] = traps;
//						}
//						traps[info.flySceneObjID] = effectRu;
//					}
//					else
//					{
//						effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
//					}
//					effectRu.play(1);
//				}
			}
		}
		public static function createSceneEffect(effectRes:String, id : int, type : String, x : int, y : int) : RenderUnit3D
		{
			//如果场景中存在此类型此ID的角色，则移除之
			var rud : RenderParamData3D = new RenderParamData3D(id, type, ClientConfig.getEffect(effectRes));
			var effectRu : RenderUnit3D = RenderUnit3D.create(rud,true);
			effectRu.repeat = 1;
			effectRu.mouseEnable = false;
			effectRu.play(0);
			effectRu.visible = true;
			effectRu.setGroundXY(x, y);
			effectRu.setPlayCompleteCallBack(SceneManager.removeSceneObjFromScene);
			SceneManager.addSceneObjToScene(effectRu, true, false, false);
			return effectRu;
		}
	}
}
