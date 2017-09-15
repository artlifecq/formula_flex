package com.rpgGame.netData.gameactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取
	 */
	public class CSGetOnlineRewardMessage extends Message {
	
		//在线时长
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//在线时长
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//在线时长
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 411201;
		}
		
		/**
		 * get 在线时长
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 在线时长
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}