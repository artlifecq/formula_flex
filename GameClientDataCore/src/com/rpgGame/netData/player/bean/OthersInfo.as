package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.player.bean.AttributeItem;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * ������ϸ��Ϣ
	 */
	public class OthersInfo extends Bean {
	
		//��ɫId
		private var _personId: long;
		
		//��ɫ����
		private var _name: String;
		
		//��ɫ�ȼ�
		private var _level: int;
		
		//��ɫ������Ϣ
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//�������ID
		private var _knightWepId: int;
		
		//�Ա� 0Ů 1��
		private var _sex: int;
		
		//����ID
		private var _beautyModelId: int;
		
		//���˼�����Ϣ
		private var _beautySkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//����ID
		private var _horseModelid: int;
		
		//����װ���б�(4������,�յ���itemidΪ0)
		private var _horseEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//���������Ϣ
		private var _weaponRideSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//ս����
		private var _fightpower: int;
		
		//vip�ȼ�
		private var _viplevel: int;
		
		//�������
		private var _guildName: String;
		
		//�ɾ͵ȼ�
		private var _achievementLv: int;
		
		//��ǰ�ɾ�ֵ
		private var _achievementValue: int;
		
		//��ɱBOSS��
		private var _bossKillNum: int;
		
		//װ��սӡId
		private var _warMarkId: int;
		
		//װ����Ϣ�б�
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//��ɫId
			writeLong(_personId);
			//��ɫ����
			writeString(_name);
			//��ɫ�ȼ�
			writeShort(_level);
			//��ɫ������Ϣ
			writeShort(_attributeList.length);
			for (var i: int = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			//�������ID
			writeByte(_knightWepId);
			//�Ա� 0Ů 1��
			writeByte(_sex);
			//����ID
			writeByte(_beautyModelId);
			//���˼�����Ϣ
			writeShort(_beautySkillInfos.length);
			for (var i: int = 0; i < _beautySkillInfos.length; i++) {
				writeBean(_beautySkillInfos[i]);
			}
			//����ID
			writeByte(_horseModelid);
			//����װ���б�(4������,�յ���itemidΪ0)
			writeShort(_horseEquips.length);
			for (var i: int = 0; i < _horseEquips.length; i++) {
				writeBean(_horseEquips[i]);
			}
			//���������Ϣ
			writeShort(_weaponRideSkillInfos.length);
			for (var i: int = 0; i < _weaponRideSkillInfos.length; i++) {
				writeBean(_weaponRideSkillInfos[i]);
			}
			//ս����
			writeInt(_fightpower);
			//vip�ȼ�
			writeByte(_viplevel);
			//�������
			writeString(_guildName);
			//�ɾ͵ȼ�
			writeShort(_achievementLv);
			//��ǰ�ɾ�ֵ
			writeInt(_achievementValue);
			//��ɱBOSS��
			writeShort(_bossKillNum);
			//װ��սӡId
			writeInt(_warMarkId);
			//װ����Ϣ�б�
			writeShort(_equips.length);
			for (var i: int = 0; i < _equips.length; i++) {
				writeBean(_equips[i]);
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
			//��ɫ�ȼ�
			_level = readShort();
			//��ɫ������Ϣ
			var attributeList_length : int = readShort();
			for (var i: int = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			//�������ID
			_knightWepId = readByte();
			//�Ա� 0Ů 1��
			_sex = readByte();
			//����ID
			_beautyModelId = readByte();
			//���˼�����Ϣ
			var beautySkillInfos_length : int = readShort();
			for (var i: int = 0; i < beautySkillInfos_length; i++) {
				_beautySkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//����ID
			_horseModelid = readByte();
			//����װ���б�(4������,�յ���itemidΪ0)
			var horseEquips_length : int = readShort();
			for (var i: int = 0; i < horseEquips_length; i++) {
				_horseEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//���������Ϣ
			var weaponRideSkillInfos_length : int = readShort();
			for (var i: int = 0; i < weaponRideSkillInfos_length; i++) {
				_weaponRideSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//ս����
			_fightpower = readInt();
			//vip�ȼ�
			_viplevel = readByte();
			//�������
			_guildName = readString();
			//�ɾ͵ȼ�
			_achievementLv = readShort();
			//��ǰ�ɾ�ֵ
			_achievementValue = readInt();
			//��ɱBOSS��
			_bossKillNum = readShort();
			//װ��սӡId
			_warMarkId = readInt();
			//װ����Ϣ�б�
			var equips_length : int = readShort();
			for (var i: int = 0; i < equips_length; i++) {
				_equips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
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
		 * get ��ɫ�ȼ�
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set ��ɫ�ȼ�
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get ��ɫ������Ϣ
		 * @return 
		 */
		public function get attributeList(): Vector.<AttributeItem>{
			return _attributeList;
		}
		
		/**
		 * set ��ɫ������Ϣ
		 */
		public function set attributeList(value: Vector.<AttributeItem>): void{
			this._attributeList = value;
		}
		
		/**
		 * get �������ID
		 * @return 
		 */
		public function get knightWepId(): int{
			return _knightWepId;
		}
		
		/**
		 * set �������ID
		 */
		public function set knightWepId(value: int): void{
			this._knightWepId = value;
		}
		
		/**
		 * get �Ա� 0Ů 1��
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set �Ա� 0Ů 1��
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get beautyModelId(): int{
			return _beautyModelId;
		}
		
		/**
		 * set ����ID
		 */
		public function set beautyModelId(value: int): void{
			this._beautyModelId = value;
		}
		
		/**
		 * get ���˼�����Ϣ
		 * @return 
		 */
		public function get beautySkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _beautySkillInfos;
		}
		
		/**
		 * set ���˼�����Ϣ
		 */
		public function set beautySkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._beautySkillInfos = value;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set ����ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
		/**
		 * get ����װ���б�(4������,�յ���itemidΪ0)
		 * @return 
		 */
		public function get horseEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _horseEquips;
		}
		
		/**
		 * set ����װ���б�(4������,�յ���itemidΪ0)
		 */
		public function set horseEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._horseEquips = value;
		}
		
		/**
		 * get ���������Ϣ
		 * @return 
		 */
		public function get weaponRideSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _weaponRideSkillInfos;
		}
		
		/**
		 * set ���������Ϣ
		 */
		public function set weaponRideSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._weaponRideSkillInfos = value;
		}
		
		/**
		 * get ս����
		 * @return 
		 */
		public function get fightpower(): int{
			return _fightpower;
		}
		
		/**
		 * set ս����
		 */
		public function set fightpower(value: int): void{
			this._fightpower = value;
		}
		
		/**
		 * get vip�ȼ�
		 * @return 
		 */
		public function get viplevel(): int{
			return _viplevel;
		}
		
		/**
		 * set vip�ȼ�
		 */
		public function set viplevel(value: int): void{
			this._viplevel = value;
		}
		
		/**
		 * get �������
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set �������
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get �ɾ͵ȼ�
		 * @return 
		 */
		public function get achievementLv(): int{
			return _achievementLv;
		}
		
		/**
		 * set �ɾ͵ȼ�
		 */
		public function set achievementLv(value: int): void{
			this._achievementLv = value;
		}
		
		/**
		 * get ��ǰ�ɾ�ֵ
		 * @return 
		 */
		public function get achievementValue(): int{
			return _achievementValue;
		}
		
		/**
		 * set ��ǰ�ɾ�ֵ
		 */
		public function set achievementValue(value: int): void{
			this._achievementValue = value;
		}
		
		/**
		 * get ��ɱBOSS��
		 * @return 
		 */
		public function get bossKillNum(): int{
			return _bossKillNum;
		}
		
		/**
		 * set ��ɱBOSS��
		 */
		public function set bossKillNum(value: int): void{
			this._bossKillNum = value;
		}
		
		/**
		 * get װ��սӡId
		 * @return 
		 */
		public function get warMarkId(): int{
			return _warMarkId;
		}
		
		/**
		 * set װ��սӡId
		 */
		public function set warMarkId(value: int): void{
			this._warMarkId = value;
		}
		
		/**
		 * get װ����Ϣ�б�
		 * @return 
		 */
		public function get equips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _equips;
		}
		
		/**
		 * set װ����Ϣ�б�
		 */
		public function set equips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._equips = value;
		}
		
	}
}