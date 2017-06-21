package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新玩家数据
	 */
	public class SCUpdateYaoTaMessage extends Message {
	
		//层数
		private var _tier: int;
		
		//总积分
		private var _currentIntegral: int;
		
		//积分
		private var _integral: int;
		
		//领取奖励状态   1 已领取
		private var _drawAward: int;
		
		//剩余时间  (秒)
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//层数
			writeInt(_tier);
			//总积分
			writeInt(_currentIntegral);
			//积分
			writeInt(_integral);
			//领取奖励状态   1 已领取
			writeInt(_drawAward);
			//剩余时间  (秒)
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//层数
			_tier = readInt();
			//总积分
			_currentIntegral = readInt();
			//积分
			_integral = readInt();
			//领取奖励状态   1 已领取
			_drawAward = readInt();
			//剩余时间  (秒)
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129104;
		}
		
		/**
		 * get 层数
		 * @return 
		 */
		public function get tier(): int{
			return _tier;
		}
		
		/**
		 * set 层数
		 */
		public function set tier(value: int): void{
			this._tier = value;
		}
		
		/**
		 * get 总积分
		 * @return 
		 */
		public function get currentIntegral(): int{
			return _currentIntegral;
		}
		
		/**
		 * set 总积分
		 */
		public function set currentIntegral(value: int): void{
			this._currentIntegral = value;
		}
		
		/**
		 * get 积分
		 * @return 
		 */
		public function get integral(): int{
			return _integral;
		}
		
		/**
		 * set 积分
		 */
		public function set integral(value: int): void{
			this._integral = value;
		}
		
		/**
		 * get 领取奖励状态   1 已领取
		 * @return 
		 */
		public function get drawAward(): int{
			return _drawAward;
		}
		
		/**
		 * set 领取奖励状态   1 已领取
		 */
		public function set drawAward(value: int): void{
			this._drawAward = value;
		}
		
		/**
		 * get 剩余时间  (秒)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 剩余时间  (秒)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}