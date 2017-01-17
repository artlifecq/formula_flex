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
	 * 玩家外观展示信息
	 */
	public class PlayerBriefInfo extends Bean {
	
		//玩家id
		private var _playerid: long;
		
		//玩家Name
		private var _playerName: String;
		
		//玩家区id
		private var _serverid: int;
		
		//玩家战斗力
		private var _fightpower: int;
		
		//玩家等级
		private var _level: int;
		
		//玩家职业
		private var _job: int;
		
		//神器ID(时装关联)
		private var _artifactModelid: int;
		
		//美人ID
		private var _beautyModelid: int;
		
		//美人技能信息
		private var _beautySkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//美人装备信息列表
		private var _beautyEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//坐骑ID
		private var _horseModelid: int;
		
		//坐骑技能信息
		private var _horseSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//坐骑装备信息列表
		private var _horseEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//骑兵ID
		private var _weaponRideModelid: int;
		
		//骑兵技能信息
		private var _weaponRideSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//帮会名字
		private var _guildName: String;
		
		//崇拜值
		private var _worshipValue: int;
		
		//玩家技能
		private var _playerSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//装备信息列表
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//玩家使用的加属性类道具
		private var _playerUseItems: Vector.<com.rpgGame.netData.player.bean.PlayerUseItem> = new Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>();
		//金身阶数
		private var _goldenBodyLevel: int;
		
		//金身点数
		private var _goldenBodyPoint: int;
		
		//神装套装ID
		private var _godEquipSuitId: int;
		
		//翅膀技能
		private var _wingSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerid);
			//玩家Name
			writeString(_playerName);
			//玩家区id
			writeInt(_serverid);
			//玩家战斗力
			writeInt(_fightpower);
			//玩家等级
			writeInt(_level);
			//玩家职业
			writeByte(_job);
			//神器ID(时装关联)
			writeInt(_artifactModelid);
			//美人ID
			writeInt(_beautyModelid);
			//美人技能信息
			writeShort(_beautySkillInfos.length);
			for (var i: int = 0; i < _beautySkillInfos.length; i++) {
				writeBean(_beautySkillInfos[i]);
			}
			//美人装备信息列表
			writeShort(_beautyEquips.length);
			for (var i: int = 0; i < _beautyEquips.length; i++) {
				writeBean(_beautyEquips[i]);
			}
			//坐骑ID
			writeInt(_horseModelid);
			//坐骑技能信息
			writeShort(_horseSkillInfos.length);
			for (var i: int = 0; i < _horseSkillInfos.length; i++) {
				writeBean(_horseSkillInfos[i]);
			}
			//坐骑装备信息列表
			writeShort(_horseEquips.length);
			for (var i: int = 0; i < _horseEquips.length; i++) {
				writeBean(_horseEquips[i]);
			}
			//骑兵ID
			writeInt(_weaponRideModelid);
			//骑兵技能信息
			writeShort(_weaponRideSkillInfos.length);
			for (var i: int = 0; i < _weaponRideSkillInfos.length; i++) {
				writeBean(_weaponRideSkillInfos[i]);
			}
			//帮会名字
			writeString(_guildName);
			//崇拜值
			writeInt(_worshipValue);
			//玩家技能
			writeShort(_playerSkillInfos.length);
			for (var i: int = 0; i < _playerSkillInfos.length; i++) {
				writeBean(_playerSkillInfos[i]);
			}
			//角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
			writeShort(_attributeList.length);
			for (var i: int = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			//装备信息列表
			writeShort(_equips.length);
			for (var i: int = 0; i < _equips.length; i++) {
				writeBean(_equips[i]);
			}
			//玩家使用的加属性类道具
			writeShort(_playerUseItems.length);
			for (var i: int = 0; i < _playerUseItems.length; i++) {
				writeBean(_playerUseItems[i]);
			}
			//金身阶数
			writeInt(_goldenBodyLevel);
			//金身点数
			writeInt(_goldenBodyPoint);
			//神装套装ID
			writeByte(_godEquipSuitId);
			//翅膀技能
			writeShort(_wingSkillInfos.length);
			for (var i: int = 0; i < _wingSkillInfos.length; i++) {
				writeBean(_wingSkillInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerid = readLong();
			//玩家Name
			_playerName = readString();
			//玩家区id
			_serverid = readInt();
			//玩家战斗力
			_fightpower = readInt();
			//玩家等级
			_level = readInt();
			//玩家职业
			_job = readByte();
			//神器ID(时装关联)
			_artifactModelid = readInt();
			//美人ID
			_beautyModelid = readInt();
			//美人技能信息
			var beautySkillInfos_length : int = readShort();
			for (var i: int = 0; i < beautySkillInfos_length; i++) {
				_beautySkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//美人装备信息列表
			var beautyEquips_length : int = readShort();
			for (var i: int = 0; i < beautyEquips_length; i++) {
				_beautyEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//坐骑ID
			_horseModelid = readInt();
			//坐骑技能信息
			var horseSkillInfos_length : int = readShort();
			for (var i: int = 0; i < horseSkillInfos_length; i++) {
				_horseSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//坐骑装备信息列表
			var horseEquips_length : int = readShort();
			for (var i: int = 0; i < horseEquips_length; i++) {
				_horseEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//骑兵ID
			_weaponRideModelid = readInt();
			//骑兵技能信息
			var weaponRideSkillInfos_length : int = readShort();
			for (var i: int = 0; i < weaponRideSkillInfos_length; i++) {
				_weaponRideSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//帮会名字
			_guildName = readString();
			//崇拜值
			_worshipValue = readInt();
			//玩家技能
			var playerSkillInfos_length : int = readShort();
			for (var i: int = 0; i < playerSkillInfos_length; i++) {
				_playerSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
			var attributeList_length : int = readShort();
			for (var i: int = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			//装备信息列表
			var equips_length : int = readShort();
			for (var i: int = 0; i < equips_length; i++) {
				_equips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//玩家使用的加属性类道具
			var playerUseItems_length : int = readShort();
			for (var i: int = 0; i < playerUseItems_length; i++) {
				_playerUseItems[i] = readBean(com.rpgGame.netData.player.bean.PlayerUseItem) as com.rpgGame.netData.player.bean.PlayerUseItem;
			}
			//金身阶数
			_goldenBodyLevel = readInt();
			//金身点数
			_goldenBodyPoint = readInt();
			//神装套装ID
			_godEquipSuitId = readByte();
			//翅膀技能
			var wingSkillInfos_length : int = readShort();
			for (var i: int = 0; i < wingSkillInfos_length; i++) {
				_wingSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			return true;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
		/**
		 * get 玩家Name
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家Name
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 玩家区id
		 * @return 
		 */
		public function get serverid(): int{
			return _serverid;
		}
		
		/**
		 * set 玩家区id
		 */
		public function set serverid(value: int): void{
			this._serverid = value;
		}
		
		/**
		 * get 玩家战斗力
		 * @return 
		 */
		public function get fightpower(): int{
			return _fightpower;
		}
		
		/**
		 * set 玩家战斗力
		 */
		public function set fightpower(value: int): void{
			this._fightpower = value;
		}
		
		/**
		 * get 玩家等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 玩家等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 玩家职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 玩家职业
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get 神器ID(时装关联)
		 * @return 
		 */
		public function get artifactModelid(): int{
			return _artifactModelid;
		}
		
		/**
		 * set 神器ID(时装关联)
		 */
		public function set artifactModelid(value: int): void{
			this._artifactModelid = value;
		}
		
		/**
		 * get 美人ID
		 * @return 
		 */
		public function get beautyModelid(): int{
			return _beautyModelid;
		}
		
		/**
		 * set 美人ID
		 */
		public function set beautyModelid(value: int): void{
			this._beautyModelid = value;
		}
		
		/**
		 * get 美人技能信息
		 * @return 
		 */
		public function get beautySkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _beautySkillInfos;
		}
		
		/**
		 * set 美人技能信息
		 */
		public function set beautySkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._beautySkillInfos = value;
		}
		
		/**
		 * get 美人装备信息列表
		 * @return 
		 */
		public function get beautyEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _beautyEquips;
		}
		
		/**
		 * set 美人装备信息列表
		 */
		public function set beautyEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._beautyEquips = value;
		}
		
		/**
		 * get 坐骑ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 坐骑ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
		/**
		 * get 坐骑技能信息
		 * @return 
		 */
		public function get horseSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _horseSkillInfos;
		}
		
		/**
		 * set 坐骑技能信息
		 */
		public function set horseSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._horseSkillInfos = value;
		}
		
		/**
		 * get 坐骑装备信息列表
		 * @return 
		 */
		public function get horseEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _horseEquips;
		}
		
		/**
		 * set 坐骑装备信息列表
		 */
		public function set horseEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._horseEquips = value;
		}
		
		/**
		 * get 骑兵ID
		 * @return 
		 */
		public function get weaponRideModelid(): int{
			return _weaponRideModelid;
		}
		
		/**
		 * set 骑兵ID
		 */
		public function set weaponRideModelid(value: int): void{
			this._weaponRideModelid = value;
		}
		
		/**
		 * get 骑兵技能信息
		 * @return 
		 */
		public function get weaponRideSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _weaponRideSkillInfos;
		}
		
		/**
		 * set 骑兵技能信息
		 */
		public function set weaponRideSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._weaponRideSkillInfos = value;
		}
		
		/**
		 * get 帮会名字
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名字
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 崇拜值
		 * @return 
		 */
		public function get worshipValue(): int{
			return _worshipValue;
		}
		
		/**
		 * set 崇拜值
		 */
		public function set worshipValue(value: int): void{
			this._worshipValue = value;
		}
		
		/**
		 * get 玩家技能
		 * @return 
		 */
		public function get playerSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _playerSkillInfos;
		}
		
		/**
		 * set 玩家技能
		 */
		public function set playerSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._playerSkillInfos = value;
		}
		
		/**
		 * get 角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
		 * @return 
		 */
		public function get attributeList(): Vector.<AttributeItem>{
			return _attributeList;
		}
		
		/**
		 * set 角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
		 */
		public function set attributeList(value: Vector.<AttributeItem>): void{
			this._attributeList = value;
		}
		
		/**
		 * get 装备信息列表
		 * @return 
		 */
		public function get equips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _equips;
		}
		
		/**
		 * set 装备信息列表
		 */
		public function set equips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._equips = value;
		}
		
		/**
		 * get 玩家使用的加属性类道具
		 * @return 
		 */
		public function get playerUseItems(): Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>{
			return _playerUseItems;
		}
		
		/**
		 * set 玩家使用的加属性类道具
		 */
		public function set playerUseItems(value: Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>): void{
			this._playerUseItems = value;
		}
		
		/**
		 * get 金身阶数
		 * @return 
		 */
		public function get goldenBodyLevel(): int{
			return _goldenBodyLevel;
		}
		
		/**
		 * set 金身阶数
		 */
		public function set goldenBodyLevel(value: int): void{
			this._goldenBodyLevel = value;
		}
		
		/**
		 * get 金身点数
		 * @return 
		 */
		public function get goldenBodyPoint(): int{
			return _goldenBodyPoint;
		}
		
		/**
		 * set 金身点数
		 */
		public function set goldenBodyPoint(value: int): void{
			this._goldenBodyPoint = value;
		}
		
		/**
		 * get 神装套装ID
		 * @return 
		 */
		public function get godEquipSuitId(): int{
			return _godEquipSuitId;
		}
		
		/**
		 * set 神装套装ID
		 */
		public function set godEquipSuitId(value: int): void{
			this._godEquipSuitId = value;
		}
		
		/**
		 * get 翅膀技能
		 * @return 
		 */
		public function get wingSkillInfos(): Vector.<com.rpgGame.netData.skill.bean.SkillInfo>{
			return _wingSkillInfos;
		}
		
		/**
		 * set 翅膀技能
		 */
		public function set wingSkillInfos(value: Vector.<com.rpgGame.netData.skill.bean.SkillInfo>): void{
			this._wingSkillInfos = value;
		}
		
	}
}