package com.rpgGame.netData.buff.bean{
	import com.rpgGame.netData.buff.bean.BuffParameter;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * buff��Ϣ��
	 */
	public class BuffInfo extends Bean {
	
		//buffΨһId
		private var _buffId: long;
		
		//buffģ��Id
		private var _buffModelId: int;
		
		//���Ӳ���
		private var _overlay: int;
		
		//����ʱ��
		private var _totalTime: long;
		
		//����ʣ��ʱ��
		private var _remainTime: long;
		
		//ֵ�ӳ�
		private var _value: int;
		
		//�����ӳ�
		private var _percent: int;
		
		//����
		private var _buffParameter: Vector.<BuffParameter> = new Vector.<BuffParameter>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//buffΨһId
			writeLong(_buffId);
			//buffģ��Id
			writeInt(_buffModelId);
			//���Ӳ���
			writeInt(_overlay);
			//����ʱ��
			writeLong(_totalTime);
			//����ʣ��ʱ��
			writeLong(_remainTime);
			//ֵ�ӳ�
			writeInt(_value);
			//�����ӳ�
			writeInt(_percent);
			//����
			writeShort(_buffParameter.length);
			for (var i: int = 0; i < _buffParameter.length; i++) {
				writeBean(_buffParameter[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//buffΨһId
			_buffId = readLong();
			//buffģ��Id
			_buffModelId = readInt();
			//���Ӳ���
			_overlay = readInt();
			//����ʱ��
			_totalTime = readLong();
			//����ʣ��ʱ��
			_remainTime = readLong();
			//ֵ�ӳ�
			_value = readInt();
			//�����ӳ�
			_percent = readInt();
			//����
			var buffParameter_length : int = readShort();
			for (var i: int = 0; i < buffParameter_length; i++) {
				_buffParameter[i] = readBean(BuffParameter) as BuffParameter;
			}
			return true;
		}
		
		/**
		 * get buffΨһId
		 * @return 
		 */
		public function get buffId(): long{
			return _buffId;
		}
		
		/**
		 * set buffΨһId
		 */
		public function set buffId(value: long): void{
			this._buffId = value;
		}
		
		/**
		 * get buffģ��Id
		 * @return 
		 */
		public function get buffModelId(): int{
			return _buffModelId;
		}
		
		/**
		 * set buffģ��Id
		 */
		public function set buffModelId(value: int): void{
			this._buffModelId = value;
		}
		
		/**
		 * get ���Ӳ���
		 * @return 
		 */
		public function get overlay(): int{
			return _overlay;
		}
		
		/**
		 * set ���Ӳ���
		 */
		public function set overlay(value: int): void{
			this._overlay = value;
		}
		
		/**
		 * get ����ʱ��
		 * @return 
		 */
		public function get totalTime(): long{
			return _totalTime;
		}
		
		/**
		 * set ����ʱ��
		 */
		public function set totalTime(value: long): void{
			this._totalTime = value;
		}
		
		/**
		 * get ����ʣ��ʱ��
		 * @return 
		 */
		public function get remainTime(): long{
			return _remainTime;
		}
		
		/**
		 * set ����ʣ��ʱ��
		 */
		public function set remainTime(value: long): void{
			this._remainTime = value;
		}
		
		/**
		 * get ֵ�ӳ�
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set ֵ�ӳ�
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
		/**
		 * get �����ӳ�
		 * @return 
		 */
		public function get percent(): int{
			return _percent;
		}
		
		/**
		 * set �����ӳ�
		 */
		public function set percent(value: int): void{
			this._percent = value;
		}
		
		/**
		 * get ����
		 * @return 
		 */
		public function get buffParameter(): Vector.<BuffParameter>{
			return _buffParameter;
		}
		
		/**
		 * set ����
		 */
		public function set buffParameter(value: Vector.<BuffParameter>): void{
			this._buffParameter = value;
		}
		
	}
}