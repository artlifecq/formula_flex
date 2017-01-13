package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ������Ϣ��
	 */
	public class PetInfo extends Bean {
	
		//����ΨһId
		private var _petId: long;
		
		//����ģ��Id
		private var _petModelId: int;
		
		//������ID
		private var _ownerId: long;
		
		//����������
		private var _ownerName: String;
		
		//����ȼ�
		private var _level: int;
		
		//��������X
		private var _x: int;
		
		//��������Y
		private var _y: int;
		
		//����HP
		private var _hp: int;
		
		//�������HP
		private var _maxHp: int;
		
		//�����ٶ�
		private var _speed: int;
		
		//������Է���
		private var _dir: int;
		
		//�ܲ����꼯��
		private var _positions: Vector.<int> = new Vector.<int>();
		//buff����
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//����ΨһId
			writeLong(_petId);
			//����ģ��Id
			writeShort(_petModelId);
			//������ID
			writeLong(_ownerId);
			//����������
			writeString(_ownerName);
			//����ȼ�
			writeShort(_level);
			//��������X
			writeShort(_x);
			//��������Y
			writeShort(_y);
			//����HP
			writeInt(_hp);
			//�������HP
			writeInt(_maxHp);
			//�����ٶ�
			writeShort(_speed);
			//������Է���
			writeShort(_dir);
			//�ܲ����꼯��
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeByte(_positions[i]);
			}
			//buff����
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//����ΨһId
			_petId = readLong();
			//����ģ��Id
			_petModelId = readShort();
			//������ID
			_ownerId = readLong();
			//����������
			_ownerName = readString();
			//����ȼ�
			_level = readShort();
			//��������X
			_x = readShort();
			//��������Y
			_y = readShort();
			//����HP
			_hp = readInt();
			//�������HP
			_maxHp = readInt();
			//�����ٶ�
			_speed = readShort();
			//������Է���
			_dir = readShort();
			//�ܲ����꼯��
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readByte();
			}
			//buff����
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			return true;
		}
		
		/**
		 * get ����ΨһId
		 * @return 
		 */
		public function get petId(): long{
			return _petId;
		}
		
		/**
		 * set ����ΨһId
		 */
		public function set petId(value: long): void{
			this._petId = value;
		}
		
		/**
		 * get ����ģ��Id
		 * @return 
		 */
		public function get petModelId(): int{
			return _petModelId;
		}
		
		/**
		 * set ����ģ��Id
		 */
		public function set petModelId(value: int): void{
			this._petModelId = value;
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
		 * get ����ȼ�
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set ����ȼ�
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get ��������X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set ��������X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get ��������Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set ��������Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get ����HP
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set ����HP
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
		/**
		 * get �������HP
		 * @return 
		 */
		public function get maxHp(): int{
			return _maxHp;
		}
		
		/**
		 * set �������HP
		 */
		public function set maxHp(value: int): void{
			this._maxHp = value;
		}
		
		/**
		 * get �����ٶ�
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set �����ٶ�
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get ������Է���
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set ������Է���
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
		
		/**
		 * get buff����
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff����
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}