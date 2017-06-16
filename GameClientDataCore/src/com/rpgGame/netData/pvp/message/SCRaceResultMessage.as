package com.rpgGame.netData.pvp.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 比赛结果
	 */
	public class SCRaceResultMessage extends Message {
	
		//结果  1 胜利   0 失败
		private var _result: int;
		
		//段位等级
		private var _level: int;
		
		//当前积分
		private var _currentIntegral: int;
		
		//获得积分
		private var _integral: int;
		
		//获得荣誉
		private var _reputation: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//结果  1 胜利   0 失败
			writeInt(_result);
			//段位等级
			writeInt(_level);
			//当前积分
			writeInt(_currentIntegral);
			//获得积分
			writeInt(_integral);
			//获得荣誉
			writeInt(_reputation);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//结果  1 胜利   0 失败
			_result = readInt();
			//段位等级
			_level = readInt();
			//当前积分
			_currentIntegral = readInt();
			//获得积分
			_integral = readInt();
			//获得荣誉
			_reputation = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128105;
		}
		
		/**
		 * get 结果  1 胜利   0 失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果  1 胜利   0 失败
		 */
		public function set result(value: int): void{
			this._result = value;
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
		 * get 获得积分
		 * @return 
		 */
		public function get integral(): int{
			return _integral;
		}
		
		/**
		 * set 获得积分
		 */
		public function set integral(value: int): void{
			this._integral = value;
		}
		
		/**
		 * get 获得荣誉
		 * @return 
		 */
		public function get reputation(): int{
			return _reputation;
		}
		
		/**
		 * set 获得荣誉
		 */
		public function set reputation(value: int): void{
			this._reputation = value;
		}
		
	}
}