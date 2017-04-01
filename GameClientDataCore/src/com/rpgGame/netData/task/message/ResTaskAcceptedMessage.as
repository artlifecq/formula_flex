package com.rpgGame.netData.task.message{
	import com.rpgGame.netData.task.bean.TaskInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务接受后返回前端消息
	 */
	public class ResTaskAcceptedMessage extends Message {
	
		//当前任务消息
		private var _taskInfo: TaskInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前任务消息
			writeBean(_taskInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前任务消息
			_taskInfo = readBean(TaskInfo) as TaskInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124102;
		}
		
		/**
		 * get 当前任务消息
		 * @return 
		 */
		public function get taskInfo(): TaskInfo{
			return _taskInfo;
		}
		
		/**
		 * set 当前任务消息
		 */
		public function set taskInfo(value: TaskInfo): void{
			this._taskInfo = value;
		}
		
	}
}