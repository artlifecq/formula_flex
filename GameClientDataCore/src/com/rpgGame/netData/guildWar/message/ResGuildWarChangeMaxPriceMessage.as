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
	 * 通知竞价改变
	 */
	public class ResGuildWarChangeMaxPriceMessage extends Message {
	
		//改变城市Id
		private var _cityId: int;
		
		//帮派Id
		private var _guildId: long;
		
		//帮派名
		private var _guildName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//改变城市Id
			writeInt(_cityId);
			//帮派Id
			writeLong(_guildId);
			//帮派名
			writeString(_guildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//改变城市Id
			_cityId = readInt();
			//帮派Id
			_guildId = readLong();
			//帮派名
			_guildName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253104;
		}
		
		/**
		 * get 改变城市Id
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 改变城市Id
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
		/**
		 * get 帮派Id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮派Id
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
		
	}
}