package com.rpgGame.app.state.role
{
	import com.game.engine3D.state.StateRefOverrideType;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneCursorHelper;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.state.role.action.BlinkStateReference;
	import com.rpgGame.app.state.role.action.FallStateReference;
	import com.rpgGame.app.state.role.action.RunStateReference;
	import com.rpgGame.app.state.role.control.BeatMoveStateReference;
	import com.rpgGame.app.state.role.control.BlinkMoveStateReference;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SpellBlinkType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import gameEngine2D.NetDebug;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 角色状态工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午10:32:16
	 *
	 */
	public class RoleStateUtil
	{
		public static var lastWalkTime : int = 0;
		public static const WALK_DELAY : int = 100;
		public static const MAX_WALK_SPEED : int = 500;

		public static const DEATH_STATE_EFFECT_CORRODE : int = 1;
		public static const DEATH_STATE_EFFECT_COLOR : int = 2;
		public static var deathStateEffectType : int = DEATH_STATE_EFFECT_COLOR;

		public function RoleStateUtil()
		{
		}

		public static function tryDragIn(role : SceneRole, targetX : int, targetY : int) : Boolean
		{
			var dist : int = MathUtil.getDistanceNoSqrt(role.x, role.z, targetX, targetY);
			if (dist > 200 * 200)
			{
				trace("拉得太远：", dist, role.x, role.z, targetX, targetY);
				role.setGroundXY(targetX, targetY);
				return true;
			}
			return false;
		}

		/**
		 * 行走到某点，此方法传入2D的x,y坐标
		 * @param role
		 * @param posx
		 * @param posy
		 *
		 */
		public static function walk(role : SceneRole, posx : Number, posy : Number, spacing : int = 0, data : Object = null, 
									onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : void
		{
			if (!role || !role.usable)
				return;
			if (role.isMainChar || role.isMainCamouflage)
			{
				var nowTime : int = getTimer();
				if (nowTime - RoleStateUtil.lastWalkTime < RoleStateUtil.WALK_DELAY)
				{
					return;
				}
			}
			var position : Vector3D = new Vector3D(posx, posy, 0, role.position.w);
			walkToPos(role, position, spacing, data, onArrive, onThrough, onUpdate);
		}

		/**
		 * 由路径信息行走
		 * @param role
		 * @param infos
		 *
		 */
		public static function walkByInfos(info : RoleMoveInfo) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(info.roleID) as SceneRole;
			if (role && role.usable)
			{
				var ref : WalkMoveStateReference = role.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				ref.setParams(info.speed, 0, null, info);
				ref.overrideType = StateRefOverrideType.ATTACH;
				ref.onMove(onWalkMove);
				if (ref.throughFuncArgs && ref.throughFuncArgs.length > 0)
					ref.onThrough(onWalkThrough, ref.throughFuncArgs[0]);
				else
					ref.onThrough(onWalkThrough, null);
				role.stateMachine.transition(RoleStateType.CONTROL_WALK_MOVE, ref, true, true);
			}
		}

		/**
		 * 行走到点，主要用这个
		 * @param role
		 * @param gridPos
		 * @param onArrive
		 *@param noWalk 寻路路径小不用寻路，也返回方法 返回 role   任务上用到 ---------yt
		 */
		public static function walkToPos(role : SceneRole, pos : Vector3D, spacing : int = 0, data : Object = null, 
										 onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null,noWalk:Function=null) : void
		{
			if (!role || !role.usable)
				return;
			
			var dist:int = Point.distance(new Point(role.position.x,role.position.z),new Point(pos.x,pos.y));
			if(dist <= spacing)
			{
				role.faceToGround(pos.x,pos.y);
				if(noWalk!=null)
				{
					noWalk(data);
				}
				
				return;
			}
			
			if (role.isMainChar || role.isMainCamouflage)
			{
				var nowTime : int = getTimer();
				if (nowTime - RoleStateUtil.lastWalkTime < RoleStateUtil.WALK_DELAY)
				{
					return;
				}
				SceneCursorHelper.getInstance().hideCursor();
			}
			doWalkToPos(role, pos, spacing, data, onArrive, onThrough, onUpdate);
		}

		public static function doWalkToPos(role : SceneRole, pos : Vector3D, spacing : int = 0, data : Object = null, 
										   onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : Boolean
		{
            /*CONFIG::netDebug {
                NetDebug.LOG("[RoleStateUtil] [doWalkToPos]");
            }*/
			if (!role || !role.usable)
				return false;
			var camouflageEntity : SceneRole = SceneRole(role.getCamouflageEntity());
			var walkRole : SceneRole = camouflageEntity || role;
			if (walkRole.isMainChar || walkRole.isMainCamouflage)
			{
				if (MainRoleManager.isTakeZhanChe) //乘坐他人战车时不能移动
				{
					return false;
				}
				if (StallManager.isOnStall) //摆摊不能移动
					return false;
				var nowTime : int = getTimer();
				if (nowTime - RoleStateUtil.lastWalkTime < RoleStateUtil.WALK_DELAY)
				{
					return false;
				}
				if (walkRole.stateMachine.isDeadState)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.WalkMoveIsDead); //"已死亡不能移动"
					return false;
				}
				else if (walkRole.stateMachine.isAttackHarding)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsHarding); //"技能硬直中"
					return false;
				}
				else if (walkRole.stateMachine.isStun)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.WalkMoveIsStun); //"眩晕中不能移动"
					return false;
				}
				else if (walkRole.stateMachine.isStiff)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.WalkMoveIsStiff); //"定身中不能移动"
					return false;
				}
				RoleStateUtil.lastWalkTime = nowTime;
			}
			var moveSpeed : int = (walkRole.data as RoleData).totalStat.moveSpeed;
			if (moveSpeed > MAX_WALK_SPEED || moveSpeed == 0)
				moveSpeed = MAX_WALK_SPEED;
			var ref : WalkMoveStateReference = walkRole.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
			ref.setParams(moveSpeed, spacing, pos);
			ref.data = data;
			ref.onMove(onWalkMove);
			ref.onUpdate(onUpdate);
			ref.onThrough(onWalkThrough, onThrough);
			ref.onArrive(onWalkArrivefunction, onArrive);
			ref.onReady(onWalkReady);
			ref.onUnable(onWalkUnable);
			ref.onStop(onWalkStop);
			ref.onEnd(onWalkEnd);
			ref.onSync(onWalkSync);
			walkRole.stateMachine.transition(RoleStateType.CONTROL_WALK_MOVE, ref);
			return walkRole.stateMachine.isWalkMoving;
		}
		
		private static function nullFunc():void
		{
			
		}

		private static function onWalkArrivefunction(onArrive : Function, ref : WalkMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				//派发行走到达事件
			}
			if (onArrive != null)
				onArrive(ref);
		}

		private static function onWalkReady(ref : WalkMoveStateReference) : void
		{
            CONFIG::netDebug {
                NetDebug.LOG("[RoleStateUtil] [onWalkReady] MOVE_START");
            }
			updateRoleBaseWalkActionSpeed(ref.owner as SceneRole);
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_START);
					//GameSoundManager.playWalkSound(GameSoundType.HANDLE_ACTION, GameSound_HandleActionType.WALK_ON_STONE);
			}
		}

		public static function updateRoleBaseWalkActionSpeed(role : SceneRole) : void
		{
			var baseWalkActionSpeed : int = RoleData.DEFAULT_BASE_WALK_ACTION_SPEED;
			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo((role.data as RoleData).avatarInfo.mountResID || (role.data as RoleData).avatarInfo.bodyResID);
			if (avatarResConfig)
			{
				baseWalkActionSpeed = avatarResConfig.baseWalkActionSpeed > 0 ? avatarResConfig.baseWalkActionSpeed : RoleData.DEFAULT_BASE_WALK_ACTION_SPEED;
			}
			(role.data as RoleData).baseWalkActionSpeed = baseWalkActionSpeed;
		}

		private static function onWalkUnable(ref : WalkMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				//				var tilePos : Point = (ref as MoveStateRef).vectorPath as Point;
				//				var mapTile : MapTile = SceneUtil.getMapTile(tilePos.x, tilePos.y);
				//				//派发对外角色无法到达事件
				//				EventManager.dispatchEvent(MoveEvent.MOVE_UNABLE, [ref.owner as SceneRole, mapTile]);
			}
		}

		private static function onWalkStop(ref : WalkMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				if (!ref.isServerStop)
					SceneSender.SendPlayerStopMessage(); //告诉服务器，停止移动。
			}
		}

		private static function onWalkEnd(ref : WalkMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				SceneCursorHelper.getInstance().hideCursor();
				EventManager.dispatchEvent(UserMoveEvent.MOVE_END);
			}
		}

		private static function onWalkSync(ref : WalkMoveStateReference) : void
		{
//			if (CountryWarWatchManager.isWatching)
//			{
//				return;
//			}

			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				if (ref.path.length > 1)
				{
					SceneSender.SendNewRunningMessage(ref.path);
				}
			}
		}

		private static function onWalkMove(ref : WalkMoveStateReference) : void
		{
			var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
			runRef.setParams(ref.speed, ((ref.owner as SceneRole).data as RoleData).baseWalkActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_ENTER);
			}
			else if ((ref.owner as SceneRole).ownerIsMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.FOLLOW_MOVE_ENTER, ref.owner);
			}
		}

		private static function onWalkThrough(onThrough : Function, ref : WalkMoveStateReference) : void
		{
			var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
			runRef.setParams(ref.speed, ((ref.owner as SceneRole).data as RoleData).baseWalkActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			if ((ref.owner as SceneRole).isMainChar || (ref.owner as SceneRole).isMainCamouflage)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_THROUGH);
			}
			else if ((ref.owner as SceneRole).ownerIsMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.FOLLOW_MOVE_THROUGH, ref.owner);
			}
			else
			{
				EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, ref.owner);
			}
			if (onThrough != null)
				onThrough(ref);
		}

		public static function beatToPos(role : SceneRole, pos : Point, atkorPos : Point, speed : int) : void
		{
			var ref : BeatMoveStateReference = role.stateMachine.getReference(BeatMoveStateReference) as BeatMoveStateReference;
			ref.setParams(pos, atkorPos, speed);
			ref.onMove(onBeatMove);
			role.stateMachine.transition(RoleStateType.CONTROL_BEAT_MOVE, ref);
		}
		
		public static function fallToPos(stiffTime:int,role : SceneRole, pos : Point, atkorPos : Point, speed : int):void
		{
			var fallRef : FallStateReference = role.stateMachine.getReference(FallStateReference) as FallStateReference;
			fallRef.setParams(stiffTime,pos, atkorPos, speed);
			role.stateMachine.transition(RoleStateType.ACTION_FALL, fallRef);
		}

		private static function onBeatMove(ref : BeatMoveStateReference) : void
		{
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_BEAT_BACK);
		}

		public static function blinkToPos(role : SceneRole, statusType : String, atkorPos : Point, targetPos : Point, speed : int, blinkHeight : int, 
										  soarFrameTime : int, hitFrameTime : int, spellInfo : ReleaseSpellInfo) : void
		{
			var moveRef : BlinkMoveStateReference = role.stateMachine.getReference(BlinkMoveStateReference) as BlinkMoveStateReference;
			moveRef.setParams(atkorPos, targetPos, speed, blinkHeight, soarFrameTime, hitFrameTime, spellInfo);
			moveRef.data = spellInfo;
			moveRef.onAfterExecute(onBlinkExecute, statusType, spellInfo);
			moveRef.onHitFrame(onBlinkMoveHitFrame, role);
			role.stateMachine.transition(RoleStateType.CONTROL_BLINK_MOVE, moveRef);
		}

		private static function onBlinkExecute(statusType : String, spellInfo : ReleaseSpellInfo, ref : BlinkMoveStateReference) : void
		{
			if (!spellInfo.atkor || !spellInfo.atkor.usable)
				return;
			var actionRef : BlinkStateReference = spellInfo.atkor.stateMachine.getReference(BlinkStateReference) as BlinkStateReference;
			actionRef.setParams(statusType, spellInfo.blinkType == SpellBlinkType.TIAO_PI, ref.totalTime, ref.soarFrameTime, ref.hitFrameTime, ref.throwDelayTime);
			actionRef.data = spellInfo;
			spellInfo.atkor.stateMachine.transition(RoleStateType.ACTION_BLINK, actionRef, true);
			SpellAnimationHelper.addKnifeLightEffect(ref.spellInfo);
			SpellAnimationHelper.addSelfEffect(ref.spellInfo);
		}

		private static function onBlinkMoveHitFrame(role : SceneRole, ref : BlinkMoveStateReference) : void
		{
			var spellInfo : ReleaseSpellInfo = ref.data as ReleaseSpellInfo;
			SpellAnimationHelper.addDestEffect(ref.targetPos.x, ref.targetPos.y, ref.angle, spellInfo);
//			SpellHitHelper.fightSpellHitEffect(spellInfo);
		}

		/**
		 *
		 * @param target 目测终点物
		 * @param eyesoucreEye目测起源物
		 * @return
		 *
		 */
		private static function isTargetInEye(target : SceneRole, soucreEye : SceneRole = null) : Boolean
		{
			if (soucreEye == null)
				soucreEye = MainRoleManager.actor;
			if (target)
			{
				var farDistance : int = SceneManager.viewDistance; //可选择距离
				var dist : Number = MathUtil.getDistanceNoSqrt(soucreEye.x, soucreEye.z, target.x, target.z);
				if (dist < farDistance * farDistance)
				{
					return true;
				}
			}
			return false;
		}

		public static function isTargetInMyEye(target : SceneRole) : Boolean
		{
			return isTargetInEye(target);
		}
	}
}
