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
	 * 他人详细信息
	 */
	public class OthersInfo extends Bean {
	
		//角色Id
		private var _personId: long;
		
		//角色名字
		private var _name: String;
		
		//角色等级
		private var _level: int;
		
		//角色属性信息
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//骑兵造型ID
		private var _knightWepId: int;
		
		//性别 0女 1男
		private var _sex: int;
		
		//美人ID
		private var _beautyModelId: int;
		
		//美人技能信息
		private var _beautySkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//坐骑ID
		private var _horseModelid: int;
		
		//坐骑装备列表(4个格子,空的是itemid为0)
		private var _horseEquips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//骑兵技能信息
		private var _weaponRideSkillInfos: Vector.<com.rpgGame.netData.skill.bean.SkillInfo> = new Vector.<com.rpgGame.netData.skill.bean.SkillInfo>();
		//战斗力
		private var _fightpower: int;
		
		//vip等级
		private var _viplevel: int;
		
		//帮会名称
		private var _guildName: String;
		
		//成就等级
		private var _achievementLv: int;
		
		//当前成就值
		private var _achievementValue: int;
		
		//击杀BOSS数
		private var _bossKillNum: int;
		
		//装备战印Id
		private var _warMarkId: int;
		
		//装备信息列表
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_personId);
			//角色名字
			writeString(_name);
			//角色等级
			writeShort(_level);
			//角色属性信息
			writeShort(_attributeList.length);
			for (var i: int = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			//骑兵造型ID
			writeByte(_knightWepId);
			//性别 0女 1男
			writeByte(_sex);
			//美人ID
			writeByte(_beautyModelId);
			//美人技能信息
			writeShort(_beautySkillInfos.length);
			for (var i: int = 0; i < _beautySkillInfos.length; i++) {
				writeBean(_beautySkillInfos[i]);
			}
			//坐骑ID
			writeByte(_horseModelid);
			//坐骑装备列表(4个格子,空的是itemid为0)
			writeShort(_horseEquips.length);
			for (var i: int = 0; i < _horseEquips.length; i++) {
				writeBean(_horseEquips[i]);
			}
			//骑兵技能信息
			writeShort(_weaponRideSkillInfos.length);
			for (var i: int = 0; i < _weaponRideSkillInfos.length; i++) {
				writeBean(_weaponRideSkillInfos[i]);
			}
			//战斗力
			writeInt(_fightpower);
			//vip等级
			writeByte(_viplevel);
			//帮会名称
			writeString(_guildName);
			//成就等级
			writeShort(_achievementLv);
			//当前成就值
			writeInt(_achievementValue);
			//击杀BOSS数
			writeShort(_bossKillNum);
			//装备战印Id
			writeInt(_warMarkId);
			//装备信息列表
			writeShort(_equips.length);
			for (var i: int = 0; i < _equips.length; i++) {
				writeBean(_equips[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readLong();
			//角色名字
			_name = readString();
			//角色等级
			_level = readShort();
			//角色属性信息
			var attributeList_length : int = readShort();
			for (var i: int = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			//骑兵造型ID
			_knightWepId = readByte();
			//性别 0女 1男
			_sex = readByte();
			//美人ID
			_beautyModelId = readByte();
			//美人技能信息
			var beautySkillInfos_length : int = readShort();
			for (var i: int = 0; i < beautySkillInfos_length; i++) {
				_beautySkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//坐骑ID
			_horseModelid = readByte();
			//坐骑装备列表(4个格子,空的是itemid为0)
			var horseEquips_length : int = readShort();
			for (var i: int = 0; i < horseEquips_length; i++) {
				_horseEquips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//骑兵技能信息
			var weaponRideSkillInfos_length : int = readShort();
			for (var i: int = 0; i < weaponRideSkillInfos_length; i++) {
				_weaponRideSkillInfos[i] = readBean(com.rpgGame.netData.skill.bean.SkillInfo) as com.rpgGame.netData.skill.bean.SkillInfo;
			}
			//战斗力
			_fightpower = readInt();
			//vip等级
			_viplevel = readByte();
			//帮会名称
			_guildName = readString();
			//成就等级
			_achievementLv = readShort();
			//当前成就值
			_achievementValue = readInt();
			//击杀BOSS数
			_bossKillNum = readShort();
			//装备战印Id
			_warMarkId = readInt();
			//装备信息列表
			var equips_length : int = readShort();
			for (var i: int = 0; i < equips_length; i++) {
				_equips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: long): void{
			this._personId = value;
		}
		
		/**
		 * get 角色名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 角色名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 角色等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 角色等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 角色属性信息
		 * @return 
		 */
		public function get attributeList(): Vector.<AttributeItem>{
			return _attributeList;
		}
		
		/**
		 * set 角色属性信息
		 */
		public function set attributeList(value: Vector.<AttributeItem>): void{
			this._attributeList = value;
		}
		
		/**
		 * get 骑兵造型ID
		 * @return 
		 */
		public function get knightWepId(): int{
			return _knightWepId;
		}
		
		/**
		 * set 骑兵造型ID
		 */
		public function set knightWepId(value: int): void{
			this._knightWepId = value;
		}
		
		/**
		 * get 性别 0女 1男
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 性别 0女 1男
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 美人ID
		 * @return 
		 */
		public function get beautyModelId(): int{
			return _beautyModelId;
		}
		
		/**
		 * set 美人ID
		 */
		public function set beautyModelId(value: int): void{
			this._beautyModelId = value;
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
		 * get 坐骑装备列表(4个格子,空的是itemid为0)
		 * @return 
		 */
		public function get horseEquips(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _horseEquips;
		}
		
		/**
		 * set 坐骑装备列表(4个格子,空的是itemid为0)
		 */
		public function set horseEquips(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._horseEquips = value;
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
		 * get 战斗力
		 * @return 
		 */
		public function get fightpower(): int{
			return _fightpower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightpower(value: int): void{
			this._fightpower = value;
		}
		
		/**
		 * get vip等级
		 * @return 
		 */
		public function get viplevel(): int{
			return _viplevel;
		}
		
		/**
		 * set vip等级
		 */
		public function set viplevel(value: int): void{
			this._viplevel = value;
		}
		
		/**
		 * get 帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 成就等级
		 * @return 
		 */
		public function get achievementLv(): int{
			return _achievementLv;
		}
		
		/**
		 * set 成就等级
		 */
		public function set achievementLv(value: int): void{
			this._achievementLv = value;
		}
		
		/**
		 * get 当前成就值
		 * @return 
		 */
		public function get achievementValue(): int{
			return _achievementValue;
		}
		
		/**
		 * set 当前成就值
		 */
		public function set achievementValue(value: int): void{
			this._achievementValue = value;
		}
		
		/**
		 * get 击杀BOSS数
		 * @return 
		 */
		public function get bossKillNum(): int{
			return _bossKillNum;
		}
		
		/**
		 * set 击杀BOSS数
		 */
		public function set bossKillNum(value: int): void{
			this._bossKillNum = value;
		}
		
		/**
		 * get 装备战印Id
		 * @return 
		 */
		public function get warMarkId(): int{
			return _warMarkId;
		}
		
		/**
		 * set 装备战印Id
		 */
		public function set warMarkId(value: int): void{
			this._warMarkId = value;
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
		
	}
}