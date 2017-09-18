package com.rpgGame.netData.sign.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 签到信息
	 */
	public class SignInfo extends Bean {
	
		//本月剩余补签次数
		private var _signAddNum: int;
		
		//本月累计签到次数
		private var _monthSignSum: int;
		
		//历史累计签到次数
		private var _historySignSum: int;
		
		//提前签到次数
		private var _strikeSignSum: int;
		
		//已经签到过的号数(1-31)
		private var _dayList: Vector.<int> = new Vector.<int>();
		//已经领取的累计签到天数奖励
		private var _sumList: Vector.<int> = new Vector.<int>();
		//首签奖励领取  1领取 0未领
		private var _firstAward: int;
		
		//VIP奖励领取  1领取 0未领
		private var _vipAward: int;
		
		//开服时间
		private var _openTime: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//本月剩余补签次数
			writeInt(_signAddNum);
			//本月累计签到次数
			writeInt(_monthSignSum);
			//历史累计签到次数
			writeInt(_historySignSum);
			//提前签到次数
			writeInt(_strikeSignSum);
			//已经签到过的号数(1-31)
			writeShort(_dayList.length);
			for (var i: int = 0; i < _dayList.length; i++) {
				writeInt(_dayList[i]);
			}
			//已经领取的累计签到天数奖励
			writeShort(_sumList.length);
			for (var i: int = 0; i < _sumList.length; i++) {
				writeInt(_sumList[i]);
			}
			//首签奖励领取  1领取 0未领
			writeByte(_firstAward);
			//VIP奖励领取  1领取 0未领
			writeByte(_vipAward);
			//开服时间
			writeLong(_openTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//本月剩余补签次数
			_signAddNum = readInt();
			//本月累计签到次数
			_monthSignSum = readInt();
			//历史累计签到次数
			_historySignSum = readInt();
			//提前签到次数
			_strikeSignSum = readInt();
			//已经签到过的号数(1-31)
			var dayList_length : int = readShort();
			for (var i: int = 0; i < dayList_length; i++) {
				_dayList[i] = readInt();
			}
			//已经领取的累计签到天数奖励
			var sumList_length : int = readShort();
			for (var i: int = 0; i < sumList_length; i++) {
				_sumList[i] = readInt();
			}
			//首签奖励领取  1领取 0未领
			_firstAward = readByte();
			//VIP奖励领取  1领取 0未领
			_vipAward = readByte();
			//开服时间
			_openTime = readLong();
			return true;
		}
		
		/**
		 * get 本月剩余补签次数
		 * @return 
		 */
		public function get signAddNum(): int{
			return _signAddNum;
		}
		
		/**
		 * set 本月剩余补签次数
		 */
		public function set signAddNum(value: int): void{
			this._signAddNum = value;
		}
		
		/**
		 * get 本月累计签到次数
		 * @return 
		 */
		public function get monthSignSum(): int{
			return _monthSignSum;
		}
		
		/**
		 * set 本月累计签到次数
		 */
		public function set monthSignSum(value: int): void{
			this._monthSignSum = value;
		}
		
		/**
		 * get 历史累计签到次数
		 * @return 
		 */
		public function get historySignSum(): int{
			return _historySignSum;
		}
		
		/**
		 * set 历史累计签到次数
		 */
		public function set historySignSum(value: int): void{
			this._historySignSum = value;
		}
		
		/**
		 * get 提前签到次数
		 * @return 
		 */
		public function get strikeSignSum(): int{
			return _strikeSignSum;
		}
		
		/**
		 * set 提前签到次数
		 */
		public function set strikeSignSum(value: int): void{
			this._strikeSignSum = value;
		}
		
		/**
		 * get 已经签到过的号数(1-31)
		 * @return 
		 */
		public function get dayList(): Vector.<int>{
			return _dayList;
		}
		
		/**
		 * set 已经签到过的号数(1-31)
		 */
		public function set dayList(value: Vector.<int>): void{
			this._dayList = value;
		}
		
		/**
		 * get 已经领取的累计签到天数奖励
		 * @return 
		 */
		public function get sumList(): Vector.<int>{
			return _sumList;
		}
		
		/**
		 * set 已经领取的累计签到天数奖励
		 */
		public function set sumList(value: Vector.<int>): void{
			this._sumList = value;
		}
		
		/**
		 * get 首签奖励领取  1领取 0未领
		 * @return 
		 */
		public function get firstAward(): int{
			return _firstAward;
		}
		
		/**
		 * set 首签奖励领取  1领取 0未领
		 */
		public function set firstAward(value: int): void{
			this._firstAward = value;
		}
		
		/**
		 * get VIP奖励领取  1领取 0未领
		 * @return 
		 */
		public function get vipAward(): int{
			return _vipAward;
		}
		
		/**
		 * set VIP奖励领取  1领取 0未领
		 */
		public function set vipAward(value: int): void{
			this._vipAward = value;
		}
		
		/**
		 * get 开服时间
		 * @return 
		 */
		public function get openTime(): long{
			return _openTime;
		}
		
		/**
		 * set 开服时间
		 */
		public function set openTime(value: long): void{
			this._openTime = value;
		}
		
	}
}