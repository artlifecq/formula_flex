package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送玩家在线时间
	 */
	public class ResTotalOnlineTimeMessage extends Message {
	
		//总在线时间(秒)
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//总在线时间(秒)
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//总在线时间(秒)
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103124;
		}
		
		/**
		 * get 总在线时间(秒)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 总在线时间(秒)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}