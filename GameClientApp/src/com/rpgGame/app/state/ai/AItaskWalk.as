package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.TrusteeshipManager;
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
	import com.rpgGame.coreData.role.SceneJumpPointData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	
	import flash.utils.getTimer;
	
	public class AItaskWalk extends AIState
	{
		private var taskType:int
		private var taskTarget:int;
		
		public function AItaskWalk()
		{
			super(AIStateType.TASK_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			taskType=TaskAutoManager.getInstance().otherType;
			taskTarget=TaskAutoManager.getInstance().taskTarget;
			
			var jumpid:int=TaskMissionManager.isMainTaskJump();
			var jumpData:SceneJumpPointData=MapJumpCfgData.getJumpportData(jumpid);
			var post:Array;
			if(jumpData!=null)
			{
				post=[jumpData.sceneID,jumpData.startPoint.x,jumpData.startPoint.y];
			}
			if(TaskMissionManager.getMainTaskIsFinish())
			{
				if(TaskMissionManager.getMainTaskHaveNpc())
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
					//TaskControl.showLeadPanel();;主线任务没有回复npc不弹框了
					TaskSender.sendfinishTaskMessage(TaskMissionManager.mainTaskInfo.taskId);	
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
		{
			TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),onArrive);
		}
		private function gotoTask(data :Object=null):void
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
				TaskUtil.postTaskWalk(post,subMonster,null,TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_MONSTER);
			}
			else if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_GATHER)
			{
				var post2:Array=TaskMissionManager.getPathingByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
				var modeid2:int=TaskUtil.getMonsterByType(TaskType.MAINTYPE_MAINTASK,TaskAutoManager.getInstance().taskTarget);
				var obj:Object=new Object();
				obj.subType=TaskUtil.getSubtypeByType(TaskType.MAINTYPE_MAINTASK);
				obj.modeid=modeid2;
				TaskUtil.postTaskWalk(post2,walkStartGather,obj);
			}
		}
		
		private var isWalking:Boolean=false;
		private var isWalkTime:int;
		private function onArrive(data :Object) : void
		{
			TaskControl.showLeadPanel();
			isWalking=false;
			TaskAutoManager.getInstance().walkOver=true;
		}
		private function subMonster(data : Object) : void
		{
			TrusteeshipManager.getInstance().startAutoFight();
			isWalking=false;
			TaskAutoManager.getInstance().walkOver=true;
		}
		/**采集寻路完成开始采集了*/
		private function walkStartGather(data :Object):void
		{
			
			var modeid:int=data.modeid;
			GatherAutoManager.getInstance().startGatherAuto(modeid);
			isWalking=false;
			TaskAutoManager.getInstance().walkOver=true;
		}
		
		
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			if(!MainRoleManager.actor.stateMachine.isRunning&&!MainRoleManager.actor.stateMachine.isWalking&&!MainRoleManager.actor.stateMachine.isWalkMoving&&!MainRoleManager.actor.stateMachine.isJumpRising)
			{
				if(isWalking&&(getTimer()-isWalkTime)>=TaskAutoManager.AUTOMAIN)
				{
					return true;
				}
			}
			else
			{
				isWalkTime=getTimer();
			}
			return false;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
	}
	
}