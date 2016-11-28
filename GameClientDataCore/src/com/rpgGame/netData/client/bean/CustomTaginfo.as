package com.rpgGame.netData.client.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 客户端设定info
	 */
	public class CustomTaginfo extends Bean {
	
		//客户端设定key
		private var _key: String;
		
		//客户端设定value
		private var _value: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//客户端设定key
			writeString(_key);
			//客户端设定value
			writeString(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//客户端设定key
			_key = readString();
			//客户端设定value
			_value = readString();
			return true;
		}
		
		/**
		 * get 客户端设定key
		 * @return 
		 */
		public function get key(): String{
			return _key;
		}
		
		/**
		 * set 客户端设定key
		 */
		public function set key(value: String): void{
			this._key = value;
		}
		
		/**
		 * get 客户端设定value
		 * @return 
		 */
		public function get value(): String{
			return _value;
		}
		
		/**
		 * set 客户端设定value
		 */
		public function set value(value: String): void{
			this._value = value;
		}
		
	}
}