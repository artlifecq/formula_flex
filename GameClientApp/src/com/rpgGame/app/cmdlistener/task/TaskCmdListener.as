package com.rpgGame.app.cmdlistener.task
{
	
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.core.L;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.netData.task.message.ResTaskInformationMessage;
	
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
			SocketConnection.addCmdListener(124101,onResTaskInformationMessage);
			finish();
		}
		/**登陆当前所有任务消息	*/
		private function onResTaskInformationMessage(msg:ResTaskInformationMessage):void
		{
			
			L.l(msg.taskModelId);
			
			TaskMissionManager.taskModelId=msg.taskModelId;
			TaskMissionManager.dailyTaskTimes=msg.dailyTaskTimes;
			TaskMissionManager.setCurrentTaskInfo(msg.acceptedList);
			
				
			EventManager.dispatchEvent(TaskEvent.TASK_INFOR_MATION);
			
		}
		
	}
}