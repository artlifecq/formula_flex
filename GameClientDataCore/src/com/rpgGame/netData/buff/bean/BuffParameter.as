package com.rpgGame.netData.buff.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * buff������
	 */
	public class BuffParameter extends Bean {
	
		//buff��������
		private var _type: int;
		
		//buff����ֵ
		private var _value: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//buff��������
			writeInt(_type);
			//buff����ֵ
			writeInt(_value);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//buff��������
			_type = readInt();
			//buff����ֵ
			_value = readInt();
			return true;
		}
		
		/**
		 * get buff��������
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set buff��������
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get buff����ֵ
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set buff����ֵ
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}