package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会搜索信息
	 */
	public class GuildSearchInfo extends Bean {
	
		//帮会id
		private var _guildId: long;
		
		//帮会名
		private var _guildName: String;
		
		//帮旗等级
		private var _guildFlagLevel: int;
		
		//帮旗名称
		private var _guildFlagName: String;
		
		//帮会等级
		private var _level: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会id
			writeLong(_guildId);
			//帮会名
			writeString(_guildName);
			//帮旗等级
			writeInt(_guildFlagLevel);
			//帮旗名称
			writeString(_guildFlagName);
			//帮会等级
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会id
			_guildId = readLong();
			//帮会名
			_guildName = readString();
			//帮旗等级
			_guildFlagLevel = readInt();
			//帮旗名称
			_guildFlagName = readString();
			//帮会等级
			_level = readInt();
			return true;
		}
		
		/**
		 * get 帮会id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮会id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 帮会名
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 帮旗等级
		 * @return 
		 */
		public function get guildFlagLevel(): int{
			return _guildFlagLevel;
		}
		
		/**
		 * set 帮旗等级
		 */
		public function set guildFlagLevel(value: int): void{
			this._guildFlagLevel = value;
		}
		
		/**
		 * get 帮旗名称
		 * @return 
		 */
		public function get guildFlagName(): String{
			return _guildFlagName;
		}
		
		/**
		 * set 帮旗名称
		 */
		public function set guildFlagName(value: String): void{
			this._guildFlagName = value;
		}
		
		/**
		 * get 帮会等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 帮会等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}