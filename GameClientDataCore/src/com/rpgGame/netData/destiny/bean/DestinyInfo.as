package com.rpgGame.netData.destiny.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 天命任务数据
	 */
	public class DestinyInfo extends Bean {
	
		//当前天命任务状态 0-未接受 1-已接受未达成 2-已达成未领奖 3-已领奖
		private var _taskState: int;
		
		//当前天命任务编号
		private var _taskId: String;
		
		//当前天命奖励编号
		private var _rewardId: int;
		
		//任务到期时间
		private var _limitTime: long;
		
		//任务进度
		private var _progress: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前天命任务状态 0-未接受 1-已接受未达成 2-已达成未领奖 3-已领奖
			writeByte(_taskState);
			//当前天命任务编号
			writeString(_taskId);
			//当前天命奖励编号
			writeInt(_rewardId);
			//任务到期时间
			writeLong(_limitTime);
			//任务进度
			writeInt(_progress);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前天命任务状态 0-未接受 1-已接受未达成 2-已达成未领奖 3-已领奖
			_taskState = readByte();
			//当前天命任务编号
			_taskId = readString();
			//当前天命奖励编号
			_rewardId = readInt();
			//任务到期时间
			_limitTime = readLong();
			//任务进度
			_progress = readInt();
			return true;
		}
		
		/**
		 * get 当前天命任务状态 0-未接受 1-已接受未达成 2-已达成未领奖 3-已领奖
		 * @return 
		 */
		public function get taskState(): int{
			return _taskState;
		}
		
		/**
		 * set 当前天命任务状态 0-未接受 1-已接受未达成 2-已达成未领奖 3-已领奖
		 */
		public function set taskState(value: int): void{
			this._taskState = value;
		}
		
		/**
		 * get 当前天命任务编号
		 * @return 
		 */
		public function get taskId(): String{
			return _taskId;
		}
		
		/**
		 * set 当前天命任务编号
		 */
		public function set taskId(value: String): void{
			this._taskId = value;
		}
		
		/**
		 * get 当前天命奖励编号
		 * @return 
		 */
		public function get rewardId(): int{
			return _rewardId;
		}
		
		/**
		 * set 当前天命奖励编号
		 */
		public function set rewardId(value: int): void{
			this._rewardId = value;
		}
		
		/**
		 * get 任务到期时间
		 * @return 
		 */
		public function get limitTime(): long{
			return _limitTime;
		}
		
		/**
		 * set 任务到期时间
		 */
		public function set limitTime(value: long): void{
			this._limitTime = value;
		}
		
		/**
		 * get 任务进度
		 * @return 
		 */
		public function get progress(): int{
			return _progress;
		}
		
		/**
		 * set 任务进度
		 */
		public function set progress(value: int): void{
			this._progress = value;
		}
		
	}
}