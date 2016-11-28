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
	 * 请求一键完成任务
	 */
	public class ReqQuickfinishTaskMessage extends Message {
	
		//任务唯一id
		private var _taskId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务唯一id
			writeLong(_taskId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务唯一id
			_taskId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124204;
		}
		
		/**
		 * get 任务唯一id
		 * @return 
		 */
		public function get taskId(): long{
			return _taskId;
		}
		
		/**
		 * set 任务唯一id
		 */
		public function set taskId(value: long): void{
			this._taskId = value;
		}
		
	}
}