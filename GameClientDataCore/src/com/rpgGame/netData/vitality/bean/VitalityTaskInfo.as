package com.rpgGame.netData.vitality.bean{
	
	
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
	public class VitalityTaskInfo extends Bean {
	
		//任务ModelId
		private var _model: int;
		
		//完成次数
		private var _count: int;
		
		//领奖状态(单个任务的奖励0不可领取 1可领取 2已领取)
		private var _state: Vector.<int> = new Vector.<int>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//任务ModelId
			writeInt(_model);
			//完成次数
			writeInt(_count);
			//领奖状态(单个任务的奖励0不可领取 1可领取 2已领取)
			writeShort(_state.length);
			for (var i: int = 0; i < _state.length; i++) {
				writeByte(_state[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//任务ModelId
			_model = readInt();
			//完成次数
			_count = readInt();
			//领奖状态(单个任务的奖励0不可领取 1可领取 2已领取)
			var state_length : int = readShort();
			for (var i: int = 0; i < state_length; i++) {
				_state[i] = readByte();
			}
			return true;
		}
		
		/**
		 * get 任务ModelId
		 * @return 
		 */
		public function get model(): int{
			return _model;
		}
		
		/**
		 * set 任务ModelId
		 */
		public function set model(value: int): void{
			this._model = value;
		}
		
		/**
		 * get 完成次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 完成次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 领奖状态(单个任务的奖励0不可领取 1可领取 2已领取)
		 * @return 
		 */
		public function get state(): Vector.<int>{
			return _state;
		}
		
		/**
		 * set 领奖状态(单个任务的奖励0不可领取 1可领取 2已领取)
		 */
		public function set state(value: Vector.<int>): void{
			this._state = value;
		}
		
	}
}