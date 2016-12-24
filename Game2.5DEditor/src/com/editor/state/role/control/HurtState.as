package com.editor.state.role.control
{
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleStateType;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.scene.SceneRole;
	import com.game.engine3D.scene.render.RenderUnit3D;

	import flash.utils.Dictionary;

	import gs.TweenLite;

	/**
	 *
	 * 场景角色伤害状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-13 下午5:25:12
	 *
	 */
	public class HurtState extends ControlState
	{
		private var _stateReference : HurtStateReference;
		private var _delayHurtTws : Dictionary;
		private var _count : int;
		private var _effectTween : TweenLite;

		public function HurtState()
		{
			super(RoleStateType.CONTROL_HURT);
			_count = 0;
			_delayHurtTws = new Dictionary();
		}

		override public function execute() : void
		{
			super.execute();
			if (_machine && !_machine.isDisposed)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is HurtStateReference)
					{
						_stateReference = _ref as HurtStateReference;
					}
					else
						throw new Error("场景角色伤害状态引用必须是HurtStateReference类型！");
				}
			}
		}

		override public function afterExecute() : void
		{
			super.afterExecute();
			//						var info : ReleaseSpellInfo = _stateReference.info;
			//						var hurtVo : FightHurtResult = _stateReference.hurtVo;
			//						var i : int = 0;
			//						while (hurtVo.hurtList.length)
			//						{
			//							var sVo : FightSingleHurt = hurtVo.hurtList.shift();
			//
			//							var hurtAmount : int = 0;
			//							var hurtType : uint = 0;
			//							if (sVo)
			//							{
			//								hurtType = sVo.hurtType;
			//								hurtAmount = sVo.hurtAmount;
			//							}
			//							var finalHp : int = hurtVo.curLife - hurtVo.remainHurtAmount;
			//							_count++;
			//							var tw : TweenLite = TweenLite.delayedCall(0.3 * i, showSingleHurt, [_count, info, hurtVo.attackerId, hurtVo.roleID, hurtType, hurtAmount, finalHp]);
			//							_delayHurtTws[_count] = tw;
			//							i++;
			//						}
			playEffect();
		}

		private function playEffect() : void
		{
			if (_effectTween)
			{
				_effectTween.kill();
				_effectTween = null;
			}
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
						render.setIndependentColor(5, 5, 5, 1);
						break;
				}
			});

			_effectTween = TweenLite.delayedCall(0.1, onEffectComplete);
		}

		private function showSingleHurt(key : int, info : ReleaseSpellInfo, attackerId : Number, hurtRoleID : Number, hurtType : uint, hurtAmount : int, finalHp : int = 0) : void
		{
			var tw : TweenLite = _delayHurtTws[key];
			tw.kill();
			tw = null;
			_delayHurtTws[key] = null;
			delete _delayHurtTws[key];

			//SpellHitHelper.showSingleHurt(info, attackerId, hurtRoleID, hurtType, hurtAmount, finalHp);
		}

		private function clearDelayHurtTws() : void
		{
			_count = 0;
			for (var key : * in _delayHurtTws)
			{
				var tw : TweenLite = _delayHurtTws[key];
				tw.kill();
				tw = null;
				_delayHurtTws[key] = null;
				delete _delayHurtTws[key];
			}
			_stateReference = null;
		}

		private function onEffectComplete() : void
		{
			stopEffect();
		}

		private function stopEffect() : void
		{
			if (_effectTween)
			{
				_effectTween.kill();
				_effectTween = null;
			}
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
						render.restoreColor();
						break;
				}
			});
		}

		override public function leave() : void
		{
			super.leave();
		}

		override public function dispose() : void
		{
			clearDelayHurtTws();
			if (_effectTween)
			{
				_effectTween.kill();
				_effectTween = null;
			}
			super.dispose();
		}
	}
}
