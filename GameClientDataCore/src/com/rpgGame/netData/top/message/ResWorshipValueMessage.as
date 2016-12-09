package com.rpgGame.netData.top.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回崇拜值改变
	 */
	public class ResWorshipValueMessage extends Message {
	
		//玩家id
		private var _playerID: long;
		
		//崇拜值
		private var _value: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerID);
			//崇拜值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerID = readLong();
			//崇拜值
			_value = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141103;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerID(): long{
			return _playerID;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerID(value: long): void{
			this._playerID = value;
		}
		
		/**
		 * get 崇拜值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 崇拜值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}