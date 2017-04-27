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
	 * 请求完成任务
	 */
	public class ReqfinishTaskMessage extends Message {
	
		//任务唯一id
		private var _taskId: long;
		
		//领取奖励倍数
		private var _multiple: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务唯一id
			writeLong(_taskId);
			//领取奖励倍数
			writeInt(_multiple);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务唯一id
			_taskId = readLong();
			//领取奖励倍数
			_multiple = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124203;
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
		
		/**
		 * get 领取奖励倍数
		 * @return 
		 */
		public function get multiple(): int{
			return _multiple;
		}
		
		/**
		 * set 领取奖励倍数
		 */
		public function set multiple(value: int): void{
			this._multiple = value;
		}
		
	}
}