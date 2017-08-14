package com.rpgGame.app.state.ai.pet
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.GirlPetFollowAnimator;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.type.AIStateType;
	
	import flash.geom.Point;
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
			
			//_pet=_machine.owner as SceneRole;
		}
		
	
		
		override public function execute() : void
		{
			super.execute();
			_petOwner=SceneManager.getSceneObjByID(GirlPetData((_machine.owner as SceneRole).data).ownerId) as SceneRole;
			if(_petOwner)
			{
				var dis:int=MathUtil.getDistanceNoSqrt(_pet.pos.x,_pet.pos.y,_petOwner.pos.x,_petOwner.pos.y);
//				if(dis>=GirlPetFollowAnimator.MIN_TRANS_DIS)
//				{
//					//超出视野了  执行待机
////					onArrive();
//					//SceneSender.reqPetTransferMessage((_pet.data as GirlPetData).ownerLongId);
//				}
//				else 
				if(dis>GirlPetFollowAnimator.MIN_NEAR)
				{
					_isMoving=true;
					//给服务器发送同步坐标
					//var targetPos3D : Vector3D =  new Vector3D(_pet.pos.x,0,_pet.pos.y, _pet.position.w);
					var p:Point=SceneRoleManager.getInstance().getPetPoint(_petOwner.pos.x,_petOwner.pos.y,_petOwner.rotationY);
					var position : Vector3D = new Vector3D(p.x,-p.y,0, 0);
					//var list:Vector.<Vector3D>=new Vector.<Vector3D>();
					//list.push(targetPos3D);
					//list.push(position);
					//SceneSender.reqPetNewRunningMessage(list);
					MainRoleSearchPathManager.jumpWalkToPos(_pet,position);
				}
				else
				{
					onArrive();
				}
			}
			else
			{
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
			_pet=_machine.owner as SceneRole;
			if (force&&!(_machine as AIStateMachine).isGrilPetTransLock) 
			{
				return true;
			}
			
			if (!force&&_pet.stateMachine.isAttackHarding) 
			{
				return false;
			}
//			var role:SceneRole=SceneManager.getSceneObjByID(GirlPetData((_machine.owner as SceneRole).data).ownerId) as SceneRole;
//			var machine:RoleStateMachine=role.stateMachine;
//			if (machine.isRunning||machine.isWalking||machine.isWalkMoving) 
//			{
//				return true;
//			}
			if (!force&&_pet.stateMachine.isWalkMoving) 
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