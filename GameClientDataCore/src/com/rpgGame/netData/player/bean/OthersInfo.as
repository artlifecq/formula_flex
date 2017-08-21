package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.ResourceDataItem;
	import com.rpgGame.netData.player.bean.OtherFightPower;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.player.bean.AttributeItem;
	
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
		
		//职业
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
		
		//坐骑
		private var _mount: int;
		
		//战斗力
		private var _fightpower: int;
		
		//vip等级
		private var _viplevel: int;
		
		//帮会名称
		private var _guildName: String;
		
		//帮会职位
		private var _guildMemberType: int;
		
		//结婚对象名字
		private var _marriageName: String;
		
		//当前经验值
		private var _exp: long;
		
		//最大经验值
		private var _maxExp: long;
		
		//最大真气值
		private var _maxZhenQi: long;
		
		//婚戒阶数
		private var _advanceWedding: int;
		
		//角色属性信息
		private var _attributeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//资源属性项
		private var _resourceData: Vector.<ResourceDataItem> = new Vector.<ResourceDataItem>();
		//装备信息列表
		private var _equips: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//玩家自己相关战斗力
		private var _selfFightPower: Vector.<OtherFightPower> = new Vector.<OtherFightPower>();
		//查询玩家相关战斗力
		private var _otherFightPowr: Vector.<OtherFightPower> = new Vector.<OtherFightPower>();
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
			//职业
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
			//坐骑
			writeInt(_mount);
			//战斗力
			writeInt(_fightpower);
			//vip等级
			writeByte(_viplevel);
			//帮会名称
			writeString(_guildName);
			//帮会职位
			writeInt(_guildMemberType);
			//结婚对象名字
			writeString(_marriageName);
			//当前经验值
			writeLong(_exp);
			//最大经验值
			writeLong(_maxExp);
			//最大真气值
			writeLong(_maxZhenQi);
			//婚戒阶数
			writeInt(_advanceWedding);
			//角色属性信息
			writeShort(_attributeList.length);
			for (var i: int = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			//资源属性项
			writeShort(_resourceData.length);
			for (var i: int = 0; i < _resourceData.length; i++) {
				writeBean(_resourceData[i]);
			}
			//装备信息列表
			writeShort(_equips.length);
			for (var i: int = 0; i < _equips.length; i++) {
				writeBean(_equips[i]);
			}
			//玩家自己相关战斗力
			writeShort(_selfFightPower.length);
			for (var i: int = 0; i < _selfFightPower.length; i++) {
				writeBean(_selfFightPower[i]);
			}
			//查询玩家相关战斗力
			writeShort(_otherFightPowr.length);
			for (var i: int = 0; i < _otherFightPowr.length; i++) {
				writeBean(_otherFightPowr[i]);
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
			//职业
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
			//坐骑
			_mount = readInt();
			//战斗力
			_fightpower = readInt();
			//vip等级
			_viplevel = readByte();
			//帮会名称
			_guildName = readString();
			//帮会职位
			_guildMemberType = readInt();
			//结婚对象名字
			_marriageName = readString();
			//当前经验值
			_exp = readLong();
			//最大经验值
			_maxExp = readLong();
			//最大真气值
			_maxZhenQi = readLong();
			//婚戒阶数
			_advanceWedding = readInt();
			//角色属性信息
			var attributeList_length : int = readShort();
			for (var i: int = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			//资源属性项
			var resourceData_length : int = readShort();
			for (var i: int = 0; i < resourceData_length; i++) {
				_resourceData[i] = readBean(ResourceDataItem) as ResourceDataItem;
			}
			//装备信息列表
			var equips_length : int = readShort();
			for (var i: int = 0; i < equips_length; i++) {
				_equips[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//玩家自己相关战斗力
			var selfFightPower_length : int = readShort();
			for (var i: int = 0; i < selfFightPower_length; i++) {
				_selfFightPower[i] = readBean(OtherFightPower) as OtherFightPower;
			}
			//查询玩家相关战斗力
			var otherFightPowr_length : int = readShort();
			for (var i: int = 0; i < otherFightPowr_length; i++) {
				_otherFightPowr[i] = readBean(OtherFightPower) as OtherFightPower;
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
		 * get 职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 职业
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
		 * get 坐骑
		 * @return 
		 */
		public function get mount(): int{
			return _mount;
		}
		
		/**
		 * set 坐骑
		 */
		public function set mount(value: int): void{
			this._mount = value;
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
		 * get 帮会职位
		 * @return 
		 */
		public function get guildMemberType(): int{
			return _guildMemberType;
		}
		
		/**
		 * set 帮会职位
		 */
		public function set guildMemberType(value: int): void{
			this._guildMemberType = value;
		}
		
		/**
		 * get 结婚对象名字
		 * @return 
		 */
		public function get marriageName(): String{
			return _marriageName;
		}
		
		/**
		 * set 结婚对象名字
		 */
		public function set marriageName(value: String): void{
			this._marriageName = value;
		}
		
		/**
		 * get 当前经验值
		 * @return 
		 */
		public function get exp(): long{
			return _exp;
		}
		
		/**
		 * set 当前经验值
		 */
		public function set exp(value: long): void{
			this._exp = value;
		}
		
		/**
		 * get 最大经验值
		 * @return 
		 */
		public function get maxExp(): long{
			return _maxExp;
		}
		
		/**
		 * set 最大经验值
		 */
		public function set maxExp(value: long): void{
			this._maxExp = value;
		}
		
		/**
		 * get 最大真气值
		 * @return 
		 */
		public function get maxZhenQi(): long{
			return _maxZhenQi;
		}
		
		/**
		 * set 最大真气值
		 */
		public function set maxZhenQi(value: long): void{
			this._maxZhenQi = value;
		}
		
		/**
		 * get 婚戒阶数
		 * @return 
		 */
		public function get advanceWedding(): int{
			return _advanceWedding;
		}
		
		/**
		 * set 婚戒阶数
		 */
		public function set advanceWedding(value: int): void{
			this._advanceWedding = value;
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
		 * get 资源属性项
		 * @return 
		 */
		public function get resourceData(): Vector.<ResourceDataItem>{
			return _resourceData;
		}
		
		/**
		 * set 资源属性项
		 */
		public function set resourceData(value: Vector.<ResourceDataItem>): void{
			this._resourceData = value;
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
		 * get 玩家自己相关战斗力
		 * @return 
		 */
		public function get selfFightPower(): Vector.<OtherFightPower>{
			return _selfFightPower;
		}
		
		/**
		 * set 玩家自己相关战斗力
		 */
		public function set selfFightPower(value: Vector.<OtherFightPower>): void{
			this._selfFightPower = value;
		}
		
		/**
		 * get 查询玩家相关战斗力
		 * @return 
		 */
		public function get otherFightPowr(): Vector.<OtherFightPower>{
			return _otherFightPowr;
		}
		
		/**
		 * set 查询玩家相关战斗力
		 */
		public function set otherFightPowr(value: Vector.<OtherFightPower>): void{
			this._otherFightPowr = value;
		}
		
	}
}