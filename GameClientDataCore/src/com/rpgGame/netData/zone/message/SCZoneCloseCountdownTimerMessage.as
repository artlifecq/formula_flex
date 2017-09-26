package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ���ظ�����������ʱ
	 */
	public class SCZoneCloseCountdownTimerMessage extends Message {
	
		//ʱ��(��)
		private var _time: int;
		
		//����
		private var _type: int;
		
		
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//ʱ��(��)
			writeInt(_time);
			//����
			writeByte(_type);
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//ʱ��(��)
			_time = readInt();
			//����
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
		 * get ʱ��(��)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set ʱ��(��)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get ����
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set ����
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}