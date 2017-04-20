package com.rpgGame.app.cmdlistener.task
{
	
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.core.events.TaskEvent;
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
			
			finish();
		}
		/**登陆当前所有任务消息	*/
		private function onResTaskInformationMessage(msg:ResTaskInformationMessage):void
		{
			
			TaskMissionManager.taskModelId=msg.taskModelId;
			TaskMissionManager.dailyTaskTimes=msg.dailyTaskTimes;
			TaskMissionManager.setCurrentTaskInfo(msg.acceptedList);
			
				
			EventManager.dispatchEvent(TaskEvent.TASK_INFOR_MATION);
			
		}
		/**接受新任务消息*/
		private function onResTaskAcceptedMessage(msg:ResTaskAcceptedMessage):void
		{
			TaskMissionManager.setTaskInfo(msg.taskInfo);
			
			EventManager.dispatchEvent(TaskEvent.TASK_NEW_MATION);
		}
		/**任务改变消息*/
		private function onResTaskChangeMessage(msg:ResTaskChangeMessage):void
		{
			TaskMissionManager.setTaskInfo(msg.taskInfo);
			
			EventManager.dispatchEvent(TaskEvent.TASK_CHANGE_MATION);
		}
		
		/**任务完成消息	*/
		private function onResTaskSubmitedMessage(msg:ResTaskSubmitedMessage):void
		{
			
			EventManager.dispatchEvent(TaskEvent.TASK_FINISH_MATION);
		}
	}
}