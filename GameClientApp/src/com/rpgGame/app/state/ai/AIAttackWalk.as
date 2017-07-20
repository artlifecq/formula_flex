package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;

	public class AIAttackWalk extends AIState
	{
		public function AIAttackWalk()
		{
			super(AIStateType.ATTACK_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			if (SceneRoleSelectManager.selectedRole != null)
			{
				var monsterData : MonsterData = SceneRoleSelectManager.selectedRole.data as MonsterData;
				var targerPos : Vector3D = SceneRoleSelectManager.selectedRole.position;
			//	RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 200, null, onArrive);
				//walkrun=true;
				var position : Vector3D = new Vector3D(targerPos.x, targerPos.z, 0, MainRoleManager.actor.position.w);
				RoleStateUtil.walkToPos(MainRoleManager.actor, position, 100,null, onArrive,null,null,true);
			}
			else
			{
				onArrive();
			}
		}
		
		private function onArrive(ref:*=null) : void
		{
			//walkrun=false;
			transition(AIStateType.AI_NONE);
		}
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			if (!isWalk())
				return true;
			if (MainRoleManager.actor.stateMachine.isWalkMoving)
				return true;
			/*if(!MainRoleManager.actor.stateMachine.isRunning&&!MainRoleManager.actor.stateMachine.isWalking&&!MainRoleManager.actor.stateMachine.isWalkMoving)
				return true;*/
			return false;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if(force)
			{
				return true;
			}
			
			if(!isWalk())
			{
				if(!force)
				{
					return false;
				}
			}
			if (MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				return false;	
			}
			/*
			
			if (MainRoleManager.actor.stateMachine.isJumpRising)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBlinkMoving)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBeatMoving)
			{
				return false;
			}*/
			/*if (!MainRoleManager.actor.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
			{
				return false;
			}*/
			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				return false;
			}
			/*if (MainRoleManager.actor.stateMachine.isAttackHarding)a
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isLockCaseSpell)
			{
				return false;
			}*/
			return true;
		}
		//private static var walkrun:Boolean=false;
		private function isWalk():Boolean
		{
			if (SceneRoleSelectManager.selectedRole != null)
			{
				var dist:int = Point.distance(new Point(MainRoleManager.actor.position.x,MainRoleManager.actor.position.z),new Point(SceneRoleSelectManager.selectedRole.position.x,SceneRoleSelectManager.selectedRole.position.z));
				if(dist>=220)
				{
					return true;
				}
			}
			return false;
		}
	}
}