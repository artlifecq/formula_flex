package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送提升后宝物信息
	 */
	public class SCRefreshGirlMessage extends Message {
	
		//宝物id
		private var _girlId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//宝物id
			writeInt(_girlId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//宝物id
			_girlId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230106;
		}
		
		/**
		 * get 宝物id
		 * @return 
		 */
		public function get girlId(): int{
			return _girlId;
		}
		
		/**
		 * set 宝物id
		 */
		public function set girlId(value: int): void{
			this._girlId = value;
		}
		
	}
}