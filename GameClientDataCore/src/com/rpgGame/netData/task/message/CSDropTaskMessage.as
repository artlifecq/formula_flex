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
	public class CSDropTaskMessage extends Message {
	
		//任务id
		private var _taskId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务id
			writeLong(_taskId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务id
			_taskId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124209;
		}
		
		/**
		 * get 任务id
		 * @return 
		 */
		public function get taskId(): long{
			return _taskId;
		}
		
		/**
		 * set 任务id
		 */
		public function set taskId(value: long): void{
			this._taskId = value;
		}
		
	}
}