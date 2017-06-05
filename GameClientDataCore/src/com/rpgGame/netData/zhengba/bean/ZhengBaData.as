package com.rpgGame.netData.zhengba.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 争霸数据
	 */
	public class ZhengBaData extends Bean {
	
		//排名
		private var _rank: int;
		
		//声望
		private var _reputation: int;
		
		//战斗力
		private var _fightPower: int;
		
		//临时战斗力
		private var _tempFightPower: int;
		
		//当前次数
		private var _currentNumber: int;
		
		//最大次数
		private var _maxNumber: int;
		
		//0 未领取奖励   1 领取了奖励
		private var _drawAward: int;
		
		//挑战日志
		private var _logs: Vector.<String> = new Vector.<String>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排名
			writeInt(_rank);
			//声望
			writeInt(_reputation);
			//战斗力
			writeInt(_fightPower);
			//临时战斗力
			writeInt(_tempFightPower);
			//当前次数
			writeInt(_currentNumber);
			//最大次数
			writeInt(_maxNumber);
			//0 未领取奖励   1 领取了奖励
			writeByte(_drawAward);
			//挑战日志
			writeShort(_logs.length);
			for (var i: int = 0; i < _logs.length; i++) {
				writeString(_logs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排名
			_rank = readInt();
			//声望
			_reputation = readInt();
			//战斗力
			_fightPower = readInt();
			//临时战斗力
			_tempFightPower = readInt();
			//当前次数
			_currentNumber = readInt();
			//最大次数
			_maxNumber = readInt();
			//0 未领取奖励   1 领取了奖励
			_drawAward = readByte();
			//挑战日志
			var logs_length : int = readShort();
			for (var i: int = 0; i < logs_length; i++) {
				_logs[i] = readString();
			}
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
		 * get 声望
		 * @return 
		 */
		public function get reputation(): int{
			return _reputation;
		}
		
		/**
		 * set 声望
		 */
		public function set reputation(value: int): void{
			this._reputation = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
		/**
		 * get 临时战斗力
		 * @return 
		 */
		public function get tempFightPower(): int{
			return _tempFightPower;
		}
		
		/**
		 * set 临时战斗力
		 */
		public function set tempFightPower(value: int): void{
			this._tempFightPower = value;
		}
		
		/**
		 * get 当前次数
		 * @return 
		 */
		public function get currentNumber(): int{
			return _currentNumber;
		}
		
		/**
		 * set 当前次数
		 */
		public function set currentNumber(value: int): void{
			this._currentNumber = value;
		}
		
		/**
		 * get 最大次数
		 * @return 
		 */
		public function get maxNumber(): int{
			return _maxNumber;
		}
		
		/**
		 * set 最大次数
		 */
		public function set maxNumber(value: int): void{
			this._maxNumber = value;
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
		 * get 挑战日志
		 * @return 
		 */
		public function get logs(): Vector.<String>{
			return _logs;
		}
		
		/**
		 * set 挑战日志
		 */
		public function set logs(value: Vector.<String>): void{
			this._logs = value;
		}
		
	}
}