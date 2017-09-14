package com.rpgGame.netData.gameactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 成长礼包信息
	 */
	public class GrownInfo extends Bean {
	
		//活动ID
		private var _level: int;
		
		//0不能领取1 可领 2已领
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_level);
			//0不能领取1 可领 2已领
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_level = readInt();
			//0不能领取1 可领 2已领
			_state = readByte();
			return true;
		}
		
		/**
		 * get 活动ID
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 活动ID
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 0不能领取1 可领 2已领
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 0不能领取1 可领 2已领
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}