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
	import gs.easing.Cubic;

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
		
		public var hitTime:Number;
		public var upTime:Number;
		public var flyTime:Number;
		public var fallTime:Number;
		
		private var _stateReference : FlyUpStateReference;
		
		override public function execute() : void
		{
			super.execute();
			_stateReference = null;
			if (_ref is FlyUpStateReference)
			{
				_stateReference = _ref as FlyUpStateReference;
				
//				FLY_HEIGHT = Number(_stateReference.buffData.clientData.h);
				hitTime = 1000;//Number(_stateReference.buffData.clientData.hit);
				upTime = 700;//Number(_stateReference.buffData.clientData.up);
				flyTime = 500;//Number(_stateReference.buffData.clientData.stay);
				fallTime = 200;//Number(_stateReference.buffData.clientData.down);
				
				var startTime:Number = _stateReference.buffData.totalTime - _stateReference.buffData.disappearTime;
				if(startTime>0)
				{
					if(startTime > upTime + flyTime + fallTime + hitTime)
					{
						hitTime = 0;
						upTime = 0;
						flyTime = 0;
						fallTime = 0;
					}
					else if(startTime > upTime + flyTime + hitTime)
					{
						hitTime = 0;
						upTime = 0;
						flyTime = 0;
						fallTime = hitTime + upTime + flyTime + fallTime - startTime;
					}
					else if(startTime > upTime + hitTime)
					{
						hitTime = 0;
						upTime = 0;
						flyTime = hitTime + upTime + flyTime - startTime;
					}
					else if(startTime > hitTime)
					{
						hitTime = 0;
						upTime = upTime + hitTime - startTime;
					}
					else
					{
						hitTime = hitTime - startTime;
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
				
				doHit();
			}
			else
				throw new Error("击飞上升状态引用必须是JumpRiseStateReference类型！");
		}
		
		private function changeAction(actionType:String,repeat:int=1):void
		{
			(_machine.owner as BaseRole).forEachRenderUnit(eachPlayAnimation,[actionType,repeat]);
		}
		
		private function eachPlayAnimation(actionType:String,repeat:int,role : BaseRole, render : RenderUnit3D) : void
		{
			if (role && render)
				playAnimation(role, render,actionType,repeat);
		}
		
		private function playAnimation(role : BaseRole, render : RenderUnit3D,actionType:String,repeat:int, isFreeze : Boolean = false, time : int = 0, speedRatio : Number = 1) : void
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
		
		private function doHit():void
		{
			if (_machine && !_machine.isDisposed)
			{
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {offsetZ: true});
				changeAction(RoleActionType.HIT,1);
				var totalTime : int = hitTime;
				if(totalTime > 0)
				{
					TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {offsetZ: FLY_HEIGHT, ease: Cubic.easeOut, overwrite: 0, onComplete: doFly});
				}
				else
				{
					doFly();
				}
			}
		}
		
		/**
		 * 上升阶段 
		 * 
		 */		
		private function doFly() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				changeAction(RoleActionType.FLY,1);
				var totalTime : int = upTime;
				if(totalTime > 0)
				{
					TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {offsetZ: FLY_HEIGHT, ease: Cubic.easeOut, overwrite: 0, onComplete: onFlyUpComplete});
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
				changeAction(RoleActionType.FLY_HIT,1);
				var totalTime : int = flyTime;
				if(totalTime > 0)
				{
					TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {offsetZ: FLY_HEIGHT, ease: Cubic.easeIn, overwrite: 0, onComplete: onFlyComplete});
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
				changeAction(RoleActionType.DROPOUT,1);
				var totalTime : int = fallTime;
				if(totalTime > 0)
				{
					TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {offsetZ: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onFlyFallComplete});
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
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {offsetZ: true});
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
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(FlyUpState);
		}
		
	}
}