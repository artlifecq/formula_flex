package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.PlayerUseItem;
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
	 * ������չʾ��Ϣ
	 */
	public class PlayerBriefInfo extends Bean {
	
		//���id
		private var _playerid: long;
		
		//���Name
		private var _playerName: String;
		
		//�����id
		private var _serverid: int;
		
		//���ս����
		private var _fightpower: int;
		
		//��ҵȼ�
		private var _level: int;
		
		//���ְҵ
		private var _job: int;
		
		//����ID(ʱװ����)
		private var _artifactModelid: int;
		
		//����ID
		private var _beautyModelid: int;
		
		//���˼�����Ϣ
		private var _beautySkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//����װ����Ϣ�б�
		private var _beautyEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//����ID
		private var _horseModelid: int;
		
		//���＼����Ϣ
		private var _horseSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//����װ����Ϣ�б�
		private var _horseEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//���ID
		private var _weaponRideModelid: int;
		
		//���������Ϣ
		private var _weaponRideSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//�������
		private var _guildName: String;
		
		//���ֵ
		private var _worshipValue: int;
		
		//��Ҽ���
		private var _playerSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//��ɫ������Ϣ(���ܲ�ȫ �������Ի��߲���Ҫ�����֪�������Բ���)
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//װ����Ϣ�б�
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//���ʹ�õļ����������
		private var _playerUseItems: Vector.<com.rpgGame.netData.player.bean.PlayerUseItem> = new Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>();
		//�������
		private var _goldenBodyLevel: int;
		
		//�������
		private var _goldenBodyPoint: int;
		
		//��װ��װID
		private var _godEquipSuitId: int;
		
		//�����
		private var _wingSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		/**
		 * д���ֽڻ���
		 */
		override protected function writing(): Boolean{
			//���id
			writeLong(_playerid);
			//���Name
			writeString(_playerName);
			//�����id
			writeInt(_serverid);
			//���ս����
			writeInt(_fightpower);
			//��ҵȼ�
			writeInt(_level);
			//���ְҵ
			writeByte(_job);
			//����ID(ʱװ����)
			writeInt(_artifactModelid);
			//����ID
			writeInt(_beautyModelid);
			//���˼�����Ϣ
			writeShort(_beautySkillInfos.length);
			for (var i: int = 0; i < _beautySkillInfos.length; i++) {
				writeBean(_beautySkillInfos[i]);
			}
			//����װ����Ϣ�б�
			writeShort(_beautyEquips.length);
			for (var i: int = 0; i < _beautyEquips.length; i++) {
				writeBean(_beautyEquips[i]);
			}
			//����ID
			writeInt(_horseModelid);
			//���＼����Ϣ
			writeShort(_horseSkillInfos.length);
			for (var i: int = 0; i < _horseSkillInfos.length; i++) {
				writeBean(_horseSkillInfos[i]);
			}
			//����װ����Ϣ�б�
			writeShort(_horseEquips.length);
			for (var i: int = 0; i < _horseEquips.length; i++) {
				writeBean(_horseEquips[i]);
			}
			//���ID
			writeInt(_weaponRideModelid);
			//���������Ϣ
			writeShort(_weaponRideSkillInfos.length);
			for (var i: int = 0; i < _weaponRideSkillInfos.length; i++) {
				writeBean(_weaponRideSkillInfos[i]);
			}
			//�������
			writeString(_guildName);
			//���ֵ
			writeInt(_worshipValue);
			//��Ҽ���
			writeShort(_playerSkillInfos.length);
			for (var i: int = 0; i < _playerSkillInfos.length; i++) {
				writeBean(_playerSkillInfos[i]);
			}
			//��ɫ������Ϣ(���ܲ�ȫ �������Ի��߲���Ҫ�����֪�������Բ���)
			writeShort(_attributeList.length);
			for (var i: int = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			//װ����Ϣ�б�
			writeShort(_equips.length);
			for (var i: int = 0; i < _equips.length; i++) {
				writeBean(_equips[i]);
			}
			//���ʹ�õļ����������
			writeShort(_playerUseItems.length);
			for (var i: int = 0; i < _playerUseItems.length; i++) {
				writeBean(_playerUseItems[i]);
			}
			//�������
			writeInt(_goldenBodyLevel);
			//�������
			writeInt(_goldenBodyPoint);
			//��װ��װID
			writeByte(_godEquipSuitId);
			//�����
			writeShort(_wingSkillInfos.length);
			for (var i: int = 0; i < _wingSkillInfos.length; i++) {
				writeBean(_wingSkillInfos[i]);
			}
			return true;
		}
		
		/**
		 * ��ȡ�ֽڻ���
		 */
		override protected function reading(): Boolean{
			//���id
			_playerid = readLong();
			//���Name
			_playerName = readString();
			//�����id
			_serverid = readInt();
			//���ս����
			_fightpower = readInt();
			//��ҵȼ�
			_level = readInt();
			//���ְҵ
			_job = readByte();
			//����ID(ʱװ����)
			_artifactModelid = readInt();
			//����ID
			_beautyModelid = readInt();
			//���˼�����Ϣ
			var beautySkillInfos_length : int = readShort();
			for (var i: int = 0; i < beautySkillInfos_length; i++) {
				_beautySkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//����װ����Ϣ�б�
			var beautyEquips_length : int = readShort();
			for (var i: int = 0; i < beautyEquips_length; i++) {
				_beautyEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//����ID
			_horseModelid = readInt();
			//���＼����Ϣ
			var horseSkillInfos_length : int = readShort();
			for (var i: int = 0; i < horseSkillInfos_length; i++) {
				_horseSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//����װ����Ϣ�б�
			var horseEquips_length : int = readShort();
			for (var i: int = 0; i < horseEquips_length; i++) {
				_horseEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//���ID
			_weaponRideModelid = readInt();
			//���������Ϣ
			var weaponRideSkillInfos_length : int = readShort();
			for (var i: int = 0; i < weaponRideSkillInfos_length; i++) {
				_weaponRideSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//�������
			_guildName = readString();
			//���ֵ
			_worshipValue = readInt();
			//��Ҽ���
			var playerSkillInfos_length : int = readShort();
			for (var i: int = 0; i < playerSkillInfos_length; i++) {
				_playerSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//��ɫ������Ϣ(���ܲ�ȫ �������Ի��߲���Ҫ�����֪�������Բ���)
			var attributeList_length : int = readShort();
			for (var i: int = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			//װ����Ϣ�б�
			var equips_length : int = readShort();
			for (var i: int = 0; i < equips_length; i++) {
				_equips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//���ʹ�õļ����������
			var playerUseItems_length : int = readShort();
			for (var i: int = 0; i < playerUseItems_length; i++) {
				_playerUseItems[i] = readBean(com.rpgGame.netData.player.bean.PlayerUseItem) as com.rpgGame.netData.player.bean.PlayerUseItem;
			}
			//�������
			_goldenBodyLevel = readInt();
			//�������
			_goldenBodyPoint = readInt();
			//��װ��װID
			_godEquipSuitId = readByte();
			//�����
			var wingSkillInfos_length : int = readShort();
			for (var i: int = 0; i < wingSkillInfos_length; i++) {
				_wingSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			return true;
		}
		
		/**
		 * get ���id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set ���id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
		/**
		 * get ���Name
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set ���Name
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get �����id
		 * @return 
		 */
		public function get serverid(): int{
			return _serverid;
		}
		
		/**
		 * set �����id
		 */
		public function set serverid(value: int): void{
			this._serverid = value;
		}
		
		/**
		 * get ���ս����
		 * @return 
		 */
		public function get fightpower(): int{
			return _fightpower;
		}
		
		/**
		 * set ���ս����
		 */
		public function set fightpower(value: int): void{
			this._fightpower = value;
		}
		
		/**
		 * get ��ҵȼ�
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set ��ҵȼ�
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get ���ְҵ
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set ���ְҵ
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get ����ID(ʱװ����)
		 * @return 
		 */
		public function get artifactModelid(): int{
			return _artifactModelid;
		}
		
		/**
		 * set ����ID(ʱװ����)
		 */
		public function set artifactModelid(value: int): void{
			this._artifactModelid = value;
		}
		
		/**
		 * get ����ID
		 * @return 
		 */
		public function get beautyModelid(): int{
			return _beautyModelid;
		}
		
		/**
		 * set ����ID
		 */
		public function set beautyModelid(value: int): void{
			this._beautyModelid = value;
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
		 * get ����װ����Ϣ�б�
		 * @return 
		 */
		public function get beautyEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _beautyEquips;
		}
		
		/**
		 * set ����װ����Ϣ�б�
		 */
		public function set beautyEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._beautyEquips = value;
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
		 * get ���＼����Ϣ
		 * @return 
		 */
		public function get horseSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _horseSkillInfos;
		}
		
		/**
		 * set ���＼����Ϣ
		 */
		public function set horseSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._horseSkillInfos = value;
		}
		
		/**
		 * get ����װ����Ϣ�б�
		 * @return 
		 */
		public function get horseEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _horseEquips;
		}
		
		/**
		 * set ����װ����Ϣ�б�
		 */
		public function set horseEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._horseEquips = value;
		}
		
		/**
		 * get ���ID
		 * @return 
		 */
		public function get weaponRideModelid(): int{
			return _weaponRideModelid;
		}
		
		/**
		 * set ���ID
		 */
		public function set weaponRideModelid(value: int): void{
			this._weaponRideModelid = value;
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
		 * get ���ֵ
		 * @return 
		 */
		public function get worshipValue(): int{
			return _worshipValue;
		}
		
		/**
		 * set ���ֵ
		 */
		public function set worshipValue(value: int): void{
			this._worshipValue = value;
		}
		
		/**
		 * get ��Ҽ���
		 * @return 
		 */
		public function get playerSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _playerSkillInfos;
		}
		
		/**
		 * set ��Ҽ���
		 */
		public function set playerSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._playerSkillInfos = value;
		}
		
		/**
		 * get ��ɫ������Ϣ(���ܲ�ȫ �������Ի��߲���Ҫ�����֪�������Բ���)
		 * @return 
		 */
		public function get attributeList(): Vector.<AttributeItem>{
			return _attributeList;
		}
		
		/**
		 * set ��ɫ������Ϣ(���ܲ�ȫ �������Ի��߲���Ҫ�����֪�������Բ���)
		 */
		public function set attributeList(value: Vector.<AttributeItem>): void{
			this._attributeList = value;
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
		
		/**
		 * get ���ʹ�õļ����������
		 * @return 
		 */
		public function get playerUseItems(): Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>{
			return _playerUseItems;
		}
		
		/**
		 * set ���ʹ�õļ����������
		 */
		public function set playerUseItems(value: Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>): void{
			this._playerUseItems = value;
		}
		
		/**
		 * get �������
		 * @return 
		 */
		public function get goldenBodyLevel(): int{
			return _goldenBodyLevel;
		}
		
		/**
		 * set �������
		 */
		public function set goldenBodyLevel(value: int): void{
			this._goldenBodyLevel = value;
		}
		
		/**
		 * get �������
		 * @return 
		 */
		public function get goldenBodyPoint(): int{
			return _goldenBodyPoint;
		}
		
		/**
		 * set �������
		 */
		public function set goldenBodyPoint(value: int): void{
			this._goldenBodyPoint = value;
		}
		
		/**
		 * get ��װ��װID
		 * @return 
		 */
		public function get godEquipSuitId(): int{
			return _godEquipSuitId;
		}
		
		/**
		 * set ��װ��װID
		 */
		public function set godEquipSuitId(value: int): void{
			this._godEquipSuitId = value;
		}
		
		/**
		 * get �����
		 * @return 
		 */
		public function get wingSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _wingSkillInfos;
		}
		
		/**
		 * set �����
		 */
		public function set wingSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._wingSkillInfos = value;
		}
		
	}
}