package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.structs.Position;
	
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
	public class MonsterInfo extends Bean {
	
		//����Id
		private var _monsterId: long;
		
		//����ģ��Id
		private var _modelId: int;
		
		//��������
		private var _monsterName: String;
		
		//������Դ����
		private var _monsterRes: int;
		
		//����ͷ������
		private var _monsterIcon: int;
		
		//����ж����� 0-ȫ����ҵжԣ� 1-ȫ������Ѻã� 2-���ɵж�
		private var _friend: int;
		
		//����ȼ�
		private var _level: int;
		
		//�������ڵ�ͼ
		private var _mapModelId: int;
		
		//������������
		private var _position: com.rpgGame.netData.structs.Position;
		
		//����HP
		private var _hp: int;
		
		//�������HP
		private var _maxHp: int;
		
		//�����ٶ�
		private var _speed: int;
		
		//������Է���
		private var _dir: int;
		
		//�ܲ����꼯��
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//buff�б�
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//����Id
			writeLong(_monsterId);
			//����ģ��Id
			writeInt(_modelId);
			//��������
			writeString(_monsterName);
			//������Դ����
			writeInt(_monsterRes);
			//����ͷ������
			writeInt(_monsterIcon);
			//����ж����� 0-ȫ����ҵжԣ� 1-ȫ������Ѻã� 2-���ɵж�
			writeByte(_friend);
			//����ȼ�
			writeShort(_level);
			//�������ڵ�ͼ
			writeInt(_mapModelId);
			//������������
			writeBean(_position);
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
				writeBean(_positions[i]);
			}
			//buff�б�
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
			//����Id
			_monsterId = readLong();
			//����ģ��Id
			_modelId = readInt();
			//��������
			_monsterName = readString();
			//������Դ����
			_monsterRes = readInt();
			//����ͷ������
			_monsterIcon = readInt();
			//����ж����� 0-ȫ����ҵжԣ� 1-ȫ������Ѻã� 2-���ɵж�
			_friend = readByte();
			//����ȼ�
			_level = readShort();
			//�������ڵ�ͼ
			_mapModelId = readInt();
			//������������
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
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
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//buff�б�
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			return true;
		}
		
		/**
		 * get ����Id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set ����Id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get ����ģ��Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set ����ģ��Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get ��������
		 * @return 
		 */
		public function get monsterName(): String{
			return _monsterName;
		}
		
		/**
		 * set ��������
		 */
		public function set monsterName(value: String): void{
			this._monsterName = value;
		}
		
		/**
		 * get ������Դ����
		 * @return 
		 */
		public function get monsterRes(): int{
			return _monsterRes;
		}
		
		/**
		 * set ������Դ����
		 */
		public function set monsterRes(value: int): void{
			this._monsterRes = value;
		}
		
		/**
		 * get ����ͷ������
		 * @return 
		 */
		public function get monsterIcon(): int{
			return _monsterIcon;
		}
		
		/**
		 * set ����ͷ������
		 */
		public function set monsterIcon(value: int): void{
			this._monsterIcon = value;
		}
		
		/**
		 * get ����ж����� 0-ȫ����ҵжԣ� 1-ȫ������Ѻã� 2-���ɵж�
		 * @return 
		 */
		public function get friend(): int{
			return _friend;
		}
		
		/**
		 * set ����ж����� 0-ȫ����ҵжԣ� 1-ȫ������Ѻã� 2-���ɵж�
		 */
		public function set friend(value: int): void{
			this._friend = value;
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
		 * get �������ڵ�ͼ
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set �������ڵ�ͼ
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get ������������
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set ������������
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
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
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set �ܲ����꼯��
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
		}
		
		/**
		 * get buff�б�
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff�б�
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}