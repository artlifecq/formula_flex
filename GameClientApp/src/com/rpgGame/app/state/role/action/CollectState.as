package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;

	import away3d.animators.transitions.CrossfadeTransition;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色采集状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-06 下午3:25:12
	 *
	 */
	public class CollectState extends ActionState
	{
		private var _stateReference : CollectStateReference;
		private var _totalTimeTween : TweenLite;
		private var _animatTween : TweenLite;
		private var _statusType : String;
		private var _repeat : int;
		private var _collectFinish : Boolean;

		public function CollectState()
		{
			super(RoleStateType.ACTION_COLLECT);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_collectFinish = false;
				_stateReference = null;
				if (_ref is CollectStateReference)
				{
					_stateReference = _ref as CollectStateReference;
				}
				else
					throw new Error("采集状态引用必须是CollectStateReference类型！");
			}
		}

		override public function pause() : void
		{
			super.pause();
			if (_animatTween)
				_animatTween.pause();
			syncAnimation(true);
		}

		override public function resume() : void
		{
			super.resume();
			if (_animatTween)
				_animatTween.resume();
			syncAnimation(false);
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(_statusType, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
					render.visible = true;
					render.repeat = _repeat;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = false;
					render.repeat = _repeat;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = _repeat;
					render.setStatus(_statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = false;
					break;
				case RenderUnitType.EFFECT:
					render.visible = false;
					break;
				case RenderUnitType.HURT:
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			if (_machine && !_machine.isDisposed)
			{
				if (_totalTimeTween)
				{
					_totalTimeTween.kill();
					_totalTimeTween = null;
				}
				if (_animatTween)
				{
					_animatTween.kill();
					_animatTween = null;
				}
				startCollect();
				if (_stateReference.time > 0)
					_totalTimeTween = TweenLite.delayedCall(_stateReference.time * 0.001, onEndCollect);
				else
					onEndCollect();
			}
		}

		private function startCollect() : void
		{
			_statusType = RoleActionType.COLLECT_START;
			_repeat = 1;
			syncAnimation(false, 0);

			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
			if (totalFrameTm > 0)
				_animatTween = TweenLite.delayedCall(totalFrameTm * 0.001, onCollecting);
			else
				onCollecting();
		}

		private function onCollecting() : void
		{
			_statusType = RoleActionType.COLLECT;
			_repeat = 0;
			syncAnimation(false, 0);
			if (_animatTween)
			{
				_animatTween.kill();
				_animatTween = null;
			}
		}

		private function onEndCollect() : void
		{
			_statusType = RoleActionType.COLLECT_END;
			_repeat = 1;
			syncAnimation(false, 0);

			if (_totalTimeTween)
			{
				_totalTimeTween.kill();
				_totalTimeTween = null;
			}
			if (_animatTween)
			{
				_animatTween.kill();
				_animatTween = null;
			}
			_stateReference.end();
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
			if (totalFrameTm > 0)
				_animatTween = TweenLite.delayedCall(totalFrameTm * 0.001, onPlayCollectCmp);
			else
				onPlayCollectCmp();
		}

		private function onPlayCollectCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				stopCollect();
				if ((_machine as RoleStateMachine).isPrewarWaiting)
					transition(RoleStateType.ACTION_PREWAR);
				else
					transition(RoleStateType.ACTION_IDLE);
			}
		}

		private function stopCollect() : void
		{
			_collectFinish = true;
			if (_totalTimeTween)
			{
				_totalTimeTween.kill();
				_totalTimeTween = null;
			}
			if (_animatTween)
			{
				_animatTween.kill();
				_animatTween = null;
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopCollect();
			_collectFinish = false;
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isBingDong)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_DEATH)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_DEAD_LAUNCH)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_TRAIL)
			{
				return true;
			}
			else if (nextState.type == RoleStateType.ACTION_IDLE)
			{
				if (!force && !_collectFinish)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_PREWAR)
			{
				if (!force && !_collectFinish)
					return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				if (!force && !_collectFinish)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_collectFinish = false;
			if (_totalTimeTween)
			{
				_totalTimeTween.kill();
				_totalTimeTween = null;
			}
			if (_animatTween)
			{
				_animatTween.kill();
				_animatTween = null;
			}
			_statusType = null;
			_repeat = 0;
			_stateReference = null;
			super.dispose();
		}
	}
}
