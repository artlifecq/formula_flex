package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 添加帮会成员
	 */
	public class ReqGuildAddMemberMessage extends Message {
	
		//帮会Id
		private var _guildId: long;
		
		//被操作玩家ID
		private var _playerId: long;
		
		//是否同意(0 否 1 是)
		private var _argee: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会Id
			writeLong(_guildId);
			//被操作玩家ID
			writeLong(_playerId);
			//是否同意(0 否 1 是)
			writeByte(_argee);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会Id
			_guildId = readLong();
			//被操作玩家ID
			_playerId = readLong();
			//是否同意(0 否 1 是)
			_argee = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111207;
		}
		
		/**
		 * get 帮会Id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮会Id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 被操作玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 被操作玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 是否同意(0 否 1 是)
		 * @return 
		 */
		public function get argee(): int{
			return _argee;
		}
		
		/**
		 * set 是否同意(0 否 1 是)
		 */
		public function set argee(value: int): void{
			this._argee = value;
		}
		
	}
}