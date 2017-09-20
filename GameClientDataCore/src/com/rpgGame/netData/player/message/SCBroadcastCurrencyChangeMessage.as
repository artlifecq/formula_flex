package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 广播资源变化
	 */
	public class SCBroadcastCurrencyChangeMessage extends Message {
	
		//角色ID
		private var _personId: int;
		
		//货币类型
		private var _curType: int;
		
		//货币值
		private var _value: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色ID
			writeShort(_personId);
			//货币类型
			writeByte(_curType);
			//货币值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色ID
			_personId = readShort();
			//货币类型
			_curType = readByte();
			//货币值
			_value = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103216;
		}
		
		/**
		 * get 角色ID
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 角色ID
		 */
		public function set personId(value: int): void{
			this._personId = value;
		}
		
		/**
		 * get 货币类型
		 * @return 
		 */
		public function get curType(): int{
			return _curType;
		}
		
		/**
		 * set 货币类型
		 */
		public function set curType(value: int): void{
			this._curType = value;
		}
		
		/**
		 * get 货币值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 货币值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}