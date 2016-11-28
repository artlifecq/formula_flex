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
	 * 返回玩家身上当前所有任务信息
	 */
	public class ResTaskInformationMessage extends Message {
	
		//已接任务列表
		private var _acceptedList: Vector.<TaskInfo> = new Vector.<TaskInfo>();
		//最后完成主线任务id
		private var _taskModelId: int;
		
		//当天已经完成日常任务的次数
		private var _dailyTaskTimes: int;
		
		//当天已经完成帮会任务的次数
		private var _guildTaskTimes: int;
		
		//当天已经完成宝箱任务的次数
		private var _treasureTaskTimes: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//已接任务列表
			writeShort(_acceptedList.length);
			for (i = 0; i < _acceptedList.length; i++) {
				writeBean(_acceptedList[i]);
			}
			//最后完成主线任务id
			writeInt(_taskModelId);
			//当天已经完成日常任务的次数
			writeInt(_dailyTaskTimes);
			//当天已经完成帮会任务的次数
			writeInt(_guildTaskTimes);
			//当天已经完成宝箱任务的次数
			writeInt(_treasureTaskTimes);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//已接任务列表
			var acceptedList_length : int = readShort();
			for (i = 0; i < acceptedList_length; i++) {
				_acceptedList[i] = readBean(TaskInfo) as TaskInfo;
			}
			//最后完成主线任务id
			_taskModelId = readInt();
			//当天已经完成日常任务的次数
			_dailyTaskTimes = readInt();
			//当天已经完成帮会任务的次数
			_guildTaskTimes = readInt();
			//当天已经完成宝箱任务的次数
			_treasureTaskTimes = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124101;
		}
		
		/**
		 * get 已接任务列表
		 * @return 
		 */
		public function get acceptedList(): Vector.<TaskInfo>{
			return _acceptedList;
		}
		
		/**
		 * set 已接任务列表
		 */
		public function set acceptedList(value: Vector.<TaskInfo>): void{
			this._acceptedList = value;
		}
		
		/**
		 * get 最后完成主线任务id
		 * @return 
		 */
		public function get taskModelId(): int{
			return _taskModelId;
		}
		
		/**
		 * set 最后完成主线任务id
		 */
		public function set taskModelId(value: int): void{
			this._taskModelId = value;
		}
		
		/**
		 * get 当天已经完成日常任务的次数
		 * @return 
		 */
		public function get dailyTaskTimes(): int{
			return _dailyTaskTimes;
		}
		
		/**
		 * set 当天已经完成日常任务的次数
		 */
		public function set dailyTaskTimes(value: int): void{
			this._dailyTaskTimes = value;
		}
		
		/**
		 * get 当天已经完成帮会任务的次数
		 * @return 
		 */
		public function get guildTaskTimes(): int{
			return _guildTaskTimes;
		}
		
		/**
		 * set 当天已经完成帮会任务的次数
		 */
		public function set guildTaskTimes(value: int): void{
			this._guildTaskTimes = value;
		}
		
		/**
		 * get 当天已经完成宝箱任务的次数
		 * @return 
		 */
		public function get treasureTaskTimes(): int{
			return _treasureTaskTimes;
		}
		
		/**
		 * set 当天已经完成宝箱任务的次数
		 */
		public function set treasureTaskTimes(value: int): void{
			this._treasureTaskTimes = value;
		}
		
	}
}