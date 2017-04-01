package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;
	
	import away3d.animators.transitions.CrossfadeTransition;
	
	import gs.TweenLite;

	public class FlyUpState extends BuffState
	{
		public function FlyUpState()
		{
			super(RoleStateType.CONTROL_FLY_UP);
		}
		
		/**
		 * 击飞高度
		 */
		public static var FLY_HEIGHT : int = 0;
		
		public var upTime:Number;
		public var flyTime:Number;
		public var fallTime:Number;
		
		private var _upTween:TweenLite;
		private var _flyTween:TweenLite;
		private var _fallTween:TweenLite;
		
		private var _stateReference : FlyUpStateReference;
		
		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is FlyUpStateReference)
			{
				_stateReference = _ref as FlyUpStateReference;
				
				upTime = Number(_stateReference.buffData.clientData.up);
				flyTime = Number(_stateReference.buffData.clientData.stay);
				fallTime = Number(_stateReference.buffData.clientData.down);
				
				var startTime:Number = _stateReference.buffData.totalTime - _stateReference.buffData.disappearTime;
				if(startTime>0)
				{
					if(startTime > upTime + flyTime + fallTime)
					{
						upTime = 0;
						flyTime = 0;
						fallTime = 0;
					}
					else if(startTime > upTime + flyTime)
					{
						upTime = 0;
						flyTime = 0;
						fallTime = upTime + flyTime + fallTime - startTime;
					}
					else if(startTime > upTime)
					{
						upTime = 0;
						flyTime = upTime + flyTime - startTime;
					}
					else
					{
						upTime = upTime - startTime;
					}
				}
				
				var fixDirection : Boolean = false;
				if ((_machine.owner as SceneRole).data is RoleData)
				{
					fixDirection = ((_machine.owner as SceneRole).data as RoleData).fixDirection;
				}
				if (!fixDirection)
				{
					if(_stateReference.buffData.srcRole)
					{
						var atkorX : int = _stateReference.buffData.srcRole.x;
						var atkorY : int = _stateReference.buffData.srcRole.z;
						(_machine.owner as SceneRole).faceToGround(atkorX, atkorY, 0);
					}
				}
				
				doFly();
			}
			else
				throw new Error("击飞上升状态引用必须是JumpRiseStateReference类型！");
		}
		
		/**
		 * 上升阶段 
		 * 
		 */		
		private function doFly() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if(_upTween)
				{
					_upTween.kill();
					_upTween = null;
				}
				
				changeAction(RoleActionType.FLY);
				
				if(upTime > 0)
				{
					_upTween = TweenLite.delayedCall(upTime * 0.001,onFlyUpComplete);
				}
				else
				{
					onFlyUpComplete();
				}
			}
		}
		
		/**
		 * 下降阶段 
		 * 
		 */		
		private function onFlyUpComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if(_flyTween)
				{
					_flyTween.kill();
					_flyTween = null;
				}
				changeAction(RoleActionType.FLY_HIT);
				
				if(flyTime > 0)
				{
					_flyTween = TweenLite.delayedCall(flyTime * 0.001,onFlyComplete);
				}
				else
				{
					onFlyComplete();
				}
			}
		}
		
		/**
		 * 准备落地了 
		 * 
		 */		
		private function onFlyComplete() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if(_fallTween)
				{
					_fallTween.kill();
					_fallTween = null;
				}
				changeAction(RoleActionType.DROPOUT);
				if(fallTime > 0)
				{
					_fallTween = TweenLite.delayedCall(fallTime * 0.001, onFlyFallComplete);
				}
				else
				{
					onFlyFallComplete();
				}
			}
		}
		
		private function onFlyFallComplete():void
		{
			if (_machine && !_machine.isDisposed)
			{
				removeSelf();
				transition(RoleStateType.ACTION_GETUP);
			}
		}
		
		private function changeAction(actionType:String,repeat:int=1,time:int=0):void
		{
			(_machine.owner as BaseRole).forEachRenderUnit(eachPlayAnimation,[actionType,repeat,time]);
		}
		
		private function eachPlayAnimation(actionType:String,repeat:int,time:int,role : BaseRole, render : RenderUnit3D) : void
		{
			if (role && render)
				playAnimation(role, render,actionType,repeat,false,time);
		}
		
		private function playAnimation(role : BaseRole, render : RenderUnit3D,actionType:String,repeat:int, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			var statusType : String = actionType;
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.repeat = repeat;
					render.setStatus(statusType, new CrossfadeTransition(0.2), time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = false;
					break;
				case RenderUnitType.EFFECT:
					render.repeat = 0;
					render.setStatus(RoleActionType.IDLE, null, time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}
		
		override public function leave() : void
		{
			stopFly();
			super.leave();
		}
		
		/**
		 * 停止浮空，把角色的高度重置为0，清理计时器 
		 * 
		 */		
		private function stopFly() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				(_machine.owner as SceneRole).offsetZ = 0;
			}
			if(_fallTween)
			{
				_fallTween.kill();
				_fallTween = null;
			}
			if(_flyTween)
			{
				_flyTween.kill();
				_flyTween = null;
			}
			if(_upTween)
			{
				_upTween.kill();
				_upTween = null;
			}
		}
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if((_machine as RoleStateMachine).isStiff)
			{
				return false;
			}
			return true;
		}
		
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
		
		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
			if(_fallTween)
			{
				_fallTween.kill();
				_fallTween = null;
			}
			if(_flyTween)
			{
				_flyTween.kill();
				_flyTween = null;
			}
			if(_upTween)
			{
				_upTween.kill();
				_upTween = null;
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(FlyUpState);
		}
		
	}
}