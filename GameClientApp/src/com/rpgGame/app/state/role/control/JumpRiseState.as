package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.action.TrailStateReference;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	import gs.easing.Cubic;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景角色跳跃上升状态
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-01 上午11:15:12
	 *
	 */
	public class JumpRiseState extends ControlState
	{
		/**
		 * 跳跃高度
		 */
		public static var JUMP_HEIGHT : int = 100;
		/**
		 * 二级跳跃高度
		 */
		public static var SECOND_JUMP_HEIGHT : int = 100;
		private var _stateReference : JumpRiseStateReference;
		private var _destPoint:Vector3D;
		public function JumpRiseState()
		{
			super(RoleStateType.CONTROL_JUMP_RISE);
		}

		override public function execute() : void
		{
			super.execute();
			
			_stateReference = null;
			if (_ref is JumpRiseStateReference)
			{
				_stateReference = _ref as JumpRiseStateReference;
				_destPoint=_stateReference.destPoint;
				doJump();
			}
			else
				throw new Error("跳跃上升状态引用必须是JumpRiseStateReference类型！");
		}

		/**
		 * 上升阶段 
		 * 
		 */		
		private function doJump() : void
		{
			if (_machine && !_machine.isInPool)
			{
				(_machine.owner as SceneRole).isJump=true;//用于跳的时候不用半透明
				var jumpHeight : int = _stateReference.isSecondJump ? SECOND_JUMP_HEIGHT : JUMP_HEIGHT;
				var totalTime : int = _stateReference.totalTime;
				if(_destPoint)//有目的点的跳跃位移也停掉  缓动改变位置
				{Lyt.a("++++开始跳到目的地："+totalTime+"x:"+_destPoint.x+"y:"+_destPoint.z);
					TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x:true,z:true,offsetZ: true});
					(_machine.owner as SceneRole).faceToGround(_destPoint.x, _destPoint.z);
					TweenLite.to(_machine.owner as SceneRole, totalTime * 0.001, {x:_destPoint.x,z:_destPoint.z, ease: Linear.easeNone, overwrite: 0,onUpdate: onJumpUpdate});
				}
				else //没有有目的点的跳跃 不用停位移
				{
					TweenLite.killTweensOf(_machine.owner as SceneRole, false, {offsetZ: true});
				}
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetZ: jumpHeight, ease: Cubic.easeOut, overwrite: 0, onComplete: onJumpOffComplete});
			}
		}
		private function onJumpUpdate() : void//用于地图同步玩家位置
		{
			if (_machine && !_machine.isInPool)
			{
				if ((ref.owner as SceneRole).isMainChar)
				{
					EventManager.dispatchEvent(UserMoveEvent.MOVE_THROUGH);
				}
				else
				{
					EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, ref.owner);
				}
			}
		}
		/**
		 * 下降阶段 
		 * 
		 */		
		private function onJumpOffComplete() : void
		{
			if (_machine && !_machine.isInPool)
			{
				var totalTime : int = _stateReference.totalTime;
				TweenLite.to(_machine.owner as SceneRole, totalTime * 0.5 * 0.001, {offsetZ: 0, ease: Cubic.easeIn, overwrite: 0, onComplete: onJumpFallComplete});
			}
		}

		/**
		 * 落地了，切换跑路状态 
		 * 
		 */		
		private function onJumpFallComplete() : void
		{
			if (_machine && !_machine.isInPool)
			{
				removeSelf();
				if ((_machine as RoleStateMachine).isWalkMoving&&!_destPoint)
				{
					transition(RoleStateType.ACTION_RUN);
				}
				else//有目的点的位移不用切换到 run
				{
					transition(RoleStateType.ACTION_IDLE);
					
				}
				//落地特效
				SpellAnimationHelper.addTargetEffect(_machine.owner as SceneRole, RenderUnitID.JUMP_DOWN, RenderUnitType.TARGET_EFFECT, EffectUrl.EFFECT_JUMPDOWN, BoneNameEnum.st_zero);
				
				
			}
		}

		override public function leave() : void
		{
			super.leave();
			stopJump();
		}

		/**
		 * 停止跳跃，把角色的高度重置为0，清理计时器 
		 * 
		 */		
		private function stopJump() : void
		{Lyt.a("++++跳完了：");
			if (_machine && !_machine.isInPool)
			{
				(_machine.owner as SceneRole).isJump=false;
				(_machine.owner as SceneRole).offsetZ = 0;
				/*if(_destPoint)
				{
					_machine.owner.x=_destPoint.x;
					_machine.owner.z=_destPoint.z;
				}*/
				TweenLite.killTweensOf(_machine.owner as SceneRole, false, {x:true,z:true,offsetZ: true});
				TaskAutoManager.getInstance().jumpOver=true;
				if(_stateReference&&_stateReference.isEnd)
				{Lyt.a("跳跃点最后一个点");
					EventManager.dispatchEvent(MapEvent.MAP_JUMP_COMPLETE);// 用于有跳跃点的寻路 继续跑
				}
				
			}
		}

		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if ((_machine as RoleStateMachine).isBingDong)//如果是冰冻状态，且是非强制的话，则要永远保持这个跳跃状态
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if(force)
				return true;
			if ((_machine as RoleStateMachine).isDead)//死亡的时候，不能进入跳跃状态
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isDeadLaunch)//击飞死亡状态，不能进入跳跃状态
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isTrailMoving)//如果是轨迹行走阶状态，也不能进入跳跃状态
			{
				return false;
			}
			else if ((_machine as RoleStateMachine).isStiff)
			{
				if (!force)
					return false;
			}
			else if ((_machine as RoleStateMachine).isStun)
			{
				if (!force)
					return false;
			}
			return true;
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
