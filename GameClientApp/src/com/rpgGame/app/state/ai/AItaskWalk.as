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
			var post:Array=getJumpPos();
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
					onArrive(null);
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
			TaskUtil.npcTaskWalk(TaskMissionManager.getTaskNpcAreaId(taskType),onArrive);
		}
		private function gotoTask(data :Object=null):void
		{
			var postPath:Array=TaskMissionManager.getTaskPathingByType(taskType,taskTarget);
			if(missionType==TaskType.SUB_USEITEM)//是使用道具任务且没有完成
			{
				var modeid:int=TaskUtil.getMonsterByType(taskType,taskTarget);
				GatherAutoManager.getInstance().startGatherAuto(modeid);
			}
			else if(missionType==TaskType.SUB_CONVERSATION)
			{
				if(postPath&&postPath.length>0)
				{
					TaskUtil.postTaskWalk(postPath,onArrive);
				}
			}
			else if(missionType==TaskType.SUB_MONSTER||missionType==TaskType.SUB_ITEM)
			{
				if(postPath&&postPath.length>0)
				{
					TaskUtil.postTaskWalk(postPath,subMonster,null,true);
				}
				
				/*if(taskType==TaskType.MAINTYPE_TREASUREBOX)
				{
					var monsterId:int=TaskMissionManager.getTreasuerMonsterId(taskTarget);
					TaskUtil.monsterTaskWalk(monsterId,subMonster);
				}
				else
				{
					var post:Array=TaskMissionManager.getPathingByType(taskType,taskTarget);
					TaskUtil.postTaskWalk(post,subMonster,null,true);
				}*/
			}
			else if(missionType==TaskType.SUB_GATHER)
			{
				/*var post2:Array=TaskMissionManager.getPathingByType(taskType,taskTarget);
				
				TaskUtil.postTaskWalk(post2,walkStartGather,obj);*/
				
				if(postPath&&postPath.length>0)
				{
					var modeid2:int=TaskUtil.getMonsterByType(taskType,taskTarget);
					var obj:Object=new Object();
					obj.subType=TaskUtil.getSubtypeByType(taskType);
					obj.modeid=modeid2;
					TaskUtil.postTaskWalk(postPath,walkStartGather,obj);
				}
				
			}
			else if(missionType==TaskType.SUB_SPEAK)
			{
				/*var post3:Array=TaskMissionManager.getPathingByType(taskType,taskTarget);
				
				TaskUtil.postTaskWalk(post3,walkStartSpeak,obj3);*/
				if(postPath&&postPath.length>0)
				{
					var obj3:Object=new Object();
					obj3.subType=TaskUtil.getSubtypeByType(taskType);
					obj3.describe=TaskMissionManager.getOtherTaskData(taskType).q_describe;
					TaskUtil.postTaskWalk(postPath,walkStartSpeak,obj3);
				}
				
			}
		}
		
		private var isWalking:Boolean=false;
		private var isWalkTime:int;
		private function onArrive(data :Object) : void
		{
			if(taskType==TaskType.MAINTYPE_MAINTASK)
			{
				if(TaskMissionManager.getTaskHaveNpc(taskType))	
				{
					TaskControl.showLeadPanel();
				}
				else//TaskControl.showLeadPanel();;主线任务没有回复npc不弹框了
				{
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
				}
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
				if(TaskMissionManager.getTaskHaveNpc(taskType))	
				{
					TaskControl.showGuildPanel();
				}
				else
				{
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
				}
			}
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
			GatherAutoManager.getInstance().startGatherAuto(modeid,taskType);
			isWalking=false;
			TaskAutoManager.getInstance().walkOver=true;
		}
		private function walkStartSpeak(data :Object):void
		{
			var speak:String=TaskMissionCfgData.substitute(data.describe,MainRoleManager.actorInfo.societyName);
			ChatManager.reqSendChat(speak,EnumChatChannelType.CHAT_CHANNEL_WORLD);
			TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
			isWalking=false;
			TaskAutoManager.getInstance().walkOver=true;
		}
		
		
		private function getJumpPos():Array
		{
			var jumpid:int=TaskMissionManager.isTaskJump(taskType);
			var jumpData:SceneJumpPointData=MapJumpCfgData.getJumpportData(jumpid);
			var post:Array;
			if(jumpData!=null)
			{
				post=[jumpData.sceneID,jumpData.startPoint.x,jumpData.startPoint.y];
			}
			return post;
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