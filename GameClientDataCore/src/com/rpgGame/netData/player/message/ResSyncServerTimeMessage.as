package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步服务端时间给客户端
	 */
	public class ResSyncServerTimeMessage extends Message {
	
		//unix时间戳（单位:秒）
		private var _timestamp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//unix时间戳（单位:秒）
			writeInt(_timestamp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//unix时间戳（单位:秒）
			_timestamp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103108;
		}
		
		/**
		 * get unix时间戳（单位:秒）
		 * @return 
		 */
		public function get timestamp(): int{
			return _timestamp;
		}
		
		/**
		 * set unix时间戳（单位:秒）
		 */
		public function set timestamp(value: int): void{
			this._timestamp = value;
		}
		
	}
}