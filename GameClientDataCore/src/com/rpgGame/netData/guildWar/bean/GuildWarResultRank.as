package com.rpgGame.netData.guildWar.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会战个人积分排名
	 */
	public class GuildWarResultRank extends Bean {
	
		//排名
		private var _rank: int;
		
		//玩家名
		private var _playerName: String;
		
		//玩家职业
		private var _playerJob: int;
		
		//击杀数
		private var _killCnt: int;
		
		//个人积分
		private var _score: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排名
			writeInt(_rank);
			//玩家名
			writeString(_playerName);
			//玩家职业
			writeByte(_playerJob);
			//击杀数
			writeInt(_killCnt);
			//个人积分
			writeInt(_score);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排名
			_rank = readInt();
			//玩家名
			_playerName = readString();
			//玩家职业
			_playerJob = readByte();
			//击杀数
			_killCnt = readInt();
			//个人积分
			_score = readInt();
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
		 * get 玩家名
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 玩家职业
		 * @return 
		 */
		public function get playerJob(): int{
			return _playerJob;
		}
		
		/**
		 * set 玩家职业
		 */
		public function set playerJob(value: int): void{
			this._playerJob = value;
		}
		
		/**
		 * get 击杀数
		 * @return 
		 */
		public function get killCnt(): int{
			return _killCnt;
		}
		
		/**
		 * set 击杀数
		 */
		public function set killCnt(value: int): void{
			this._killCnt = value;
		}
		
		/**
		 * get 个人积分
		 * @return 
		 */
		public function get score(): int{
			return _score;
		}
		
		/**
		 * set 个人积分
		 */
		public function set score(value: int): void{
			this._score = value;
		}
		
	}
}