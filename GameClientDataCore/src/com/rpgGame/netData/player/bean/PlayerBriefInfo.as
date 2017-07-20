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
		
		//玩家性别 1男 2女
		private var _sex: int;
		
		//阶段
		private var _body: int;
		
		//衣服套装
		private var _cloths: int;
		
		//头发
		private var _hair: int;
		
		//主武器
		private var _weapon: int;
		
		//副武器
		private var _second_weapon: int;
		
		//美人ID
		private var _beautyModelid: int;
		
		//军阶Id
		private var _junJieModelId: int;
		
		//战旗
		private var _warFlagModelId: int;
		
		//美人技能信息
		private var _beautySkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//坐骑ID
		private var _horseModelid: int;
		
		//坐骑技能信息
		private var _horseSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//帮会名字
		private var _guildName: String;
		
		//玩家技能
		private var _playerSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//角色属性信息(可能不全 隐藏属性或者不需要别玩家知道的属性不发)
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//装备信息列表
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//玩家使用的加属性类道具
		private var _playerUseItems: Vector.<com.rpgGame.netData.player.bean.PlayerUseItem> = new Vector.<com.rpgGame.netData.player.bean.PlayerUseItem>();
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
			//玩家性别 1男 2女
			writeByte(_sex);
			//阶段
			writeByte(_body);
			//衣服套装
			writeInt(_cloths);
			//头发
			writeInt(_hair);
			//主武器
			writeInt(_weapon);
			//副武器
			writeInt(_second_weapon);
			//美人ID
			writeInt(_beautyModelid);
			//军阶Id
			writeInt(_junJieModelId);
			//战旗
			writeInt(_warFlagModelId);
			//美人技能信息
			writeShort(_beautySkillInfos.length);
			for (var i: int = 0; i < _beautySkillInfos.length; i++) {
				writeBean(_beautySkillInfos[i]);
			}
			//坐骑ID
			writeInt(_horseModelid);
			//坐骑技能信息
			writeShort(_horseSkillInfos.length);
			for (var i: int = 0; i < _horseSkillInfos.length; i++) {
				writeBean(_horseSkillInfos[i]);
			}
			//帮会名字
			writeString(_guildName);
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
			//玩家性别 1男 2女
			_sex = readByte();
			//阶段
			_body = readByte();
			//衣服套装
			_cloths = readInt();
			//头发
			_hair = readInt();
			//主武器
			_weapon = readInt();
			//副武器
			_second_weapon = readInt();
			//美人ID
			_beautyModelid = readInt();
			//军阶Id
			_junJieModelId = readInt();
			//战旗
			_warFlagModelId = readInt();
			//美人技能信息
			var beautySkillInfos_length : int = readShort();
			for (var i: int = 0; i < beautySkillInfos_length; i++) {
				_beautySkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//坐骑ID
			_horseModelid = readInt();
			//坐骑技能信息
			var horseSkillInfos_length : int = readShort();
			for (var i: int = 0; i < horseSkillInfos_length; i++) {
				_horseSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//帮会名字
			_guildName = readString();
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
		 * get 玩家性别 1男 2女
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 玩家性别 1男 2女
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 阶段
		 * @return 
		 */
		public function get body(): int{
			return _body;
		}
		
		/**
		 * set 阶段
		 */
		public function set body(value: int): void{
			this._body = value;
		}
		
		/**
		 * get 衣服套装
		 * @return 
		 */
		public function get cloths(): int{
			return _cloths;
		}
		
		/**
		 * set 衣服套装
		 */
		public function set cloths(value: int): void{
			this._cloths = value;
		}
		
		/**
		 * get 头发
		 * @return 
		 */
		public function get hair(): int{
			return _hair;
		}
		
		/**
		 * set 头发
		 */
		public function set hair(value: int): void{
			this._hair = value;
		}
		
		/**
		 * get 主武器
		 * @return 
		 */
		public function get weapon(): int{
			return _weapon;
		}
		
		/**
		 * set 主武器
		 */
		public function set weapon(value: int): void{
			this._weapon = value;
		}
		
		/**
		 * get 副武器
		 * @return 
		 */
		public function get second_weapon(): int{
			return _second_weapon;
		}
		
		/**
		 * set 副武器
		 */
		public function set second_weapon(value: int): void{
			this._second_weapon = value;
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
		 * get 军阶Id
		 * @return 
		 */
		public function get junJieModelId(): int{
			return _junJieModelId;
		}
		
		/**
		 * set 军阶Id
		 */
		public function set junJieModelId(value: int): void{
			this._junJieModelId = value;
		}
		
		/**
		 * get 战旗
		 * @return 
		 */
		public function get warFlagModelId(): int{
			return _warFlagModelId;
		}
		
		/**
		 * set 战旗
		 */
		public function set warFlagModelId(value: int): void{
			this._warFlagModelId = value;
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
		
	}
}