package com.rpgGame.app.state.ai.pet
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.StateMachine;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.type.AIStateType;
	
	public class GirlPetFollowState extends AIState
	{
		public function GirlPetFollowState()
		{
			super(AIStateType.AI_GIRL_FOLLOW);
		}
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			if (force&&!(_machine as AIStateMachine).isGrilPetTransLock) 
			{
				return true;
			}
			var machine:RoleStateMachine=SceneRole(_ref.owner).stateMachine;
			if (machine.isRunning||machine.isWalking||machine.isWalkMoving) 
			{
				return false;
			}
			if (machine.isAttacking) 
			{
				return false;
			}
			return true;
		}
	}
}