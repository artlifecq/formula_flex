package com.rpgGame.netData.yaota.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 妖塔数据
	 */
	public class YaoTaInfo extends Bean {
	
		//排名
		private var _rank: int;
		
		//玩家名字
		private var _playerName: String;
		
		//最高层数
		private var _tier: int;
		
		//击杀数
		private var _killNumber: int;
		
		//积分
		private var _integral: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排名
			writeInt(_rank);
			//玩家名字
			writeString(_playerName);
			//最高层数
			writeInt(_tier);
			//击杀数
			writeInt(_killNumber);
			//积分
			writeInt(_integral);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排名
			_rank = readInt();
			//玩家名字
			_playerName = readString();
			//最高层数
			_tier = readInt();
			//击杀数
			_killNumber = readInt();
			//积分
			_integral = readInt();
			return true;
		}
		
		/**
		 * get 排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 最高层数
		 * @return 
		 */
		public function get tier(): int{
			return _tier;
		}
		
		/**
		 * set 最高层数
		 */
		public function set tier(value: int): void{
			this._tier = value;
		}
		
		/**
		 * get 击杀数
		 * @return 
		 */
		public function get killNumber(): int{
			return _killNumber;
		}
		
		/**
		 * set 击杀数
		 */
		public function set killNumber(value: int): void{
			this._killNumber = value;
		}
		
		/**
		 * get 积分
		 * @return 
		 */
		public function get integral(): int{
			return _integral;
		}
		
		/**
		 * set 积分
		 */
		public function set integral(value: int): void{
			this._integral = value;
		}
		
	}
}