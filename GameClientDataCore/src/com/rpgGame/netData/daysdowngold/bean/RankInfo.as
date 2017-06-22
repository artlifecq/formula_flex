package com.rpgGame.netData.daysdowngold.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 礼金排名信息
	 */
	public class RankInfo extends Bean {
	
		//玩家名称
		private var _name: String;
		
		//帮会名称
		private var _guildName: String;
		
		//获得的礼金数量
		private var _cashGiftNum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家名称
			writeString(_name);
			//帮会名称
			writeString(_guildName);
			//获得的礼金数量
			writeInt(_cashGiftNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家名称
			_name = readString();
			//帮会名称
			_guildName = readString();
			//获得的礼金数量
			_cashGiftNum = readInt();
			return true;
		}
		
		/**
		 * get 玩家名称
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名称
		 */
		public function set name(value: String): void{
			this._name = value;
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
		
		/**
		 * get 获得的礼金数量
		 * @return 
		 */
		public function get cashGiftNum(): int{
			return _cashGiftNum;
		}
		
		/**
		 * set 获得的礼金数量
		 */
		public function set cashGiftNum(value: int): void{
			this._cashGiftNum = value;
		}
		
	}
}