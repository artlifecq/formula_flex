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
	public class OfflineResZoneBackInfo extends Bean {
	
		//类型Id
		private var _type: int;
		
		//参数
		private var _params: int;
		
		//可找回天数
		private var _days: int;
		
		//累计未完成次数
		private var _count: int;
		
		//领取状态(0为开启 1可领取 2已领取)
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型Id
			writeByte(_type);
			//参数
			writeInt(_params);
			//可找回天数
			writeInt(_days);
			//累计未完成次数
			writeInt(_count);
			//领取状态(0为开启 1可领取 2已领取)
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型Id
			_type = readByte();
			//参数
			_params = readInt();
			//可找回天数
			_days = readInt();
			//累计未完成次数
			_count = readInt();
			//领取状态(0为开启 1可领取 2已领取)
			_state = readByte();
			return true;
		}
		
		/**
		 * get 类型Id
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型Id
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 参数
		 * @return 
		 */
		public function get params(): int{
			return _params;
		}
		
		/**
		 * set 参数
		 */
		public function set params(value: int): void{
			this._params = value;
		}
		
		/**
		 * get 可找回天数
		 * @return 
		 */
		public function get days(): int{
			return _days;
		}
		
		/**
		 * set 可找回天数
		 */
		public function set days(value: int): void{
			this._days = value;
		}
		
		/**
		 * get 累计未完成次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 累计未完成次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 领取状态(0为开启 1可领取 2已领取)
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 领取状态(0为开启 1可领取 2已领取)
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}