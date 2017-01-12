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
	 * ͯ����Ϣ��
	 */
	public class LadInfo extends Bean {
	
		//ͯ��ΨһId
		private var _ladId: long;
		
		//ͯ��ģ��Id
		private var _ladModelId: int;
		
		//ͯ��ģ��Id
		private var _ladtype: int;
		
		//������ID
		private var _ownerId: long;
		
		//����������
		private var _ownerName: String;
		
		//ͯ������X
		private var _x: int;
		
		//ͯ������Y
		private var _y: int;
		
		//ͯ���ٶ�
		private var _speed: int;
		
		//ͯ����Է���
		private var _dir: int;
		
		//�ܲ����꼯��
		private var _positions: Vector.<int> = new Vector.<int>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//ͯ��ΨһId
			writeLong(_ladId);
			//ͯ��ģ��Id
			writeShort(_ladModelId);
			//ͯ��ģ��Id
			writeShort(_ladtype);
			//������ID
			writeLong(_ownerId);
			//����������
			writeString(_ownerName);
			//ͯ������X
			writeShort(_x);
			//ͯ������Y
			writeShort(_y);
			//ͯ���ٶ�
			writeShort(_speed);
			//ͯ����Է���
			writeByte(_dir);
			//�ܲ����꼯��
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeByte(_positions[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//ͯ��ΨһId
			_ladId = readLong();
			//ͯ��ģ��Id
			_ladModelId = readShort();
			//ͯ��ģ��Id
			_ladtype = readShort();
			//������ID
			_ownerId = readLong();
			//����������
			_ownerName = readString();
			//ͯ������X
			_x = readShort();
			//ͯ������Y
			_y = readShort();
			//ͯ���ٶ�
			_speed = readShort();
			//ͯ����Է���
			_dir = readByte();
			//�ܲ����꼯��
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readByte();
			}
			return true;
		}
		
		/**
		 * get ͯ��ΨһId
		 * @return 
		 */
		public function get ladId(): long{
			return _ladId;
		}
		
		/**
		 * set ͯ��ΨһId
		 */
		public function set ladId(value: long): void{
			this._ladId = value;
		}
		
		/**
		 * get ͯ��ģ��Id
		 * @return 
		 */
		public function get ladModelId(): int{
			return _ladModelId;
		}
		
		/**
		 * set ͯ��ģ��Id
		 */
		public function set ladModelId(value: int): void{
			this._ladModelId = value;
		}
		
		/**
		 * get ͯ��ģ��Id
		 * @return 
		 */
		public function get ladtype(): int{
			return _ladtype;
		}
		
		/**
		 * set ͯ��ģ��Id
		 */
		public function set ladtype(value: int): void{
			this._ladtype = value;
		}
		
		/**
		 * get ������ID
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set ������ID
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
		/**
		 * get ����������
		 * @return 
		 */
		public function get ownerName(): String{
			return _ownerName;
		}
		
		/**
		 * set ����������
		 */
		public function set ownerName(value: String): void{
			this._ownerName = value;
		}
		
		/**
		 * get ͯ������X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set ͯ������X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get ͯ������Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set ͯ������Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get ͯ���ٶ�
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set ͯ���ٶ�
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get ͯ����Է���
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set ͯ����Է���
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get �ܲ����꼯��
		 * @return 
		 */
		public function get positions(): Vector.<int>{
			return _positions;
		}
		
		/**
		 * set �ܲ����꼯��
		 */
		public function set positions(value: Vector.<int>): void{
			this._positions = value;
		}
		
	}
}