package com.rpgGame.netData.cooldown.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 冷却信息
	 */
	public class CooldownInfo extends Bean {
	
		//key
		private var _key: String;
		
		//冷却时间
		private var _cdTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//key
			writeString(_key);
			//冷却时间
			writeInt(_cdTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//key
			_key = readString();
			//冷却时间
			_cdTime = readInt();
			return true;
		}
		
		/**
		 * get key
		 * @return 
		 */
		public function get key(): String{
			return _key;
		}
		
		/**
		 * set key
		 */
		public function set key(value: String): void{
			this._key = value;
		}
		
		/**
		 * get 冷却时间
		 * @return 
		 */
		public function get cdTime(): int{
			return _cdTime;
		}
		
		/**
		 * set 冷却时间
		 */
		public function set cdTime(value: int): void{
			this._cdTime = value;
		}
		
	}
}