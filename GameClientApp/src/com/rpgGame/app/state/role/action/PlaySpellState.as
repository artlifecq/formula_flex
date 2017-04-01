package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
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
	 * 场景角色技能播放动作状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-24 下午3:25:12
	 *
	 */
	public class PlaySpellState extends ActionState
	{
		private var _stateReference : PlayActionStateReference;
		private var _statusType : String;
		
		private var _totalFrameTween : TweenLite;

		public function PlaySpellState()
		{
			super(RoleStateType.ACTION_PLAY_SPELL);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;

				if (_ref is PlayActionStateReference)
				{
					_stateReference = _ref as PlayActionStateReference;
				}
				else
					throw new Error("播放动作状态引用必须是PlayActionStateReference类型！");

				_statusType = _stateReference.statusType;
			}
		}

		override public function pause() : void
		{
			super.pause();
			syncAnimation(true);
			if (_totalFrameTween)
				_totalFrameTween.pause();
		}

		override public function resume() : void
		{
			super.resume();
			syncAnimation(false);
			if (_totalFrameTween)
				_totalFrameTween.resume();
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(_statusType, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.setStatus(_statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
				case RenderUnitType.SPELL_SELF_EFFECT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.play(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = _stateReference.repeat;
					render.play(time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.HURT:
					break;
			}
		}
		
		override public function setAnimationSpeed(role : BaseRole, render : RenderUnit3D, speedRatio : Number = 1) : void
		{
			super.setAnimationSpeed(role, render, speedRatio);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
				case RenderUnitType.KNIFE_LIGHT:
					render.animateSpeed = speedRatio;
					break;
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			syncAnimation(false, _stateReference.time);
			
			if (_machine && !_machine.isDisposed)
			{
				var totalFrameTm : uint = 0;
				if (_statusType)
				{
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					totalFrameTm = bodyAp ? bodyAp.totalDuration : 200;
				}
				
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				
				if (totalFrameTm > 0)
				{
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
				}
				else
				{
					onTotalFrameCmp();
				}
			}
		}
		
		/**
		 * 非位移技能单个攻击动作结束回调（有的会有多个动作连续播放）
		 * @param info
		 *
		 */
		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
			
				transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
			}
		}

		override public function dispose() : void
		{
			_stateReference = null;
			_statusType = null;
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			super.dispose();
		}
	}
}
