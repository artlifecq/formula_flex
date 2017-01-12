package com.rpgGame.netData.map.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ����Ч����Ϣ
	 */
	public class EffectInfo extends Bean {
	
		//EffectID
		private var _effectId: long;
		
		//Effectģ��ID
		private var _effectModelId: int;
		
		//��������(0-1�� 1-��ͣ)
		private var _type: int;
		
		//����X
		private var _x: int;
		
		//����Y
		private var _y: int;
		
		//����ʱ��(��)
		private var _play: int;
		
		//ʩ���߹���ģʽ
		private var _pkstate: int;
		
		//����id
		private var _targetId: long;
		
		//ʩ����id
		private var _sourceId: long;
		
		//ģ����в�����0�ٶ�ֵ��1�Ƕ�ֵ[10000��], 2����ʱ�䣩
		private var _simulateParams: Vector.<int> = new Vector.<int>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//EffectID
			writeLong(_effectId);
			//Effectģ��ID
			writeInt(_effectModelId);
			//��������(0-1�� 1-��ͣ)
			writeByte(_type);
			//����X
			writeShort(_x);
			//����Y
			writeShort(_y);
			//����ʱ��(��)
			writeInt(_play);
			//ʩ���߹���ģʽ
			writeInt(_pkstate);
			//����id
			writeLong(_targetId);
			//ʩ����id
			writeLong(_sourceId);
			//ģ����в�����0�ٶ�ֵ��1�Ƕ�ֵ[10000��], 2����ʱ�䣩
			writeShort(_simulateParams.length);
			for (var i: int = 0; i < _simulateParams.length; i++) {
				writeInt(_simulateParams[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//EffectID
			_effectId = readLong();
			//Effectģ��ID
			_effectModelId = readInt();
			//��������(0-1�� 1-��ͣ)
			_type = readByte();
			//����X
			_x = readShort();
			//����Y
			_y = readShort();
			//����ʱ��(��)
			_play = readInt();
			//ʩ���߹���ģʽ
			_pkstate = readInt();
			//����id
			_targetId = readLong();
			//ʩ����id
			_sourceId = readLong();
			//ģ����в�����0�ٶ�ֵ��1�Ƕ�ֵ[10000��], 2����ʱ�䣩
			var simulateParams_length : int = readShort();
			for (var i: int = 0; i < simulateParams_length; i++) {
				_simulateParams[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get EffectID
		 * @return 
		 */
		public function get effectId(): long{
			return _effectId;
		}
		
		/**
		 * set EffectID
		 */
		public function set effectId(value: long): void{
			this._effectId = value;
		}
		
		/**
		 * get Effectģ��ID
		 * @return 
		 */
		public function get effectModelId(): int{
			return _effectModelId;
		}
		
		/**
		 * set Effectģ��ID
		 */
		public function set effectModelId(value: int): void{
			this._effectModelId = value;
		}
		
		/**
		 * get ��������(0-1�� 1-��ͣ)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set ��������(0-1�� 1-��ͣ)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get ����X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set ����X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get ����Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set ����Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get ����ʱ��(��)
		 * @return 
		 */
		public function get play(): int{
			return _play;
		}
		
		/**
		 * set ����ʱ��(��)
		 */
		public function set play(value: int): void{
			this._play = value;
		}
		
		/**
		 * get ʩ���߹���ģʽ
		 * @return 
		 */
		public function get pkstate(): int{
			return _pkstate;
		}
		
		/**
		 * set ʩ���߹���ģʽ
		 */
		public function set pkstate(value: int): void{
			this._pkstate = value;
		}
		
		/**
		 * get ����id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set ����id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get ʩ����id
		 * @return 
		 */
		public function get sourceId(): long{
			return _sourceId;
		}
		
		/**
		 * set ʩ����id
		 */
		public function set sourceId(value: long): void{
			this._sourceId = value;
		}
		
		/**
		 * get ģ����в�����0�ٶ�ֵ��1�Ƕ�ֵ[10000��], 2����ʱ�䣩
		 * @return 
		 */
		public function get simulateParams(): Vector.<int>{
			return _simulateParams;
		}
		
		/**
		 * set ģ����в�����0�ٶ�ֵ��1�Ƕ�ֵ[10000��], 2����ʱ�䣩
		 */
		public function set simulateParams(value: Vector.<int>): void{
			this._simulateParams = value;
		}
		
	}
}