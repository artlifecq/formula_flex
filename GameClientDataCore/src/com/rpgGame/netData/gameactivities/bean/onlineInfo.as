package com.rpgGame.netData.gameactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 在线信息
	 */
	public class onlineInfo extends Bean {
	
		//在线时长
		private var _time: int;
		
		//1 可领 2已领
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//在线时长
			writeInt(_time);
			//1 可领 2已领
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//在线时长
			_time = readInt();
			//1 可领 2已领
			_state = readByte();
			return true;
		}
		
		/**
		 * get 在线时长
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 在线时长
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 1 可领 2已领
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 1 可领 2已领
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}