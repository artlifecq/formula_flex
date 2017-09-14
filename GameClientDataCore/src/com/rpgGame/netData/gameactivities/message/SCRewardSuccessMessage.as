package com.rpgGame.netData.gameactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取成功
	 */
	public class SCRewardSuccessMessage extends Message {
	
		//1成功
		private var _success: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1成功
			writeByte(_success);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1成功
			_success = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 410102;
		}
		
		/**
		 * get 1成功
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 1成功
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
	}
}