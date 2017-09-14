package com.rpgGame.netData.gameactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 七日豪礼信息
	 */
	public class SevenDayInfo extends Bean {
	
		//活动ID
		private var _activeId: int;
		
		//1 可领 2已领
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activeId);
			//1 可领 2已领
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activeId = readInt();
			//1 可领 2已领
			_state = readByte();
			return true;
		}
		
		/**
		 * get 活动ID
		 * @return 
		 */
		public function get activeId(): int{
			return _activeId;
		}
		
		/**
		 * set 活动ID
		 */
		public function set activeId(value: int): void{
			this._activeId = value;
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