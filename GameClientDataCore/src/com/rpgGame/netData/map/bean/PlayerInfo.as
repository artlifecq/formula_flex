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
	 * 角色信息类(在地图上显示)
	 */
	public class PlayerInfo extends Bean {
	
		//角色Id
		private var _personId: long;
		
		//角色名字
		private var _name: String;
		
		//角色等级
		private var _level: int;
		
		//角色所在X
		private var _x: int;
		
		//角色所在Y
		private var _y: int;
		
		//角色HP
		private var _hp: int;
		
		//角色最大HP
		private var _maxHp: int;
		
		//角色MP
		private var _mp: int;
		
		//角色最大MP
		private var _maxMp: int;
		
		//角色速度
		private var _speed: int;
		
		//vip等级
		private var _viplevel: int;
		
		//角色状态
		private var _state: int;
		
		//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		private var _weapon_clothes_sex: int;
		
		//低8位表示强化等级，其它位表示注灵等级
		private var _streng_soul: int;
		
		//玩家坐骑ID
		private var _horseModelid: int;
		
		//玩家坐骑兵器ID
		private var _horseWeaponModelid: int;
		
		//玩家披风ID
		private var _cloakModelid: int;
		
		//宠物ID
		private var _petModelid: int;
		
		//美人血量，默认血量上限是100或者根据MID
		private var _petHP: int;
		
		//美人阶级
		private var _petRank: int;
		
		//美人等级
		private var _petLevel: int;
		
		//侍宠当前攻击目标
		private var _petTarget: long;
		
		//军衔等级
		private var _ranklevel: int;
		
		//战斗力
		private var _fightpower: int;
		
		//平台标识
		private var _webname: String;
		
		//人物面对方向
		private var _dir: int;
		
		//跑步坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//队伍ID
		private var _team: long;
		
		//帮派ID
		private var _guildid: long;
		
		//帮派名称
		private var _guildName: String;
		
		//PK模式
		private var _pkstate: int;
		
		//buff集合
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		//装备战印Id
		private var _warMarkId: int;
		
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
			//角色所在X
			writeShort(_x);
			//角色所在Y
			writeShort(_y);
			//角色HP
			writeInt(_hp);
			//角色最大HP
			writeInt(_maxHp);
			//角色MP
			writeInt(_mp);
			//角色最大MP
			writeInt(_maxMp);
			//角色速度
			writeShort(_speed);
			//vip等级
			writeByte(_viplevel);
			//角色状态
			writeInt(_state);
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			writeInt(_weapon_clothes_sex);
			//低8位表示强化等级，其它位表示注灵等级
			writeShort(_streng_soul);
			//玩家坐骑ID
			writeByte(_horseModelid);
			//玩家坐骑兵器ID
			writeByte(_horseWeaponModelid);
			//玩家披风ID
			writeByte(_cloakModelid);
			//宠物ID
			writeByte(_petModelid);
			//美人血量，默认血量上限是100或者根据MID
			writeByte(_petHP);
			//美人阶级
			writeByte(_petRank);
			//美人等级
			writeByte(_petLevel);
			//侍宠当前攻击目标
			writeLong(_petTarget);
			//军衔等级
			writeByte(_ranklevel);
			//战斗力
			writeInt(_fightpower);
			//平台标识
			writeString(_webname);
			//人物面对方向
			writeByte(_dir);
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//队伍ID
			writeLong(_team);
			//帮派ID
			writeLong(_guildid);
			//帮派名称
			writeString(_guildName);
			//PK模式
			writeByte(_pkstate);
			//buff集合
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			//装备战印Id
			writeInt(_warMarkId);
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
			//角色所在X
			_x = readShort();
			//角色所在Y
			_y = readShort();
			//角色HP
			_hp = readInt();
			//角色最大HP
			_maxHp = readInt();
			//角色MP
			_mp = readInt();
			//角色最大MP
			_maxMp = readInt();
			//角色速度
			_speed = readShort();
			//vip等级
			_viplevel = readByte();
			//角色状态
			_state = readInt();
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			_weapon_clothes_sex = readInt();
			//低8位表示强化等级，其它位表示注灵等级
			_streng_soul = readShort();
			//玩家坐骑ID
			_horseModelid = readByte();
			//玩家坐骑兵器ID
			_horseWeaponModelid = readByte();
			//玩家披风ID
			_cloakModelid = readByte();
			//宠物ID
			_petModelid = readByte();
			//美人血量，默认血量上限是100或者根据MID
			_petHP = readByte();
			//美人阶级
			_petRank = readByte();
			//美人等级
			_petLevel = readByte();
			//侍宠当前攻击目标
			_petTarget = readLong();
			//军衔等级
			_ranklevel = readByte();
			//战斗力
			_fightpower = readInt();
			//平台标识
			_webname = readString();
			//人物面对方向
			_dir = readByte();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//队伍ID
			_team = readLong();
			//帮派ID
			_guildid = readLong();
			//帮派名称
			_guildName = readString();
			//PK模式
			_pkstate = readByte();
			//buff集合
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			//装备战印Id
			_warMarkId = readInt();
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
		 * get 角色所在X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 角色所在X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 角色所在Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 角色所在Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 角色HP
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set 角色HP
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
		/**
		 * get 角色最大HP
		 * @return 
		 */
		public function get maxHp(): int{
			return _maxHp;
		}
		
		/**
		 * set 角色最大HP
		 */
		public function set maxHp(value: int): void{
			this._maxHp = value;
		}
		
		/**
		 * get 角色MP
		 * @return 
		 */
		public function get mp(): int{
			return _mp;
		}
		
		/**
		 * set 角色MP
		 */
		public function set mp(value: int): void{
			this._mp = value;
		}
		
		/**
		 * get 角色最大MP
		 * @return 
		 */
		public function get maxMp(): int{
			return _maxMp;
		}
		
		/**
		 * set 角色最大MP
		 */
		public function set maxMp(value: int): void{
			this._maxMp = value;
		}
		
		/**
		 * get 角色速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 角色速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
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
		 * get 角色状态
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 角色状态
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get 武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		 * @return 
		 */
		public function get weapon_clothes_sex(): int{
			return _weapon_clothes_sex;
		}
		
		/**
		 * set 武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		 */
		public function set weapon_clothes_sex(value: int): void{
			this._weapon_clothes_sex = value;
		}
		
		/**
		 * get 低8位表示强化等级，其它位表示注灵等级
		 * @return 
		 */
		public function get streng_soul(): int{
			return _streng_soul;
		}
		
		/**
		 * set 低8位表示强化等级，其它位表示注灵等级
		 */
		public function set streng_soul(value: int): void{
			this._streng_soul = value;
		}
		
		/**
		 * get 玩家坐骑ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 玩家坐骑ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
		/**
		 * get 玩家坐骑兵器ID
		 * @return 
		 */
		public function get horseWeaponModelid(): int{
			return _horseWeaponModelid;
		}
		
		/**
		 * set 玩家坐骑兵器ID
		 */
		public function set horseWeaponModelid(value: int): void{
			this._horseWeaponModelid = value;
		}
		
		/**
		 * get 玩家披风ID
		 * @return 
		 */
		public function get cloakModelid(): int{
			return _cloakModelid;
		}
		
		/**
		 * set 玩家披风ID
		 */
		public function set cloakModelid(value: int): void{
			this._cloakModelid = value;
		}
		
		/**
		 * get 宠物ID
		 * @return 
		 */
		public function get petModelid(): int{
			return _petModelid;
		}
		
		/**
		 * set 宠物ID
		 */
		public function set petModelid(value: int): void{
			this._petModelid = value;
		}
		
		/**
		 * get 美人血量，默认血量上限是100或者根据MID
		 * @return 
		 */
		public function get petHP(): int{
			return _petHP;
		}
		
		/**
		 * set 美人血量，默认血量上限是100或者根据MID
		 */
		public function set petHP(value: int): void{
			this._petHP = value;
		}
		
		/**
		 * get 美人阶级
		 * @return 
		 */
		public function get petRank(): int{
			return _petRank;
		}
		
		/**
		 * set 美人阶级
		 */
		public function set petRank(value: int): void{
			this._petRank = value;
		}
		
		/**
		 * get 美人等级
		 * @return 
		 */
		public function get petLevel(): int{
			return _petLevel;
		}
		
		/**
		 * set 美人等级
		 */
		public function set petLevel(value: int): void{
			this._petLevel = value;
		}
		
		/**
		 * get 侍宠当前攻击目标
		 * @return 
		 */
		public function get petTarget(): long{
			return _petTarget;
		}
		
		/**
		 * set 侍宠当前攻击目标
		 */
		public function set petTarget(value: long): void{
			this._petTarget = value;
		}
		
		/**
		 * get 军衔等级
		 * @return 
		 */
		public function get ranklevel(): int{
			return _ranklevel;
		}
		
		/**
		 * set 军衔等级
		 */
		public function set ranklevel(value: int): void{
			this._ranklevel = value;
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
		 * get 平台标识
		 * @return 
		 */
		public function get webname(): String{
			return _webname;
		}
		
		/**
		 * set 平台标识
		 */
		public function set webname(value: String): void{
			this._webname = value;
		}
		
		/**
		 * get 人物面对方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 人物面对方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get 跑步坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set 跑步坐标集合
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
		}
		
		/**
		 * get 队伍ID
		 * @return 
		 */
		public function get team(): long{
			return _team;
		}
		
		/**
		 * set 队伍ID
		 */
		public function set team(value: long): void{
			this._team = value;
		}
		
		/**
		 * get 帮派ID
		 * @return 
		 */
		public function get guildid(): long{
			return _guildid;
		}
		
		/**
		 * set 帮派ID
		 */
		public function set guildid(value: long): void{
			this._guildid = value;
		}
		
		/**
		 * get 帮派名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮派名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get PK模式
		 * @return 
		 */
		public function get pkstate(): int{
			return _pkstate;
		}
		
		/**
		 * set PK模式
		 */
		public function set pkstate(value: int): void{
			this._pkstate = value;
		}
		
		/**
		 * get buff集合
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff集合
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
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
		
	}
}