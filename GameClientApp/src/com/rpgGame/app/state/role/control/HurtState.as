package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.info.fight.FightSingleHurt;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
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
		/** 伤害状态引用 **/
		private var _stateReference : HurtStateReference;
		private var _count : int;
		private var _effectTween : TweenLite;
		
		/** 伤害延迟 TweenLite.delayedCall **/
		private var _delayHurtTws : Dictionary;

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
//			var info : SpellResultInfo = _stateReference.info;
			var hurtVo : FightHurtResult = _stateReference.hurtVo;
			var i : int = 0;
			while (hurtVo.hurtList.length)
			{
				var sVo : FightSingleHurt = hurtVo.hurtList.shift();

				var hurtAmount : int = 0;
				var hurtType : uint = 0;
				if (sVo)
				{
					hurtType = sVo.hurtType;
					hurtAmount = sVo.hurtAmount;
				}
				_count++;
				
//				if(hurtVo.hurtSpacing > 0)
//				{
					var tw : TweenLite = TweenLite.delayedCall(hurtVo.hurtSpacing * i * 0.001, showSingleHurt, [_count, hurtVo, hurtType, hurtAmount]);
					_delayHurtTws[_count] = tw;
//				}
//				else
//				{
//					showSingleHurt(_count, hurtVo, hurtType, hurtAmount);//立马飘字
//				}
				i++;
			}
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

		private function showSingleHurt(key : int, hortVo:FightHurtResult, hurtType : uint, hurtAmount : int) : void
		{
			var tw : TweenLite = _delayHurtTws[key];
			tw.kill();
			tw = null;
			_delayHurtTws[key] = null;
			delete _delayHurtTws[key];
			
			playEffect();
			SpellHitHelper.showSingleHurt(hortVo, hortVo.atkorID, hortVo.targetID, hurtType, hurtAmount);
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
