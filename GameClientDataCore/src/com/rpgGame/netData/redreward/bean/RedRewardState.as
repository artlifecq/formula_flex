package com.rpgGame.netData.redreward.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 红包状态信息
	 */
	public class RedRewardState extends Bean {
	
		//发红包玩家名称
		private var _playerName: String;
		
		//红包状态(0未领取，1领取)
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//发红包玩家名称
			writeString(_playerName);
			//红包状态(0未领取，1领取)
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//发红包玩家名称
			_playerName = readString();
			//红包状态(0未领取，1领取)
			_state = readByte();
			return true;
		}
		
		/**
		 * get 发红包玩家名称
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 发红包玩家名称
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 红包状态(0未领取，1领取)
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 红包状态(0未领取，1领取)
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}