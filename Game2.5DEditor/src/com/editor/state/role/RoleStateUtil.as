package com.editor.state.role
{
	import com.editor.cfg.AvatarResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.enum.SpellBlinkType;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.fight.spell.SpellAnimationHelper;
	import com.editor.fight.spell.SpellHitHelper;
	import com.editor.manager.AvatarPreviewManager;
	import com.editor.manager.DataStructuresManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.BlinkStateReference;
	import com.editor.state.role.action.RunStateReference;
	import com.editor.state.role.control.BeatMoveStateReference;
	import com.editor.state.role.control.BlinkMoveStateReference;
	import com.editor.state.role.control.WalkMoveStateReference;
	import com.game.engine3D.utils.MathUtil;

	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;

	import gs.TweenLite;

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
		public static const MAX_WALK_SPEED : int = 2000;

		/**
		 * 基准移动速度
		 */
		public static const BENCHMARK_MOVE_SPEED : int = 10;

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
		public static function walk(role : SceneRole, posx : Number, posy : Number, spacing : int = 0, data : Object = null, onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : void
		{
			if (role == null)
				return;
			var position : Vector3D = new Vector3D(posx, role.y, posy, role.position.w);
			walkToPos(role, position, spacing, data, onArrive, onThrough, onUpdate);
		}

		/**
		 * 行走到点，主要用这个
		 * @param role
		 * @param gridPos
		 * @param onArrive
		 *
		 */
		public static function walkToPos(role : SceneRole, pos : Vector3D, spacing : int = 0, data : Object = null, onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : void
		{
			if (!role || !role.usable)
				return;
			doWalkToPos(role, pos, spacing, data, onArrive, onThrough, onUpdate);
		}

		public static function doWalkToPos(role : SceneRole, pos : Vector3D, spacing : int = 0, data : Object = null, onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : Boolean
		{
			if (!role || !role.usable)
				return false;
			if (role.isMainChar)
			{
				var nowTime : int = getTimer();
				RoleStateUtil.lastWalkTime = nowTime;
			}
			var moveSpeed : int = (role.data as RoleData).moveSpeed;
			if (moveSpeed > MAX_WALK_SPEED)
				moveSpeed = MAX_WALK_SPEED;
			var ref : WalkMoveStateReference = role.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
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
			role.stateMachine.transition(RoleStateType.CONTROL_WALK_MOVE, ref);
			return role.stateMachine.isWalkMoving;
		}

		private static function onWalkArrivefunction(onArrive : Function, ref : WalkMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
			if (onArrive != null)
				onArrive(ref);
		}

		private static function onWalkReady(ref : WalkMoveStateReference) : void
		{
			updateRoleBaseWalkActionSpeed(ref.owner as SceneRole);
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		public static function updateRoleBaseWalkActionSpeed(role : SceneRole) : void
		{
			var baseWalkActionSpeed : int = RoleData.DEFAULT_BASE_WALK_ACTION_SPEED;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarResConfigName);
			if (tabel)
			{
				var desc : ConfigDesc = tabel.getConfigDesc();
				var datas : Array = ConfigData.getCfgByFieldValue(desc, desc.majorKey, (role.data as RoleData).avatarInfo.bodyResID);
				if (datas.length > 0)
				{
					var avatarResConfig : AvatarResConfig = datas[0] as AvatarResConfig;
					baseWalkActionSpeed = avatarResConfig.mBaseWalkActionSpeed > 0 ? avatarResConfig.mBaseWalkActionSpeed : RoleData.DEFAULT_BASE_WALK_ACTION_SPEED;
				}
			}
			(role.data as RoleData).baseWalkActionSpeed = baseWalkActionSpeed;
		}

		private static function onWalkUnable(ref : WalkMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
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
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkEnd(ref : WalkMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkSync(ref : WalkMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
				if (ref.path.length > 1)
				{
				}
			}
		}

		private static function onWalkMove(ref : WalkMoveStateReference) : void
		{
			var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
			runRef.setParams(ref.speed, ((ref.owner as SceneRole).data as RoleData).baseWalkActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkThrough(onThrough : Function, ref : WalkMoveStateReference) : void
		{
			var runRef : RunStateReference = (ref.owner as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
			runRef.setParams(ref.speed, ((ref.owner as SceneRole).data as RoleData).baseWalkActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
			else
			{
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

		private static function onBeatMove(ref : BeatMoveStateReference) : void
		{
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_BEAT_BACK);
		}

		public static function blinkToPos(role : SceneRole, statusType : String, atkorPos : Point, targetPos : Point, speed : int, blinkHeight : int, soarFrameTime : int, hitFrameTime : int, spellInfo : ReleaseSpellInfo) : void
		{
			var moveRef : BlinkMoveStateReference = role.stateMachine.getReference(BlinkMoveStateReference) as BlinkMoveStateReference;
			moveRef.setParams(atkorPos, targetPos, speed, blinkHeight, soarFrameTime, hitFrameTime, spellInfo, AvatarPreviewManager.animationSpeed);
			moveRef.data = spellInfo;
			moveRef.onAfterExecute(onBlinkExecute, statusType, spellInfo);
			moveRef.onHitFrame(onBlinkMoveHitFrame, role);
			role.stateMachine.transition(RoleStateType.CONTROL_BLINK_MOVE, moveRef);

			var hurtDelay : int = Math.max(spellInfo.releaseDelayTime, moveRef.totalTime);
			if (hurtDelay > 0)
				TweenLite.delayedCall(hurtDelay * 0.001, SpellHitHelper.addSpellHitEffect, [spellInfo, role.stateMachine.isRiding]);
			else
				SpellHitHelper.addSpellHitEffect(spellInfo, role.stateMachine.isRiding);
		}

		private static function onBlinkExecute(statusType : String, spellInfo : ReleaseSpellInfo, ref : BlinkMoveStateReference) : void
		{
			if (!spellInfo.atkor || !spellInfo.atkor.usable)
				return;
			var actionRef : BlinkStateReference = spellInfo.atkor.stateMachine.getReference(BlinkStateReference) as BlinkStateReference;
			actionRef.setParams(statusType, spellInfo.blinkType == SpellBlinkType.TIAO_PI, ref.totalTime, ref.soarFrameTime, ref.hitFrameTime, ref.throwDelayTime, AvatarPreviewManager.animationSpeed);
			actionRef.data = spellInfo;
			spellInfo.atkor.stateMachine.transition(RoleStateType.ACTION_BLINK, actionRef, true);
			SpellAnimationHelper.addKnifeLightEffect(ref.spellInfo);
			SpellAnimationHelper.addSelfEffect(ref.spellInfo);
		}

		private static function onBlinkMoveHitFrame(role : SceneRole, ref : BlinkMoveStateReference) : void
		{
			var spellInfo : ReleaseSpellInfo = ref.data as ReleaseSpellInfo;
			SpellAnimationHelper.addDestEffect(ref.targetPos.x, ref.targetPos.y, ref.rotationY, role.stateMachine.isRiding, spellInfo);
		}
	}
}
