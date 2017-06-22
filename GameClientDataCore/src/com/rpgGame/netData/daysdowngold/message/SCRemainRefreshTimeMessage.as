package com.rpgGame.netData.daysdowngold.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 距离刷新时间
	 */
	public class SCRemainRefreshTimeMessage extends Message {
	
		//距离刷新时间(秒)
		private var _remainRefreshTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//距离刷新时间(秒)
			writeInt(_remainRefreshTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//距离刷新时间(秒)
			_remainRefreshTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130104;
		}
		
		/**
		 * get 距离刷新时间(秒)
		 * @return 
		 */
		public function get remainRefreshTime(): int{
			return _remainRefreshTime;
		}
		
		/**
		 * set 距离刷新时间(秒)
		 */
		public function set remainRefreshTime(value: int): void{
			this._remainRefreshTime = value;
		}
		
	}
}