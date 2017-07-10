package com.rpgGame.netData.mibao.message{
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
	public class SCMiBaoActivityTimeMessage extends Message {
	
		//剩余时间（秒）
		private var _remainingTime: int;
		
		//区域号
		private var _zoneId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//剩余时间（秒）
			writeInt(_remainingTime);
			//区域号
			writeInt(_zoneId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//剩余时间（秒）
			_remainingTime = readInt();
			//区域号
			_zoneId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 131101;
		}
		
		/**
		 * get 剩余时间（秒）
		 * @return 
		 */
		public function get remainingTime(): int{
			return _remainingTime;
		}
		
		/**
		 * set 剩余时间（秒）
		 */
		public function set remainingTime(value: int): void{
			this._remainingTime = value;
		}
		
		/**
		 * get 区域号
		 * @return 
		 */
		public function get zoneId(): int{
			return _zoneId;
		}
		
		/**
		 * set 区域号
		 */
		public function set zoneId(value: int): void{
			this._zoneId = value;
		}
		
	}
}