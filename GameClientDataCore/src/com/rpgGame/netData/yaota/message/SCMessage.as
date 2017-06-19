package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送战旗信息
	 */
	public class SCMessage extends Message {
	
		//战旗持有者
		private var _playerName: String;
		
		//剩余时间
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战旗持有者
			writeString(_playerName);
			//剩余时间
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战旗持有者
			_playerName = readString();
			//剩余时间
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129110;
		}
		
		/**
		 * get 战旗持有者
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 战旗持有者
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}