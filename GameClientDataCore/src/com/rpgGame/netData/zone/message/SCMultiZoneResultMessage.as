package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 准备退出副本消息
	 */
	public class SCMultiZoneResultMessage extends Message {
	
		//退出副本倒计时时间
		private var _outTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//退出副本倒计时时间
			writeInt(_outTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//退出副本倒计时时间
			_outTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155144;
		}
		
		/**
		 * get 退出副本倒计时时间
		 * @return 
		 */
		public function get outTime(): int{
			return _outTime;
		}
		
		/**
		 * set 退出副本倒计时时间
		 */
		public function set outTime(value: int): void{
			this._outTime = value;
		}
		
	}
}