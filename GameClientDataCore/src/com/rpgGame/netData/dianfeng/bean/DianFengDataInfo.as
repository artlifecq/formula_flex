package com.rpgGame.netData.dianfeng.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 巅峰数据
	 */
	public class DianFengDataInfo extends Bean {
	
		//段位等级
		private var _level: int;
		
		//当前积分
		private var _currentIntegral: int;
		
		//剩余挑战次数
		private var _currentNumber: int;
		
		//0 未领取奖励   1 领取了奖励
		private var _drawAward: int;
		
		//今日累计声望
		private var _reputation: int;
		
		//总声望
		private var _reputationAll: int;
		
		//排名
		private var _rank: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//段位等级
			writeInt(_level);
			//当前积分
			writeInt(_currentIntegral);
			//剩余挑战次数
			writeInt(_currentNumber);
			//0 未领取奖励   1 领取了奖励
			writeByte(_drawAward);
			//今日累计声望
			writeInt(_reputation);
			//总声望
			writeInt(_reputationAll);
			//排名
			writeInt(_rank);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//段位等级
			_level = readInt();
			//当前积分
			_currentIntegral = readInt();
			//剩余挑战次数
			_currentNumber = readInt();
			//0 未领取奖励   1 领取了奖励
			_drawAward = readByte();
			//今日累计声望
			_reputation = readInt();
			//总声望
			_reputationAll = readInt();
			//排名
			_rank = readInt();
			return true;
		}
		
		/**
		 * get 段位等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 段位等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 当前积分
		 * @return 
		 */
		public function get currentIntegral(): int{
			return _currentIntegral;
		}
		
		/**
		 * set 当前积分
		 */
		public function set currentIntegral(value: int): void{
			this._currentIntegral = value;
		}
		
		/**
		 * get 剩余挑战次数
		 * @return 
		 */
		public function get currentNumber(): int{
			return _currentNumber;
		}
		
		/**
		 * set 剩余挑战次数
		 */
		public function set currentNumber(value: int): void{
			this._currentNumber = value;
		}
		
		/**
		 * get 0 未领取奖励   1 领取了奖励
		 * @return 
		 */
		public function get drawAward(): int{
			return _drawAward;
		}
		
		/**
		 * set 0 未领取奖励   1 领取了奖励
		 */
		public function set drawAward(value: int): void{
			this._drawAward = value;
		}
		
		/**
		 * get 今日累计声望
		 * @return 
		 */
		public function get reputation(): int{
			return _reputation;
		}
		
		/**
		 * set 今日累计声望
		 */
		public function set reputation(value: int): void{
			this._reputation = value;
		}
		
		/**
		 * get 总声望
		 * @return 
		 */
		public function get reputationAll(): int{
			return _reputationAll;
		}
		
		/**
		 * set 总声望
		 */
		public function set reputationAll(value: int): void{
			this._reputationAll = value;
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
		
	}
}