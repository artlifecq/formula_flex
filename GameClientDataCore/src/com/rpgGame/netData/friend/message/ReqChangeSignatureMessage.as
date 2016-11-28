package com.rpgGame.netData.friend.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求更改签名心情
	 */
	public class ReqChangeSignatureMessage extends Message {
	
		//签名心情
		private var _signature: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//签名心情
			writeString(_signature);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//签名心情
			_signature = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 116203;
		}
		
		/**
		 * get 签名心情
		 * @return 
		 */
		public function get signature(): String{
			return _signature;
		}
		
		/**
		 * set 签名心情
		 */
		public function set signature(value: String): void{
			this._signature = value;
		}
		
	}
}