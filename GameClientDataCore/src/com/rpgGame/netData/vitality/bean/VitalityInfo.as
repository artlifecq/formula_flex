package com.rpgGame.netData.vitality.bean{
	import com.rpgGame.netData.vitality.bean.VitalityTaskInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活跃度信息
	 */
	public class VitalityInfo extends Bean {
	
		//当前活跃度
		private var _value: int;
		
		//历史活跃度
		private var _history: int;
		
		//已完成任务model_次数
		private var _finishedTaskList: Vector.<String> = new Vector.<String>();
		//已经领取的活跃度奖励
		private var _hasGetAwardList: Vector.<int> = new Vector.<int>();
		//活跃任务
		private var _taskInfos: Vector.<com.rpgGame.netData.vitality.bean.VitalityTaskInfo> = new Vector.<com.rpgGame.netData.vitality.bean.VitalityTaskInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前活跃度
			writeInt(_value);
			//历史活跃度
			writeInt(_history);
			//已完成任务model_次数
			writeShort(_finishedTaskList.length);
			for (var i: int = 0; i < _finishedTaskList.length; i++) {
				writeString(_finishedTaskList[i]);
			}
			//已经领取的活跃度奖励
			writeShort(_hasGetAwardList.length);
			for (var i: int = 0; i < _hasGetAwardList.length; i++) {
				writeInt(_hasGetAwardList[i]);
			}
			//活跃任务
			writeShort(_taskInfos.length);
			for (var i: int = 0; i < _taskInfos.length; i++) {
				writeBean(_taskInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前活跃度
			_value = readInt();
			//历史活跃度
			_history = readInt();
			//已完成任务model_次数
			var finishedTaskList_length : int = readShort();
			for (var i: int = 0; i < finishedTaskList_length; i++) {
				_finishedTaskList[i] = readString();
			}
			//已经领取的活跃度奖励
			var hasGetAwardList_length : int = readShort();
			for (var i: int = 0; i < hasGetAwardList_length; i++) {
				_hasGetAwardList[i] = readInt();
			}
			//活跃任务
			var taskInfos_length : int = readShort();
			for (var i: int = 0; i < taskInfos_length; i++) {
				_taskInfos[i] = readBean(com.rpgGame.netData.vitality.bean.VitalityTaskInfo) as com.rpgGame.netData.vitality.bean.VitalityTaskInfo;
			}
			return true;
		}
		
		/**
		 * get 当前活跃度
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 当前活跃度
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
		/**
		 * get 历史活跃度
		 * @return 
		 */
		public function get history(): int{
			return _history;
		}
		
		/**
		 * set 历史活跃度
		 */
		public function set history(value: int): void{
			this._history = value;
		}
		
		/**
		 * get 已完成任务model_次数
		 * @return 
		 */
		public function get finishedTaskList(): Vector.<String>{
			return _finishedTaskList;
		}
		
		/**
		 * set 已完成任务model_次数
		 */
		public function set finishedTaskList(value: Vector.<String>): void{
			this._finishedTaskList = value;
		}
		
		/**
		 * get 已经领取的活跃度奖励
		 * @return 
		 */
		public function get hasGetAwardList(): Vector.<int>{
			return _hasGetAwardList;
		}
		
		/**
		 * set 已经领取的活跃度奖励
		 */
		public function set hasGetAwardList(value: Vector.<int>): void{
			this._hasGetAwardList = value;
		}
		
		/**
		 * get 活跃任务
		 * @return 
		 */
		public function get taskInfos(): Vector.<com.rpgGame.netData.vitality.bean.VitalityTaskInfo>{
			return _taskInfos;
		}
		
		/**
		 * set 活跃任务
		 */
		public function set taskInfos(value: Vector.<com.rpgGame.netData.vitality.bean.VitalityTaskInfo>): void{
			this._taskInfos = value;
		}
		
	}
}