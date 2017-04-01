package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 货币发生变化
	 */
	public class SCCurrencyChangeMessage extends Message {
	
		//货币类型
		private var _curType: int;
		
		//货币值
		private var _value: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
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
			return 103127;
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