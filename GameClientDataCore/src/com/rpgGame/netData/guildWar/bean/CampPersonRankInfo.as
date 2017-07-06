package com.rpgGame.netData.guildWar.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 阵营玩家排名信息
	 */
	public class CampPersonRankInfo extends Bean {
	
		//玩家Id
		private var _playerId: long;
		
		//玩家名
		private var _playerName: String;
		
		//阵营Id
		private var _campId: int;
		
		//排名
		private var _rank: int;
		
		//积分
		private var _score: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//玩家名
			writeString(_playerName);
			//阵营Id
			writeInt(_campId);
			//排名
			writeInt(_rank);
			//积分
			writeInt(_score);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//玩家名
			_playerName = readString();
			//阵营Id
			_campId = readInt();
			//排名
			_rank = readInt();
			//积分
			_score = readInt();
			return true;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
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
		 * get 阵营Id
		 * @return 
		 */
		public function get campId(): int{
			return _campId;
		}
		
		/**
		 * set 阵营Id
		 */
		public function set campId(value: int): void{
			this._campId = value;
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
		 * get 积分
		 * @return 
		 */
		public function get score(): int{
			return _score;
		}
		
		/**
		 * set 积分
		 */
		public function set score(value: int): void{
			this._score = value;
		}
		
	}
}