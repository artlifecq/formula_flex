package com.rpgGame.netData.redreward.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 抢红包玩家数据信息
	 */
	public class RedRewardLog extends Bean {
	
		//领取者名字
		private var _playerName: String;
		
		//领取时间
		private var _time: long;
		
		//礼金数量
		private var _count: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取者名字
			writeString(_playerName);
			//领取时间
			writeLong(_time);
			//礼金数量
			writeInt(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取者名字
			_playerName = readString();
			//领取时间
			_time = readLong();
			//礼金数量
			_count = readInt();
			return true;
		}
		
		/**
		 * get 领取者名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 领取者名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 领取时间
		 * @return 
		 */
		public function get time(): long{
			return _time;
		}
		
		/**
		 * set 领取时间
		 */
		public function set time(value: long): void{
			this._time = value;
		}
		
		/**
		 * get 礼金数量
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 礼金数量
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}