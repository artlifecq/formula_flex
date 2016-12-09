package com.rpgGame.netData.warmark.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 达成条件
	 */
	public class CondInfo extends Bean {
	
		//条件类型
		private var _type: int;
		
		//达成数值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//条件类型
			writeInt(_type);
			//达成数值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//条件类型
			_type = readInt();
			//达成数值
			_value = readInt();
			return true;
		}
		
		/**
		 * get 条件类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 条件类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 达成数值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 达成数值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}