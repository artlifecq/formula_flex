package com.rpgGame.netData.offlineres.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 离线收益
	 */
	public class OfflineResAwardInfo extends Bean {
	
		//累计时间(秒)
		private var _totalTime: int;
		
		//经验
		private var _exp: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//累计时间(秒)
			writeInt(_totalTime);
			//经验
			writeInt(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//累计时间(秒)
			_totalTime = readInt();
			//经验
			_exp = readInt();
			return true;
		}
		
		/**
		 * get 累计时间(秒)
		 * @return 
		 */
		public function get totalTime(): int{
			return _totalTime;
		}
		
		/**
		 * set 累计时间(秒)
		 */
		public function set totalTime(value: int): void{
			this._totalTime = value;
		}
		
		/**
		 * get 经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
	}
}