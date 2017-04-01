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
	 * 广播周围玩家帮会信息变化
	 */
	public class ResRoundGuildChangeMessage extends Message {
	
		//玩家Id
		private var _playerId: long;
		
		//帮会Id
		private var _guildId: long;
		
		//帮会名称
		private var _guildName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//帮会Id
			writeLong(_guildId);
			//帮会名称
			writeString(_guildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//帮会Id
			_guildId = readLong();
			//帮会名称
			_guildName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111110;
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
		 * get 帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
	}
}