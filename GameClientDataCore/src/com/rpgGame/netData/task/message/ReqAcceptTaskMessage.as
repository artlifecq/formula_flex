package com.rpgGame.netData.task.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求接受任务
	 */
	public class ReqAcceptTaskMessage extends Message {
	
		//任务id
		private var _taskModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务id
			writeInt(_taskModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务id
			_taskModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124202;
		}
		
		/**
		 * get 任务id
		 * @return 
		 */
		public function get taskModelId(): int{
			return _taskModelId;
		}
		
		/**
		 * set 任务id
		 */
		public function set taskModelId(value: int): void{
			this._taskModelId = value;
		}
		
	}
}