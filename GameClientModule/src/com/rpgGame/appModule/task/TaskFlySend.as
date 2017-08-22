package com.rpgGame.appModule.task
{
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.type.TaskType;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.common.alert.AlertSend;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 * 系统神行符
	 * @author YT
	 * 
	 */	
	public class TaskFlySend extends SkinUIPanel
	{
		private var _skin :AlertSend;
		private var taskId:int;
		public function TaskFlySend()
		{
			_skin=new AlertSend();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			
			taskId=int(data);
			setTime(TaskAutoManager.FLYTIME);
		}
		override public function hide():void
		{
			super.hide();
			TimerServer.remove(updateTime);
			//TweenLite.killDelayedCallsTo(hide);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target.name)
			{
				case "btn_ok":
					send();
					break;
			}
		}
		private var remainTime:int;
		private function setTime(time:int):void
		{
			if(time<0)
			{
				_skin.btn_ok.label="立即传送";
			}else
			{
				remainTime=time;
				updateTime();
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.btn_ok.label="立即传送("+remainTime+")";
			if(remainTime==0)
			{
				send();
			}
		}
		private function send():void
		{
			hide();
			var taskData:Q_mission_base=TaskMissionCfgData.getTaskByID(taskId);
			if(taskData)
			{
				//TaskUtil.postTaskFly(postPath,taskData.q_mission_mainType);
				
				var postPath:Array=TaskMissionManager.getTaskPathingByType(taskData.q_mission_mainType,0);
				TaskMissionManager.flyTaskType=taskData.q_mission_mainType;
				TaskMissionManager.flyMissionType=taskData.q_mission_type;
				SceneSender.sceneMapTransport(postPath[0], postPath[1], postPath[2],25,false,null,0,0);
			}
			
//			
//			if(TaskMissionManager.getMainTaskIsFinish()&&TaskMissionManager.getMainTaskHaveNpc())
//			{
//				TaskUtil.npcTaskFly(TaskMissionManager.getMainTaskNpcAreaId(),TaskType.MAINTYPE_MAINTASK);
//			}
//			else
//			{
//				var postPath:Array=TaskMissionManager.getPathingByType(TaskType.MAINTYPE_MAINTASK,0);
//				TaskUtil.postTaskFly(postPath,TaskType.MAINTYPE_MAINTASK);
//			}
			
		}
	}
}