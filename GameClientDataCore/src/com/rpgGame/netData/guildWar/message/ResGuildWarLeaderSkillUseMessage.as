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
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//统帅Id
			writeLong(_leaderPlayerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//统帅Id
			_leaderPlayerId = readLong();
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
		
	}
}