package com.rpgGame.netData.dailyzone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用日常副本面板信息
	 */
	public class DailyZonePanelInfo extends Bean {
		
		//日常副本ID编号
		private var _dailyzoneId: int;
		
		//0未首通,1首通
		private var _havePassed: int;
		
		//星数
		private var _star: int;
		
		//剩余次数
		private var _remainCount: int;
		
		//可购买剩余次数
		private var _canBuyCount: int;
		
		//今日通关 0未通,1通
		private var _todayPassed: int;
		
		//次数购买单价
		private var _price: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//日常副本ID编号
			writeInt(_dailyzoneId);
			//0未首通,1首通
			writeByte(_havePassed);
			//星数
			writeByte(_star);
			//剩余次数
			writeByte(_remainCount);
			//可购买剩余次数
			writeByte(_canBuyCount);
			//今日通关 0未通,1通
			writeByte(_todayPassed);
			//次数购买单价
			writeInt(_price);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//日常副本ID编号
			_dailyzoneId = readInt();
			//0未首通,1首通
			_havePassed = readByte();
			//星数
			_star = readByte();
			//剩余次数
			_remainCount = readByte();
			//可购买剩余次数
			_canBuyCount = readByte();
			//今日通关 0未通,1通
			_todayPassed = readByte();
			//次数购买单价
			_price = readInt();
			return true;
		}
		
		/**
		 * get 日常副本ID编号
		 * @return 
		 */
		public function get dailyzoneId(): int{
			return _dailyzoneId;
		}
		
		/**
		 * set 日常副本ID编号
		 */
		public function set dailyzoneId(value: int): void{
			this._dailyzoneId = value;
		}
		
		/**
		 * get 0未首通,1首通
		 * @return 
		 */
		public function get havePassed(): int{
			return _havePassed;
		}
		
		/**
		 * set 0未首通,1首通
		 */
		public function set havePassed(value: int): void{
			this._havePassed = value;
		}
		
		/**
		 * get 星数
		 * @return 
		 */
		public function get star(): int{
			return _star;
		}
		
		/**
		 * set 星数
		 */
		public function set star(value: int): void{
			this._star = value;
		}
		
		/**
		 * get 剩余次数
		 * @return 
		 */
		public function get remainCount(): int{
			return _remainCount;
		}
		
		/**
		 * set 剩余次数
		 */
		public function set remainCount(value: int): void{
			this._remainCount = value;
		}
		
		/**
		 * get 可购买剩余次数
		 * @return 
		 */
		public function get canBuyCount(): int{
			return _canBuyCount;
		}
		
		/**
		 * set 可购买剩余次数
		 */
		public function set canBuyCount(value: int): void{
			this._canBuyCount = value;
		}
		
		/**
		 * get 今日通关 0未通,1通
		 * @return 
		 */
		public function get todayPassed(): int{
			return _todayPassed;
		}
		
		/**
		 * set 今日通关 0未通,1通
		 */
		public function set todayPassed(value: int): void{
			this._todayPassed = value;
		}
		
		/**
		 * get 次数购买单价
		 * @return 
		 */
		public function get price(): int{
			return _price;
		}
		
		/**
		 * set 次数购买单价
		 */
		public function set price(value: int): void{
			this._price = value;
		}
		
	}
}