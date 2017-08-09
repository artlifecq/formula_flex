package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.GatherAutoManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.cfg.MapJumpCfgData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.role.SceneJumpPointData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import flash.utils.getTimer;
	
	public class AItaskWalk extends AIState
	{
		private var taskType:int
		private var taskTarget:int;
		private var missionType:int
		public function AItaskWalk()
		{
			super(AIStateType.TASK_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			taskType=TaskAutoManager.getInstance().otherType;
			taskTarget=TaskAutoManager.getInstance().taskTarget;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(taskType);
			if(taskData==null)
				return;
			missionType=taskData.q_mission_type;
			var post:Array;
			if(!TaskAutoManager.getInstance().jumpOver)//新任务没跳才跳
			{
				post=TaskMissionManager.getJumpPos(taskType);
			}
			
			if(TaskMissionManager.getTaskIsFinishByType(taskType))
			{
				if(TaskMissionManager.getTaskHaveNpc(taskType))
				{
					if(post!=null)
					{
						TaskUtil.postTaskJump(post,gotoNpc);
					}
					else
					{
						gotoNpc();
					}
					isWalking=true;
					isWalkTime=getTimer();
				}
				else
				{
					TaskAutoManager.getInstance().taskFilshed(taskType);
				}
			}
			else
			{
				if(post!=null)
				{
					TaskUtil.postTaskJump(post,gotoTask);
				}
				else
				{
					gotoTask();
				}
				isWalking=true;
				isWalkTime=getTimer();
			}
		}
		private function gotoNpc(data :Object=null):void
		{Lyt.a("WALK-gotoNpc");
			TaskUtil.npcTaskWalk(TaskMissionManager.getTaskNpcAreaId(taskType),onArrive);
			TaskAutoManager.getInstance().jumpOver=true;
		}
		private function gotoTask(data :Object=null):void
		{
			
			var postPath:Array=TaskMissionManager.getTaskPathingByType(taskType,taskTarget);
			Lyt.a("WALK-gotoTask:"+(postPath!=null?postPath.length:0));
			switch(missionType)
			{
				case TaskType.SUB_CONVERSATION:
					TaskUtil.postTaskWalk(postPath,onArrive);
					break;
				case TaskType.SUB_MONSTER:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive,null,true);
					break;
				case TaskType.SUB_ITEM:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive,null,true);
					break;
				case TaskType.SUB_GATHER:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive);
					break;
				case TaskType.SUB_USEITEM:
					GatherAutoManager.getInstance().startGatherAuto(TaskUtil.getMonsterByType(taskType,taskTarget));
					break;
				case TaskType.SUB_SPEAK:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive);
					break;
				
			}
			TaskAutoManager.getInstance().jumpOver=true;
			/*if(missionType==TaskType.SUB_USEITEM)//是使用道具任务且没有完成
			{
				GatherAutoManager.getInstance().startGatherAuto(TaskUtil.getMonsterByType(taskType,taskTarget));
			}
			else if(missionType==TaskType.SUB_CONVERSATION)
			{
				TaskUtil.postTaskWalk(postPath,onArrive);
			}
			else if(missionType==TaskType.SUB_MONSTER||missionType==TaskType.SUB_ITEM)
			{
				TaskUtil.postTaskWalk(postPath,subMonster,null,true);
			}
			else if(missionType==TaskType.SUB_GATHER)
			{
				TaskUtil.postTaskWalk(postPath,walkStartGather);
			}
			else if(missionType==TaskType.SUB_SPEAK)
			{
				TaskUtil.postTaskWalk(postPath,walkStartSpeak);
			}*/
		}
		private function gotoTaskonArrive(data :Object=null):void
		{
			switch(missionType)
			{
				case TaskType.SUB_CONVERSATION:
					
					break;
				case TaskType.SUB_MONSTER:
					TrusteeshipManager.getInstance().startAutoFight();
					break;
				case TaskType.SUB_ITEM:
					TrusteeshipManager.getInstance().startAutoFight();
					break;
				case TaskType.SUB_GATHER:
					var modeid:int=TaskUtil.getMonsterByType(taskType,taskTarget);
					GatherAutoManager.getInstance().startGatherAuto(modeid,taskType);
					break;
				case TaskType.SUB_USEITEM:
					
					break;
				case TaskType.SUB_SPEAK:
					var speak:String=TaskMissionCfgData.substitute(TaskMissionManager.getOtherTaskData(taskType).q_describe,MainRoleManager.actorInfo.societyName);
					ChatManager.reqSendChat(speak,EnumChatChannelType.CHAT_CHANNEL_WORLD);
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
				
			}
			isWalking=false;
			
		}
		
		private var isWalking:Boolean=false;
		private var isWalkTime:int;
		private function onArrive(data :Object) : void
		{
			TaskAutoManager.getInstance().taskFilshed(taskType);
		}
		
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			/*if(!MainRoleManager.actor.stateMachine.isRunning&&!MainRoleManager.actor.stateMachine.isWalking&&!MainRoleManager.actor.stateMachine.isWalkMoving&&!MainRoleManager.actor.stateMachine.isJumpRising)
			{
				if(isWalking)//&&(getTimer()-isWalkTime)>=TaskAutoManager.AUTOMAIN
				{
					return true;
				}
			}
			else
			{
				isWalkTime=getTimer();
			}*/
			return false;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
	}
	
}