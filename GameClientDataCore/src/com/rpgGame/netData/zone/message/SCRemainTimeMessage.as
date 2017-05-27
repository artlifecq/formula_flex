package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本剩余时间
	 */
	public class SCRemainTimeMessage extends Message {
	
		//副本剩余时间
		private var _remainTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本剩余时间
			writeInt(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本剩余时间
			_remainTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155140;
		}
		
		/**
		 * get 副本剩余时间
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 副本剩余时间
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
	}
}