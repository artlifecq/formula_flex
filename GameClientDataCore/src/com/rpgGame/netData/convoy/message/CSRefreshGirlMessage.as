package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 提升品质
	 */
	public class CSRefreshGirlMessage extends Message {
	
		//是否使用元宝购买(0.否 1.是)
		private var _isUse: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否使用元宝购买(0.否 1.是)
			writeByte(_isUse);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否使用元宝购买(0.否 1.是)
			_isUse = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230202;
		}
		
		/**
		 * get 是否使用元宝购买(0.否 1.是)
		 * @return 
		 */
		public function get isUse(): int{
			return _isUse;
		}
		
		/**
		 * set 是否使用元宝购买(0.否 1.是)
		 */
		public function set isUse(value: int): void{
			this._isUse = value;
		}
		
	}
}