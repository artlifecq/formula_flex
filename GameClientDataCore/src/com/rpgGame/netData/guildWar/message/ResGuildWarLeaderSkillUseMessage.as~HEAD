package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知统帅使用技能
	 */
	public class ResGuildWarLeaderSkillUseMessage extends Message {
	
		//统帅Id
		private var _leaderPlayerId: long;
		
		//统帅名字
		private var _leaderPlayerName: String;
		
		//统帅职业
		private var _leaderPlayerJob: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//统帅Id
			writeLong(_leaderPlayerId);
			//统帅名字
			writeString(_leaderPlayerName);
			//统帅职业
			writeByte(_leaderPlayerJob);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//统帅Id
			_leaderPlayerId = readLong();
			//统帅名字
			_leaderPlayerName = readString();
			//统帅职业
			_leaderPlayerJob = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253113;
		}
		
		/**
		 * get 统帅Id
		 * @return 
		 */
		public function get leaderPlayerId(): long{
			return _leaderPlayerId;
		}
		
		/**
		 * set 统帅Id
		 */
		public function set leaderPlayerId(value: long): void{
			this._leaderPlayerId = value;
		}
		
		/**
		 * get 统帅名字
		 * @return 
		 */
		public function get leaderPlayerName(): String{
			return _leaderPlayerName;
		}
		
		/**
		 * set 统帅名字
		 */
		public function set leaderPlayerName(value: String): void{
			this._leaderPlayerName = value;
		}
		
		/**
		 * get 统帅职业
		 * @return 
		 */
		public function get leaderPlayerJob(): int{
			return _leaderPlayerJob;
		}
		
		/**
		 * set 统帅职业
		 */
		public function set leaderPlayerJob(value: int): void{
			this._leaderPlayerJob = value;
		}
		
	}
}