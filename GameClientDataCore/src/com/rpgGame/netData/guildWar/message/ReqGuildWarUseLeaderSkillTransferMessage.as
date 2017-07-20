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
	 * 请求使用统帅技能传送
	 */
	public class ReqGuildWarUseLeaderSkillTransferMessage extends Message {
	
		//统帅Id
		private var _leaderPlayerId: long;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//统帅Id
			writeLong(_leaderPlayerId);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//统帅Id
			_leaderPlayerId = readLong();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253209;
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
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}