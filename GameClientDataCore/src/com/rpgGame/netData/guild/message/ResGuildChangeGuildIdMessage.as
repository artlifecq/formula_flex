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
	 * 通知玩家帮派Id改变
	 */
	public class ResGuildChangeGuildIdMessage extends Message {
	
		//玩家Id
		private var _playerId: long;
		
		//玩家shortId
		private var _playerShortId: int;
		
		//帮派Id,-1:为离开帮派
		private var _guildId: long;
		
		//帮派名
		private var _guildName: String;
		
		//帮派职位
		private var _guildMemberType: int;
		
		//是否是统帅
		private var _leader: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//玩家shortId
			writeShort(_playerShortId);
			//帮派Id,-1:为离开帮派
			writeLong(_guildId);
			//帮派名
			writeString(_guildName);
			//帮派职位
			writeInt(_guildMemberType);
			//是否是统帅
			writeByte(_leader);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//玩家shortId
			_playerShortId = readShort();
			//帮派Id,-1:为离开帮派
			_guildId = readLong();
			//帮派名
			_guildName = readString();
			//帮派职位
			_guildMemberType = readInt();
			//是否是统帅
			_leader = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111106;
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
		 * get 玩家shortId
		 * @return 
		 */
		public function get playerShortId(): int{
			return _playerShortId;
		}
		
		/**
		 * set 玩家shortId
		 */
		public function set playerShortId(value: int): void{
			this._playerShortId = value;
		}
		
		/**
		 * get 帮派Id,-1:为离开帮派
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮派Id,-1:为离开帮派
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 帮派名
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮派名
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 帮派职位
		 * @return 
		 */
		public function get guildMemberType(): int{
			return _guildMemberType;
		}
		
		/**
		 * set 帮派职位
		 */
		public function set guildMemberType(value: int): void{
			this._guildMemberType = value;
		}
		
		/**
		 * get 是否是统帅
		 * @return 
		 */
		public function get leader(): int{
			return _leader;
		}
		
		/**
		 * set 是否是统帅
		 */
		public function set leader(value: int): void{
			this._leader = value;
		}
		
	}
}