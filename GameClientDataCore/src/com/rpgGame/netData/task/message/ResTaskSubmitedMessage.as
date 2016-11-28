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
	 * 任务已完成消息
	 */
	public class ResTaskSubmitedMessage extends Message {
	
		//任务id
		private var _taskId: long;
		
		//玩家等级
		private var _playerLv: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务id
			writeLong(_taskId);
			//玩家等级
			writeInt(_playerLv);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务id
			_taskId = readLong();
			//玩家等级
			_playerLv = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124104;
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
		
		/**
		 * get 玩家等级
		 * @return 
		 */
		public function get playerLv(): int{
			return _playerLv;
		}
		
		/**
		 * set 玩家等级
		 */
		public function set playerLv(value: int): void{
			this._playerLv = value;
		}
		
	}
}