package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.AttributeItem;
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
	 * ���������ϸ��Ϣ
	 */
	public class MyPlayerInfo extends Bean {
	
		//��ɫId
		private var _personId: long;
		
		//��ɫ����
		private var _name: String;
		
		//��ɫ���ڵ�ͼģ��
		private var _mapModelId: int;
		
		//��ɫ����λ��
		private var _position: com.rpgGame.netData.structs.Position;
		
		//������Է���
		private var _dir: int;
		
		//����Ա� 1�� 2Ů
		private var _sex: int;
		
		//�׶�
		private var _body: int;
		
		//ְҵ
		private var _job: int;
		
		//�·���װ
		private var _cloths: int;
		
		//������
		private var _weapon: int;
		
		//������
		private var _second_weapon: int;
		
		//����
		private var _mount: int;
		
		//PK����
		private var _pkType: int;
		
		//��ɫ������Ϣ
		private var _attributes: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//buff�б�
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��ɫId
			writeLong(_personId);
			//��ɫ����
			writeString(_name);
			//��ɫ���ڵ�ͼģ��
			writeInt(_mapModelId);
			//��ɫ����λ��
			writeBean(_position);
			//������Է���
			writeShort(_dir);
			//����Ա� 1�� 2Ů
			writeByte(_sex);
			//�׶�
			writeByte(_body);
			//ְҵ
			writeByte(_job);
			//�·���װ
			writeInt(_cloths);
			//������
			writeInt(_weapon);
			//������
			writeInt(_second_weapon);
			//����
			writeInt(_mount);
			//PK����
			writeInt(_pkType);
			//��ɫ������Ϣ
			writeShort(_attributes.length);
			for (var i: int = 0; i < _attributes.length; i++) {
				writeBean(_attributes[i]);
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
			//��ɫId
			_personId = readLong();
			//��ɫ����
			_name = readString();
			//��ɫ���ڵ�ͼģ��
			_mapModelId = readInt();
			//��ɫ����λ��
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//������Է���
			_dir = readShort();
			//����Ա� 1�� 2Ů
			_sex = readByte();
			//�׶�
			_body = readByte();
			//ְҵ
			_job = readByte();
			//�·���װ
			_cloths = readInt();
			//������
			_weapon = readInt();
			//������
			_second_weapon = readInt();
			//����
			_mount = readInt();
			//PK����
			_pkType = readInt();
			//��ɫ������Ϣ
			var attributes_length : int = readShort();
			for (var i: int = 0; i < attributes_length; i++) {
				_attributes[i] = readBean(AttributeItem) as AttributeItem;
			}
			//buff�б�
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			return true;
		}
		
		/**
		 * get ��ɫId
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set ��ɫId
		 */
		public function set personId(value: long): void{
			this._personId = value;
		}
		
		/**
		 * get ��ɫ����
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set ��ɫ����
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get ��ɫ���ڵ�ͼģ��
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set ��ɫ���ڵ�ͼģ��
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get ��ɫ����λ��
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set ��ɫ����λ��
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
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
		 * get ����Ա� 1�� 2Ů
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set ����Ա� 1�� 2Ů
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get �׶�
		 * @return 
		 */
		public function get body(): int{
			return _body;
		}
		
		/**
		 * set �׶�
		 */
		public function set body(value: int): void{
			this._body = value;
		}
		
		/**
		 * get ְҵ
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set ְҵ
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get �·���װ
		 * @return 
		 */
		public function get cloths(): int{
			return _cloths;
		}
		
		/**
		 * set �·���װ
		 */
		public function set cloths(value: int): void{
			this._cloths = value;
		}
		
		/**
		 * get ������
		 * @return 
		 */
		public function get weapon(): int{
			return _weapon;
		}
		
		/**
		 * set ������
		 */
		public function set weapon(value: int): void{
			this._weapon = value;
		}
		
		/**
		 * get ������
		 * @return 
		 */
		public function get second_weapon(): int{
			return _second_weapon;
		}
		
		/**
		 * set ������
		 */
		public function set second_weapon(value: int): void{
			this._second_weapon = value;
		}
		
		/**
		 * get ����
		 * @return 
		 */
		public function get mount(): int{
			return _mount;
		}
		
		/**
		 * set ����
		 */
		public function set mount(value: int): void{
			this._mount = value;
		}
		
		/**
		 * get PK����
		 * @return 
		 */
		public function get pkType(): int{
			return _pkType;
		}
		
		/**
		 * set PK����
		 */
		public function set pkType(value: int): void{
			this._pkType = value;
		}
		
		/**
		 * get ��ɫ������Ϣ
		 * @return 
		 */
		public function get attributes(): Vector.<AttributeItem>{
			return _attributes;
		}
		
		/**
		 * set ��ɫ������Ϣ
		 */
		public function set attributes(value: Vector.<AttributeItem>): void{
			this._attributes = value;
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