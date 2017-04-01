package com.rpgGame.netData.player.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 角色升级属性变化
	 */
	public class SCMaxValueChangeMessage extends Message {
	
		//属性类型 1 最大经验，2 最大真气值
		private var _type: int;
		
		//属性值
		private var _value: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//属性类型 1 最大经验，2 最大真气值
			writeByte(_type);
			//属性值
			writeLong(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//属性类型 1 最大经验，2 最大真气值
			_type = readByte();
			//属性值
			_value = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103128;
		}
		
		/**
		 * get 属性类型 1 最大经验，2 最大真气值
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 属性类型 1 最大经验，2 最大真气值
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 属性值
		 * @return 
		 */
		public function get value(): long{
			return _value;
		}
		
		/**
		 * set 属性值
		 */
		public function set value(value: long): void{
			this._value = value;
		}
		
	}
}