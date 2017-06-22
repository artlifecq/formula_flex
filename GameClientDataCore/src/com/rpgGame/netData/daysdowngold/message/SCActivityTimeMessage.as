package com.rpgGame.netData.daysdowngold.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活动剩余时间
	 */
	public class SCActivityTimeMessage extends Message {
	
		//剩余时间
		private var _remainingTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余时间
			writeInt(_remainingTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余时间
			_remainingTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130103;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get remainingTime(): int{
			return _remainingTime;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set remainingTime(value: int): void{
			this._remainingTime = value;
		}
		
	}
}