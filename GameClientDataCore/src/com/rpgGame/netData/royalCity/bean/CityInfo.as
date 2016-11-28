package com.rpgGame.netData.royalCity.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 城市信息
	 */
	public class CityInfo extends Bean {
	
		//城市ID
		private var _cityId: int;
		
		//占领帮会ID
		private var _guildId: long;
		
		//占领帮会名称
		private var _guildName: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//城市ID
			writeInt(_cityId);
			//占领帮会ID
			writeLong(_guildId);
			//占领帮会名称
			writeString(_guildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//城市ID
			_cityId = readInt();
			//占领帮会ID
			_guildId = readLong();
			//占领帮会名称
			_guildName = readString();
			return true;
		}
		
		/**
		 * get 城市ID
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 城市ID
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
		/**
		 * get 占领帮会ID
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 占领帮会ID
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 占领帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 占领帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
	}
}