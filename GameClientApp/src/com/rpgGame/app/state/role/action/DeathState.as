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
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
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
	 * 场景角色死亡状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-18 下午5:25:12
	 *
	 */
	public class DeathState extends ActionState
	{
		private var _corrodeMethodData : MethodData;
		private var _corrodeTween : TweenLite;
		private var _valueObj : Object;
		private var _colorMultiplier : Number = 0.33;

		public function DeathState()
		{
			super(RoleStateType.ACTION_DEATH);
		}

		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_corrodeTween)
				{
					_corrodeTween.kill();
					_corrodeTween = null;
				}
			}
		}

		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			super.playAnimation(role, render, isFreeze, time, speedRatio);

			var statusType : String = RoleActionType.getActionType(RoleActionType.DIE, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = 1;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					break;
				case RenderUnitType.MOUNT:
					render.repeat = 1;
					render.setStatus(RoleActionType.DIE, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
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
			if (_machine && !_machine.isDisposed)
			{
				super.afterExecute();
				var state : IState = _machine.getLastState(ActionState);
				if (state)
					syncAnimation(false, 0);
				else
					syncAnimation(false, int.MAX_VALUE);
				var role : SceneRole = _machine.owner as SceneRole;
				if (!role)
					return;

				if (role.type == SceneCharType.BIAO_CHE  || role.type == SceneCharType.FAMILY_WAR_FLAG)
				{
					stopCorrode();
				}
				else
				{
					if(role.type == SceneCharType.MONSTER)
					{
						var monsterData:MonsterData = role.data as MonsterData;
						if(monsterData)
						{
							if(CountryWarCfgData.isMonsterHoly(monsterData.modelID))
							{
								stopCorrode();
								return;
							}
						}
					}
					_valueObj = {alpha: 1};
					var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
					var totalFrameTm : uint = (bodyAp ? bodyAp.totalDuration : 0);
					if (totalFrameTm > 0)
					{
						if (role.type != SceneCharType.PLAYER)
						{
							if (RoleStateUtil.deathStateEffectType == RoleStateUtil.DEATH_STATE_EFFECT_CORRODE)
							{
								if (!_corrodeMethodData)
									GlobalTexture.addTexture(ClientConfig.getDynTexture("corrode"), onCorrodeTextureComplete);
								_corrodeTween = TweenLite.delayedCall(totalFrameTm * 0.001, onRoleDiedDelay);
							}
							else
							{
								_corrodeTween = TweenLite.delayedCall((totalFrameTm + 2000) * 0.001, onRoleDiedDelay);
							}
						}
					}
					else
						stopCorrode();
				}
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

		override public function leave() : void
		{
			super.leave();
			stopCorrode();
		}

		private function stopCorrode() : void
		{
			if (_machine && !_machine.isDisposed)
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
			else if (nextState.type == RoleStateType.ACTION_DEATH)
			{
				return false;
			}
			else if (nextState.type == RoleStateType.ACTION_TRAIL)
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
			super.dispose();
		}
	}
}
