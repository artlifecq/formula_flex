package com.rpgGame.netData.backpack.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 附加属性信息
	 */
	public class AttributeInfo extends Bean {
	
		//附加属性类型
		private var _type: int;
		
		//附加属性值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//附加属性类型
			writeByte(_type);
			//附加属性值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//附加属性类型
			_type = readByte();
			//附加属性值
			_value = readInt();
			return true;
		}
		
		/**
		 * get 附加属性类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 附加属性类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 附加属性值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 附加属性值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}