package com.rpgGame.netData.guildWar.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 王城报名信息
	 */
	public class GuildWarCityApplyInfo extends Bean {
	
		//王城Id
		private var _id: int;
		
		//王城名
		private var _name: String;
		
		//占领帮派名
		private var _occupyGuildName: String;
		
		//占领帮派Id
		private var _occupyGuildId: long;
		
		//当前出价最高帮派名
		private var _curMaxPriceGuildName: String;
		
		//当前出价最高帮派Id
		private var _curMaxPriceGuildId: long;
		
		//当前最高价
		private var _curMaxPrice: int;
		
		//结束时间点(s)
		private var _overTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//王城Id
			writeInt(_id);
			//王城名
			writeString(_name);
			//占领帮派名
			writeString(_occupyGuildName);
			//占领帮派Id
			writeLong(_occupyGuildId);
			//当前出价最高帮派名
			writeString(_curMaxPriceGuildName);
			//当前出价最高帮派Id
			writeLong(_curMaxPriceGuildId);
			//当前最高价
			writeInt(_curMaxPrice);
			//结束时间点(s)
			writeInt(_overTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//王城Id
			_id = readInt();
			//王城名
			_name = readString();
			//占领帮派名
			_occupyGuildName = readString();
			//占领帮派Id
			_occupyGuildId = readLong();
			//当前出价最高帮派名
			_curMaxPriceGuildName = readString();
			//当前出价最高帮派Id
			_curMaxPriceGuildId = readLong();
			//当前最高价
			_curMaxPrice = readInt();
			//结束时间点(s)
			_overTime = readInt();
			return true;
		}
		
		/**
		 * get 王城Id
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 王城Id
		 */
		public function set id(value: int): void{
			this._id = value;
		}
		
		/**
		 * get 王城名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 王城名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 占领帮派名
		 * @return 
		 */
		public function get occupyGuildName(): String{
			return _occupyGuildName;
		}
		
		/**
		 * set 占领帮派名
		 */
		public function set occupyGuildName(value: String): void{
			this._occupyGuildName = value;
		}
		
		/**
		 * get 占领帮派Id
		 * @return 
		 */
		public function get occupyGuildId(): long{
			return _occupyGuildId;
		}
		
		/**
		 * set 占领帮派Id
		 */
		public function set occupyGuildId(value: long): void{
			this._occupyGuildId = value;
		}
		
		/**
		 * get 当前出价最高帮派名
		 * @return 
		 */
		public function get curMaxPriceGuildName(): String{
			return _curMaxPriceGuildName;
		}
		
		/**
		 * set 当前出价最高帮派名
		 */
		public function set curMaxPriceGuildName(value: String): void{
			this._curMaxPriceGuildName = value;
		}
		
		/**
		 * get 当前出价最高帮派Id
		 * @return 
		 */
		public function get curMaxPriceGuildId(): long{
			return _curMaxPriceGuildId;
		}
		
		/**
		 * set 当前出价最高帮派Id
		 */
		public function set curMaxPriceGuildId(value: long): void{
			this._curMaxPriceGuildId = value;
		}
		
		/**
		 * get 当前最高价
		 * @return 
		 */
		public function get curMaxPrice(): int{
			return _curMaxPrice;
		}
		
		/**
		 * set 当前最高价
		 */
		public function set curMaxPrice(value: int): void{
			this._curMaxPrice = value;
		}
		
		/**
		 * get 结束时间点(s)
		 * @return 
		 */
		public function get overTime(): int{
			return _overTime;
		}
		
		/**
		 * set 结束时间点(s)
		 */
		public function set overTime(value: int): void{
			this._overTime = value;
		}
		
	}
}