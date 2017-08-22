package com.rpgGame.app.cmdlistener.task
{
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_npc;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.npc.message.ResStartGatherMessage;
	import com.rpgGame.netData.npc.message.ResStopGatherMessage;
	import com.rpgGame.netData.task.message.CSDropTaskMessage;
	import com.rpgGame.netData.task.message.ResTaskAcceptedMessage;
	import com.rpgGame.netData.task.message.ResTaskChangeMessage;
	import com.rpgGame.netData.task.message.ResTaskInformationMessage;
	import com.rpgGame.netData.task.message.ResTaskSubmitedMessage;
	import com.rpgGame.netData.task.message.SCDropTaskMessage;
	import com.rpgGame.netData.task.message.SCNoMainTaskMessage;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
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
			SocketConnection.addCmdListener(124108,onSCNoMainTaskMessage);//卡级任务消息
			SocketConnection.addCmdListener(124209,onSCDropTaskMessage);//放弃任务消息
			
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
						if(TaskAutoManager.FLYTIME>0)
						{
							AppManager.showAppNoHide(AppConstant.TASK_FLY_PANEL,msg.taskInfo.taskModelId);
						}
						else
						{
							var postPath:Array=TaskMissionManager.getTaskPathingByType(taskData.q_mission_mainType,0);
							TaskUtil.postTaskFly(postPath,taskData.q_mission_mainType);
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
				if(type!=0)
				{
					EventManager.dispatchEvent(TaskEvent.TASK_FINISH_MATION,type);
					AppManager.hideApp(AppConstant.TASK_FLY_PANEL);
					TaskMissionManager.removeTaskInfo(type);
				}
			}
		}
		/**任务卡级消息	*/
		private function onSCNoMainTaskMessage(msg:SCNoMainTaskMessage):void
		{
			if(msg!=null)
			{
				TaskMissionManager.noMainTaskId=msg.taskModelId;
				TaskMissionManager.noMainTaskInfo=msg.noMainTaskInfo;
				EventManager.dispatchEvent(TaskEvent.TASK_NO_MAIN);
			}
		}
		/**放弃任务消息	*/
		private function onSCDropTaskMessage(msg:SCDropTaskMessage):void
		{
			if(msg!=null)
			{
				var type:int=TaskMissionManager.getTaskInfoType(msg.taskId);
				EventManager.dispatchEvent(TaskEvent.TASK_DROP,type);
				TaskMissionManager.removeTaskInfo(type);
			}
		}
		
		
		
		
		
		/**开始采集	*/
		private function onResStartGatherMessage(msg:ResStartGatherMessage):void
		{
			if(msg!=null)
			{
				//msg.tatget
				var singStr:String="采集中";
				var role:SceneRole = SceneManager.getSceneObjByID(msg.tatget.ToGID()) as SceneRole;
				if (role!=null && role.data!=null) {
					var collectData : SceneCollectData = role.data as SceneCollectData;
					if (collectData != null)
					{
						var monsterData:Q_monster=MonsterDataManager.getData(collectData.modelID);
						if(monsterData)
						{
							var collect:Q_npc=MonsterDataManager.getCollectData(monsterData.q_npc_function);
							if(collect&&collect.q_collect_singbar!="")
							{
								singStr=collect.q_collect_singbar;
							}
						}
						
					}
					
					
				}
				EventManager.dispatchEvent(SkillEvent.SING_START,msg.costtime,singStr,2);
				CollectManager.show("caiji",msg.costtime,null);
				//TweenLite.killDelayedCallsTo(sendFinishGather);
				TweenLite.delayedCall(msg.costtime*0.001, sendFinishGather,[msg.tatget]);
				
			}
		}
		private function sendFinishGather(tid:long):void
		{
			TaskSender.sendFinishGatherMessage(tid);
		}
		
		
		/**停止采集	*/
		private function onResStopGatherMessage(msg:ResStopGatherMessage):void
		{
			EventManager.dispatchEvent(SkillEvent.SING_STOP);
		}
		
		
		
		
		
	}
}