package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ������
	 */
	public class AttributeItem extends Bean {
	
		//��������
		private var _type: int;
		
		//����ֵ
		private var _value: int;
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��������
			writeByte(_type);
			//����ֵ
			writeInt(_value);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//��������
			_type = readByte();
			//����ֵ
			_value = readInt();
			return true;
		}
		
		/**
		 * get ��������
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set ��������
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get ����ֵ
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set ����ֵ
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}