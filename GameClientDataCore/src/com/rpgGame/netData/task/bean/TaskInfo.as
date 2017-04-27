package com.rpgGame.netData.task.bean{
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 任务消息
	 */
	public class TaskInfo extends Bean {
	
		//任务唯一id
		private var _taskId: long;
		
		//任务模板id
		private var _taskModelId: int;
		
		//任务子类型
		private var _taskSubType: int;
		
		//剩余时间(秒),-1 无限 0过期 大于0有剩余时间
		private var _remainTiime: int;
		
		//环式任务id
		private var _loopRewardId: String;
		
		//环式任务当前环数
		private var _loopNumber: int;
		
		//子类型完成进度
		private var _taskSubRateInfolist: Vector.<TaskSubRateInfo> = new Vector.<TaskSubRateInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务唯一id
			writeLong(_taskId);
			//任务模板id
			writeInt(_taskModelId);
			//任务子类型
			writeInt(_taskSubType);
			//剩余时间(秒),-1 无限 0过期 大于0有剩余时间
			writeInt(_remainTiime);
			//环式任务id
			writeString(_loopRewardId);
			//环式任务当前环数
			writeInt(_loopNumber);
			//子类型完成进度
			writeShort(_taskSubRateInfolist.length);
			for (var i: int = 0; i < _taskSubRateInfolist.length; i++) {
				writeBean(_taskSubRateInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务唯一id
			_taskId = readLong();
			//任务模板id
			_taskModelId = readInt();
			//任务子类型
			_taskSubType = readInt();
			//剩余时间(秒),-1 无限 0过期 大于0有剩余时间
			_remainTiime = readInt();
			//环式任务id
			_loopRewardId = readString();
			//环式任务当前环数
			_loopNumber = readInt();
			//子类型完成进度
			var taskSubRateInfolist_length : int = readShort();
			for (var i: int = 0; i < taskSubRateInfolist_length; i++) {
				_taskSubRateInfolist[i] = readBean(TaskSubRateInfo) as TaskSubRateInfo;
			}
			return true;
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
		 * get 任务模板id
		 * @return 
		 */
		public function get taskModelId(): int{
			return _taskModelId;
		}
		
		/**
		 * set 任务模板id
		 */
		public function set taskModelId(value: int): void{
			this._taskModelId = value;
		}
		
		/**
		 * get 任务子类型
		 * @return 
		 */
		public function get taskSubType(): int{
			return _taskSubType;
		}
		
		/**
		 * set 任务子类型
		 */
		public function set taskSubType(value: int): void{
			this._taskSubType = value;
		}
		
		/**
		 * get 剩余时间(秒),-1 无限 0过期 大于0有剩余时间
		 * @return 
		 */
		public function get remainTiime(): int{
			return _remainTiime;
		}
		
		/**
		 * set 剩余时间(秒),-1 无限 0过期 大于0有剩余时间
		 */
		public function set remainTiime(value: int): void{
			this._remainTiime = value;
		}
		
		/**
		 * get 环式任务id
		 * @return 
		 */
		public function get loopRewardId(): String{
			return _loopRewardId;
		}
		
		/**
		 * set 环式任务id
		 */
		public function set loopRewardId(value: String): void{
			this._loopRewardId = value;
		}
		
		/**
		 * get 环式任务当前环数
		 * @return 
		 */
		public function get loopNumber(): int{
			return _loopNumber;
		}
		
		/**
		 * set 环式任务当前环数
		 */
		public function set loopNumber(value: int): void{
			this._loopNumber = value;
		}
		
		/**
		 * get 子类型完成进度
		 * @return 
		 */
		public function get taskSubRateInfolist(): Vector.<TaskSubRateInfo>{
			return _taskSubRateInfolist;
		}
		
		/**
		 * set 子类型完成进度
		 */
		public function set taskSubRateInfolist(value: Vector.<TaskSubRateInfo>): void{
			this._taskSubRateInfolist = value;
		}
		
	}
}