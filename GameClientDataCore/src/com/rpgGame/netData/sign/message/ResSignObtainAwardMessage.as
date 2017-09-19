package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取首签奖励
	 */
	public class ResSignObtainAwardMessage extends Message {
	
		//领取结果 1成功 0失败
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取结果 1成功 0失败
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取结果 1成功 0失败
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154104;
		}
		
		/**
		 * get 领取结果 1成功 0失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 领取结果 1成功 0失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}