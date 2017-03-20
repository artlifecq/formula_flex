package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.loader.GlobalTexture;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.MethodData;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.EffectMethodUtil;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.DeadLaunchMoveStateReference;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import away3d.animators.transitions.CrossfadeTransition;
	import away3d.materials.methods.CorrodeMethod;
	
	import gs.TweenLite;
	import gs.easing.Linear;

	/**
	 *
	 * 场景角色死亡击飞状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-11 下午5:25:12
	 *
	 */
	public class DeadLaunchState extends ActionState
	{
		private var _stateReference : DeadLaunchStateReference;
		private var _corrodeMethodData : MethodData;
		private var _corrodeTween : TweenLite;
		private var _valueObj : Object;
		private var _colorMultiplier : Number = 0.33;
		private var _statusType : String;
		private var _isLaunching : Boolean;

		public function DeadLaunchState()
		{
			super(RoleStateType.ACTION_DEAD_LAUNCH);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_stateReference = null;
				if (_ref is DeadLaunchStateReference)
				{
					_stateReference = _ref as DeadLaunchStateReference;
					transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
					if (_corrodeTween)
					{
						_corrodeTween.kill();
						_corrodeTween = null;
					}
					_isLaunching = _stateReference.launchHeight > 0;
					if (_isLaunching)
						_statusType = RoleActionType.DIE;
					else
						_statusType = RoleActionType.HIT;
				}
				else
					throw new Error("死亡击飞状态引用必须是DeadLaunchStateReference类型！");
			}
		}

		private function onCorrodeTextureComplete(globalTexture : GlobalTexture) : void
		{
			GlobalTexture.removeTextureCallBack(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
			if (_machine && !_machine.isDisposed)
			{
				if (globalTexture.texture)
				{
					var corrodeMethod : CorrodeMethod = EffectMethodUtil.createCorrodeMethod(globalTexture.texture);
					_corrodeMethodData = new MethodData(corrodeMethod);
					var role : SceneRole = _machine.owner as SceneRole;
					role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
					{
						switch (render.type)
						{
							case RenderUnitType.BODY:
							case RenderUnitType.HAIR:
							case RenderUnitType.WEAPON:
							case RenderUnitType.DEPUTY_WEAPON:
							case RenderUnitType.MOUNT:
								render.addMethod(_corrodeMethodData);
								break;
						}
					});
					corrodeMethod.corrodeAlpha = 1 - _valueObj.alpha;
				}
			}
		}

		private function onRoleDiedDelay() : void
		{
			if (_corrodeTween)
			{
				_corrodeTween.kill();
				_corrodeTween = null;
			}
			var role : SceneRole = _machine.owner as SceneRole;
			if (RoleStateUtil.deathStateEffectType == RoleStateUtil.DEATH_STATE_EFFECT_CORRODE)
			{
				role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.castsShadows = false;
							break;
					}
				});
				if (_corrodeMethodData)
				{
					role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
					{
						switch (render.type)
						{
							case RenderUnitType.BODY:
							case RenderUnitType.HAIR:
							case RenderUnitType.WEAPON:
							case RenderUnitType.DEPUTY_WEAPON:
							case RenderUnitType.MOUNT:
								render.addMethod(_corrodeMethodData);
								break;
						}
					});
					CorrodeMethod(_corrodeMethodData.method).corrodeAlpha = 1 - _valueObj.alpha;
				}
				_corrodeTween = TweenLite.to(_valueObj, 2, {alpha: 0, onComplete: stopCorrode, onUpdate: function() : void
				{
					if (_corrodeMethodData)
						CorrodeMethod(_corrodeMethodData.method).corrodeAlpha = 1 - _valueObj.alpha;
				}, ease: Linear.easeNone});
			}
			else if (RoleStateUtil.deathStateEffectType == RoleStateUtil.DEATH_STATE_EFFECT_COLOR)
			{
				_corrodeTween = TweenLite.to(_valueObj, 0.5, {alpha: _colorMultiplier, onComplete: stopColorEffect, onUpdate: function() : void
				{
					role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
					{
						switch (render.type)
						{
							case RenderUnitType.BODY:
							case RenderUnitType.HAIR:
							case RenderUnitType.WEAPON:
							case RenderUnitType.DEPUTY_WEAPON:
							case RenderUnitType.MOUNT:
								render.setIndependentColor(_valueObj.alpha, _valueObj.alpha, _valueObj.alpha, 1);
								break;
						}
					});
				}, ease: Linear.easeNone});
			}
			else
			{
				stopCorrode();
			}
		}

		private function stopColorEffect() : void
		{
			_valueObj = {alpha: 1};
			var role : SceneRole = _machine.owner as SceneRole;
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.castsShadows = false;
						break;
				}
			});
			_corrodeTween = TweenLite.to(_valueObj, 0.5, {alpha: 0, onComplete: stopCorrode, onUpdate: function() : void
			{
				role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
				{
					switch (render.type)
					{
						case RenderUnitType.BODY:
						case RenderUnitType.HAIR:
						case RenderUnitType.WEAPON:
						case RenderUnitType.DEPUTY_WEAPON:
						case RenderUnitType.MOUNT:
							render.setIndependentColor(_colorMultiplier, _colorMultiplier, _colorMultiplier, _valueObj.alpha);
							break;
					}
				});
			}, ease: Linear.easeNone});
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
					render.repeat = 1;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(_statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
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
			syncAnimation(false, 0);

			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
				if (role.type == SceneCharType.BIAO_CHE || role.type == SceneCharType.FAMILY_WAR_FLAG)
				{
					stopCorrode();
				}
				else
				{
					_valueObj = {alpha: 1};
					var ref : DeadLaunchMoveStateReference;
					if (_isLaunching)
					{
						var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
						var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
						if (totalFrameTm > 0)
						{
							var totalTime : int = _stateReference.beatDistance / _stateReference.beatSpeed * 1000;
							if (totalFrameTm > totalTime)
								totalTime = totalFrameTm;
							if (RoleStateUtil.deathStateEffectType == RoleStateUtil.DEATH_STATE_EFFECT_CORRODE)
							{
								if (!_corrodeMethodData)
								{
									GlobalTexture.addTexture(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
								}
								TweenLite.delayedCall(totalTime * 0.001, onRoleDiedDelay);
							}
							else
							{
								TweenLite.delayedCall((totalTime + 2000) * 0.001, onRoleDiedDelay);
							}

							ref = _machine.getReference(DeadLaunchMoveStateReference) as DeadLaunchMoveStateReference;
							ref.setParams(_stateReference.atkorPos, _stateReference.launchHeight, _stateReference.beatDistance, _stateReference.beatSpeed);
							transition(RoleStateType.CONTROL_DEAD_LAUNCH_MOVE, ref);
						}
						else
							stopCorrode();
					}
					else
					{
						ref = _machine.getReference(DeadLaunchMoveStateReference) as DeadLaunchMoveStateReference;
						ref.setParams(_stateReference.atkorPos, 0, _stateReference.beatDistance, _stateReference.beatSpeed);
						transition(RoleStateType.CONTROL_DEAD_LAUNCH_MOVE, ref);
					}
				}
			}
		}

		private function roleDied() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
				if(role.type != SceneCharType.PLAYER)
				{
					SceneRoleManager.getInstance().removeSceneRole(role);
				}
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopCorrode();
		}

		private function stopCorrode() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if (_isLaunching)
				{
					var role : SceneRole = _machine.owner as SceneRole;
					role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
					{
						switch (render.type)
						{
							case RenderUnitType.BODY:
							case RenderUnitType.HAIR:
							case RenderUnitType.WEAPON:
							case RenderUnitType.DEPUTY_WEAPON:
							case RenderUnitType.MOUNT:
								render.removeMethod(_corrodeMethodData);
								break;
						}
					});
					GlobalTexture.removeTextureCallBack(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
					if (_corrodeTween)
					{
						_corrodeTween.kill();
						_corrodeTween = null;
					}
					roleDied();
				}
			}
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == RoleStateType.ACTION_IDLE)
			{
				if (force)
					return true;
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_ATTACK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_HIT)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_COLLECT)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BEAT_BACK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_BLINK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_DEAD_LAUNCH)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_FALL)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_GETUP)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_WALK)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_RUN)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_JUMP)
			{
				return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			GlobalTexture.removeTextureCallBack(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
			if (_corrodeMethodData)
			{
				_corrodeMethodData.method.dispose();
				_corrodeMethodData = null;
			}
			if (_corrodeTween)
			{
				_corrodeTween.kill();
				_corrodeTween = null;
			}
			_stateReference = null;
			super.dispose();
		}
	}
}
