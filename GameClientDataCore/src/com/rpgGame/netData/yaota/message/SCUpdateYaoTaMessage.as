package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 
	 */
	public class SCUpdateYaoTaMessage extends Message {
	
		//层数
		private var _tier: int;
		
		//总积分
		private var _currentIntegral: int;
		
		//总积分
		private var _integral: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//层数
			writeInt(_tier);
			//总积分
			writeInt(_currentIntegral);
			//总积分
			writeInt(_integral);
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
			//总积分
			_integral = readInt();
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
		 * get 总积分
		 * @return 
		 */
		public function get integral(): int{
			return _integral;
		}
		
		/**
		 * set 总积分
		 */
		public function set integral(value: int): void{
			this._integral = value;
		}
		
	}
}