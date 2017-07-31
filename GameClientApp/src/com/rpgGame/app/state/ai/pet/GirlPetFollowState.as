package com.rpgGame.app.state.ai.pet
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.GirlPetFollowAnimator;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.type.AIStateType;
	
	import flash.geom.Vector3D;
	
	public class GirlPetFollowState extends AIState
	{
		private var _isMoving : Boolean;
		private var _petOwner:SceneRole;
		private var _pet:SceneRole;
		
		public function GirlPetFollowState()
		{
			super(AIStateType.AI_GIRL_FOLLOW);
			_isMoving=false;
		}
		
		override public function enter() : void
		{
			super.enter();
			_petOwner=SceneManager.getSceneObjByID(GirlPetData((_machine.owner as SceneRole).data).ownerId) as SceneRole;
			_pet=_machine.owner as SceneRole;
		}
		
		override public function execute() : void
		{
			super.execute();
			if(_petOwner)
			{
				var dis:int=MathUtil.getDistanceNoSqrt(_pet.pos.x,_pet.pos.y,_petOwner.pos.x,_petOwner.pos.y);
				if(dis>GirlPetFollowAnimator.MIN_TRANS_DIS)  //大于最小传送距离直接传送到身边
				{
			//传送
					_pet.setGroundXY(_petOwner.pos.x-1,_petOwner.pos.y);
				}
				else if(dis>2)
				{
					_isMoving=true;
					//给服务器发送同步坐标
					var position : Vector3D = new Vector3D(_petOwner.x, _petOwner.z, 0, _pet.position.w);
					RoleStateUtil.walkToPos(_pet, position, 50,null, onArrive,null,null,true);
				}
				else
				{
					onArrive();
				}
			}
			else
			{
				//主角不在场景里了 传送到主角身边
				onArrive();			
			}
		}
		
		private function onArrive(ref:*=null) : void
		{
			_isMoving=false;
			transition(AIStateType.AI_NONE);
		}
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			if (!_isMoving)
				return true;
			return false;
		}
		
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			if (force&&!(_machine as AIStateMachine).isGrilPetTransLock) 
			{
				return true;
			}
			var role:SceneRole=SceneManager.getSceneObjByID(GirlPetData((_machine.owner as SceneRole).data).ownerId) as SceneRole;
			var machine:RoleStateMachine=role.stateMachine;
			if (machine.isRunning||machine.isWalking||machine.isWalkMoving) 
			{
				return true;
			}
			if (machine.isAttacking) 
			{
				return false;
			}
			return true;
		}
		
		override public function dispose():void
		{
			
		}
	}
}