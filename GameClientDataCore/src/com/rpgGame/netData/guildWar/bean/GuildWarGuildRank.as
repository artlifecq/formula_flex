package com.rpgGame.netData.guildWar.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会排行信息
	 */
	public class GuildWarGuildRank extends Bean {
	
		//排名
		private var _rank: int;
		
		//帮会名
		private var _guildName: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排名
			writeInt(_rank);
			//帮会名
			writeString(_guildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排名
			_rank = readInt();
			//帮会名
			_guildName = readString();
			return true;
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
		
	}
}