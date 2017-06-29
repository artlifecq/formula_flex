package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.netData.npc.message.ResStartGatherMessage;
	import com.rpgGame.netData.npc.message.ResStopGatherMessage;
	import com.rpgGame.netData.task.message.ResTaskAcceptedMessage;
	import com.rpgGame.netData.task.message.ResTaskChangeMessage;
	import com.rpgGame.netData.task.message.ResTaskInformationMessage;
	import com.rpgGame.netData.task.message.ResTaskSubmitedMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 * 任务消息监听
	 * @author YT
	 * 
	 */	
	public class TaskCmdListener extends BaseBean
	{
		public function TaskCmdListener()
		{
			super();
		}
		override public function start() : void
		{

			SocketConnection.addCmdListener(124101,onResTaskInformationMessage);//登陆获取任务列表
			SocketConnection.addCmdListener(124102,onResTaskAcceptedMessage);//新任务
			SocketConnection.addCmdListener(124103,onResTaskChangeMessage);//任务进度改变
			SocketConnection.addCmdListener(124104,onResTaskSubmitedMessage);//任务完成
			SocketConnection.addCmdListener(104102,onResStartGatherMessage);//采集开始
			SocketConnection.addCmdListener(104103,onResStopGatherMessage);//采集打断
			
			
			finish();
		}
		/**登陆时当前所有任务消息	*/
		private function onResTaskInformationMessage(msg:ResTaskInformationMessage):void
		{
			if(msg!=null&&msg.acceptedList!=null)
			{
				TaskMissionManager.taskModelId=msg.taskModelId;
				TaskMissionManager.dailyTaskTimes=msg.dailyTaskTimes;
				TaskMissionManager.setCurrentTaskInfo(msg.acceptedList);
				EventManager.dispatchEvent(TaskEvent.TASK_INFOR_MATION);
			}
			
			
			
		}
		/**接受新任务消息*/
		private function onResTaskAcceptedMessage(msg:ResTaskAcceptedMessage):void
		{
			if(msg!=null&&msg.taskInfo!=null)
			{
				var taskData:Q_mission_base=TaskMissionCfgData.getTaskByID(msg.taskInfo.taskModelId);
				if(taskData!=null)
				{
					TaskMissionManager.setTaskInfo(msg.taskInfo);
					EventManager.dispatchEvent(TaskEvent.TASK_NEW_MATION,taskData.q_mission_mainType);
					if(taskData.q_fly==1&&taskData.q_pathing!="")//系统神行符
					{
						if (!AppManager.isAppInScene(AppConstant.TASK_FLY_PANEL))
						{
							AppManager.showApp(AppConstant.TASK_FLY_PANEL,msg.taskInfo.taskModelId);
						}
					}
				}
			}
		}
		/**任务改变消息*/
		private function onResTaskChangeMessage(msg:ResTaskChangeMessage):void
		{
			if(msg!=null&&msg.taskInfo!=null)
			{
				var taskData:Q_mission_base=TaskMissionCfgData.getTaskByID(msg.taskInfo.taskModelId);
				
				if(taskData!=null)
				{
					TaskMissionManager.setTaskInfo(msg.taskInfo);
					EventManager.dispatchEvent(TaskEvent.TASK_CHANGE_MATION,taskData.q_mission_mainType);
				}
			}
			
		}
		
		/**任务完成消息	*/
		private function onResTaskSubmitedMessage(msg:ResTaskSubmitedMessage):void
		{
			
			if(msg!=null)
			{
				var type:int=TaskMissionManager.getTaskInfoType(msg.taskId);
				TaskMissionManager.removeTaskInfo(type);
				EventManager.dispatchEvent(TaskEvent.TASK_FINISH_MATION,type);
				AppManager.hideApp(AppConstant.TASK_FLY_PANEL);
			}
		}
		
		
		/**开始采集	*/
		private function onResStartGatherMessage(msg:ResStartGatherMessage):void
		{
			if(msg!=null)
			{
				EventManager.dispatchEvent(SkillEvent.SING_START,msg.costtime,"采集中",2);
				CollectManager.show("caiji",msg.costtime,null);
			}
		}
		
		/**开始采集	*/
		private function onResStopGatherMessage(msg:ResStopGatherMessage):void
		{
			EventManager.dispatchEvent(SkillEvent.SING_STOP);
		}
		
		
		
		
		
	}
}