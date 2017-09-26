package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回副本结束倒计时
	 */
	public class SCZoneCloseCountdownTimerMessage extends Message {
	
		//时间(秒)
		private var _time: int;
		
		//类型
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//时间(秒)
			writeInt(_time);
			//类型
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//时间(秒)
			_time = readInt();
			//类型
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155150;
		}
		
		/**
		 * get 时间(秒)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 时间(秒)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}