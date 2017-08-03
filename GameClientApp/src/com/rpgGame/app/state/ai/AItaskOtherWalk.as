package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.GatherAutoManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	
	import flash.utils.getTimer;
	
	public class AItaskOtherWalk extends AIState
	{
		private var taskType:int
		private var taskTarget:int;
		public function AItaskOtherWalk()
		{
			super(AIStateType.TASK_OTHER_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			taskType=TaskAutoManager.getInstance().otherType;
			taskTarget=TaskAutoManager.getInstance().taskTarget;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(taskType);
			if(taskData==null)return;
			var missionType:int=taskData.q_mission_type;
			if(TaskMissionManager.getTaskIsFinishByType(taskType))
			{
				if(TaskMissionManager.getTaskHaveNpc(taskType))
				{
					TaskUtil.npcTaskWalk(TaskMissionManager.getTaskNpcAreaId(taskType),onArrive);
					isWalking=true;
					isWalkTime=getTimer();
				}
				else
				{
					onArrive();
				}
			}
			else if(taskType==TaskType.MAINTYPE_TREASUREBOX)
			{
				var monsterId:int=TaskMissionManager.getTreasuerMonsterId(taskTarget);
				TaskUtil.monsterTaskWalk(monsterId,subMonster);
			}
			else
			{
				if(missionType==TaskType.SUB_USEITEM)//是使用道具任务且没有完成
				{
					var modeid:int=TaskUtil.getMonsterByType(taskType,taskTarget);
					GatherAutoManager.getInstance().startGatherAuto(modeid);
				}
				else if(missionType==TaskType.SUB_CONVERSATION)
				{
					TaskUtil.npcTaskWalk(TaskMissionManager.getTaskNpcAreaId(taskType),onArrive);
				}
				else if(missionType==TaskType.SUB_MONSTER||missionType==TaskType.SUB_ITEM)
				{
					var post:Array=TaskMissionManager.getPathingByType(taskType,taskTarget);
					TaskUtil.postTaskWalk(post,subMonster,null,missionType==TaskType.SUB_MONSTER);
				}
				else if(missionType==TaskType.SUB_GATHER)
				{
					var post2:Array=TaskMissionManager.getPathingByType(taskType,taskTarget);
					var modeid2:int=TaskUtil.getMonsterByType(taskType,taskTarget);
					var obj:Object=new Object();
					obj.subType=TaskUtil.getSubtypeByType(taskType);
					obj.modeid=modeid2;
					TaskUtil.postTaskWalk(post2,walkStartGather,obj);
				}
				isWalking=true;
				isWalkTime=getTimer();
			}
			
			
			
		}
		private var isWalking:Boolean=false;
		private var isWalkTime:int;
		private function onArrive(data :Object=null) : void
		{
			if(taskType==TaskType.MAINTYPE_MAINTASK)
			{
				TaskControl.showLeadPanel();
			}
			else if(taskType==TaskType.MAINTYPE_DAILYTASK)
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
			}
			else if(taskType==TaskType.MAINTYPE_TREASUREBOX)
			{
				TaskControl.showLoopPanel();
			}
			else if(taskType==TaskType.LIJIN_TASK)
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
			}
			else if(taskType==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				TaskControl.showGuildPanel();
			}
			
			isWalking=false;
		}
		private function subMonster(data : Object=null) : void
		{
			TrusteeshipManager.getInstance().startAutoFight();
			isWalking=false;
		}
		/**采集寻路完成开始采集了*/
		private function walkStartGather(data :Object):void
		{
			
			var modeid:int=data.modeid;
			GatherAutoManager.getInstance().startGatherAuto(modeid,taskType);
			isWalking=false;
		}
		
		
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			if(isWalking&&!MainRoleManager.actor.stateMachine.isRunning&&!MainRoleManager.actor.stateMachine.isWalking&&!MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				if((getTimer()-isWalkTime)>=TaskAutoManager.AUTOMAIN)
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