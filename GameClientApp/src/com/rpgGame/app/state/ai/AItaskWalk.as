package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.GatherAutoManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.main.task.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	
	public class AItaskWalk extends AIState
	{
		public function AItaskWalk()
		{
			super(AIStateType.TASK_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			//L.l("~~~~AItaskWalk---execute");
			if(TaskMissionManager.getMainTaskIsFinish())
			{
				if(TaskMissionManager.getMainTaskHaveNpc())
				{
					TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),onArrive);
					isWalking=1;
				}
				else
				{
					TaskControl.showLeadPanel();
				}
			}
			else
			{
				if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_USEITEM)//是使用道具任务且没有完成
				{
					var modeid:int=TaskUtil.getMonsterByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
					GatherAutoManager.getInstance().startGatherAuto(modeid);
				}
				else if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_CONVERSATION)
				{
					TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),onArrive);
				}
				else if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_MONSTER||TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_ITEM)
				{
					var post:Array=TaskMissionManager.getPathingByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
					TaskUtil.postTaskWalk(post,subMonster);
				}
				else if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_GATHER)
				{
					var post2:Array=TaskMissionManager.getPathingByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
					var modeid2:int=TaskUtil.getMonsterByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
					var obj:Object=new Object();
					obj.subType=TaskUtil.getSubtypeByType(type);
					obj.modeid=modeid2;
					TaskUtil.postTaskWalk(post2,walkStartGather,obj);
				}
				isWalking=1;
			}
			
			
			
		}
		private var isWalking:int=0;
		private function onArrive(data :Object) : void
		{
			TaskControl.showLeadPanel();
			isWalking=0;
		}
		private function subMonster(data : Object) : void
		{
			TrusteeshipManager.getInstance().startAutoFight();
			isWalking=0;
		}
		/**采集寻路完成开始采集了*/
		private function walkStartGather(data :Object):void
		{
			
			var modeid:int=data.modeid;
			GatherAutoManager.getInstance().startGatherAuto(modeid);
			isWalking=0;
		}
		
		
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			if(isWalking>0&&!MainRoleManager.actor.stateMachine.isRunning&&!MainRoleManager.actor.stateMachine.isWalking&&!MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				isWalking++;
				if(isWalking>=10)
				{
					return true;
				}
			}
			return false;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
	}
	
}