package com.rpgGame.netData.buff.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * buff参数类
	 */
	public class BuffParameter extends Bean {
	
		//buff参数类型
		private var _type: int;
		
		//buff参数值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//buff参数类型
			writeInt(_type);
			//buff参数值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//buff参数类型
			_type = readInt();
			//buff参数值
			_value = readInt();
			return true;
		}
		
		/**
		 * get buff参数类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set buff参数类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get buff参数值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set buff参数值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}