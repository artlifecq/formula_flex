package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗等待时间
	 */
	public class ResWaitTimeMessage extends Message {
	
		//等待时间（秒）
		private var _waitTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//等待时间（秒）
			writeInt(_waitTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//等待时间（秒）
			_waitTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222505;
		}
		
		/**
		 * get 等待时间（秒）
		 * @return 
		 */
		public function get waitTime(): int{
			return _waitTime;
		}
		
		/**
		 * set 等待时间（秒）
		 */
		public function set waitTime(value: int): void{
			this._waitTime = value;
		}
		
	}
}