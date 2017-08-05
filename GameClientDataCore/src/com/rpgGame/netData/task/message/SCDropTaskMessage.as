package com.rpgGame.netData.task.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 放弃任务
	 */
	public class SCDropTaskMessage extends Message {
	
		//放弃任务的id
		private var _taskId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//放弃任务的id
			writeLong(_taskId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//放弃任务的id
			_taskId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124109;
		}
		
		/**
		 * get 放弃任务的id
		 * @return 
		 */
		public function get taskId(): long{
			return _taskId;
		}
		
		/**
		 * set 放弃任务的id
		 */
		public function set taskId(value: long): void{
			this._taskId = value;
		}
		
	}
}