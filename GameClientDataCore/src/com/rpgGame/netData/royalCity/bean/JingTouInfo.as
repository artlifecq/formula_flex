package com.rpgGame.netData.royalCity.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 竞投信息
	 */
	public class JingTouInfo extends Bean {
	
		//城市ID
		private var _cityId: int;
		
		//当前占领帮会
		private var _guildName: String;
		
		//最大竞投资财数量
		private var _maxZiCai: int;
		
		//本帮竞投资财数量
		private var _ownZiCai: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//城市ID
			writeInt(_cityId);
			//当前占领帮会
			writeString(_guildName);
			//最大竞投资财数量
			writeInt(_maxZiCai);
			//本帮竞投资财数量
			writeInt(_ownZiCai);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//城市ID
			_cityId = readInt();
			//当前占领帮会
			_guildName = readString();
			//最大竞投资财数量
			_maxZiCai = readInt();
			//本帮竞投资财数量
			_ownZiCai = readInt();
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
		 * get 当前占领帮会
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 当前占领帮会
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 最大竞投资财数量
		 * @return 
		 */
		public function get maxZiCai(): int{
			return _maxZiCai;
		}
		
		/**
		 * set 最大竞投资财数量
		 */
		public function set maxZiCai(value: int): void{
			this._maxZiCai = value;
		}
		
		/**
		 * get 本帮竞投资财数量
		 * @return 
		 */
		public function get ownZiCai(): int{
			return _ownZiCai;
		}
		
		/**
		 * set 本帮竞投资财数量
		 */
		public function set ownZiCai(value: int): void{
			this._ownZiCai = value;
		}
		
	}
}