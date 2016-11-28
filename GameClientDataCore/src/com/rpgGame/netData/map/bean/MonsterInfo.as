package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.map.bean.BossAIInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物信息类
	 */
	public class MonsterInfo extends Bean {
	
		//怪物Id
		private var _monsterId: long;
		
		//攻击目标Id
		private var _targetId: long;
		
		//怪物模板Id
		private var _monsterModelId: int;
		
		//怪物名字
		private var _monsterName: String;
		
		//怪物资源造型
		private var _monsterRes: int;
		
		//怪物头像造型
		private var _monsterIcon: int;
		
		//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
		private var _friend: int;
		
		//怪物敌对参数
		private var _friendPara: String;
		
		//怪物等级
		private var _level: int;
		
		//怪物所在地图
		private var _mapId: int;
		
		//怪物所在X
		private var _x: int;
		
		//怪物所在Y
		private var _y: int;
		
		//怪物HP
		private var _hp: int;
		
		//怪物最大HP
		private var _maxHp: int;
		
		//怪物速度
		private var _speed: int;
		
		//怪物面对方向
		private var _dir: int;
		
		//跑步坐标集合
		private var _positions: Vector.<int> = new Vector.<int>();
		//血量倍率
		private var _hprate: int;
		
		//buff集合
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		//AI数据
		private var _bossaiinfo: BossAIInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物Id
			writeLong(_monsterId);
			//攻击目标Id
			writeLong(_targetId);
			//怪物模板Id
			writeInt(_monsterModelId);
			//怪物名字
			writeString(_monsterName);
			//怪物资源造型
			writeInt(_monsterRes);
			//怪物头像造型
			writeInt(_monsterIcon);
			//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
			writeByte(_friend);
			//怪物敌对参数
			writeString(_friendPara);
			//怪物等级
			writeShort(_level);
			//怪物所在地图
			writeInt(_mapId);
			//怪物所在X
			writeShort(_x);
			//怪物所在Y
			writeShort(_y);
			//怪物HP
			writeInt(_hp);
			//怪物最大HP
			writeInt(_maxHp);
			//怪物速度
			writeShort(_speed);
			//怪物面对方向
			writeByte(_dir);
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeByte(_positions[i]);
			}
			//血量倍率
			writeByte(_hprate);
			//buff集合
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			//AI数据
			writeBean(_bossaiinfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物Id
			_monsterId = readLong();
			//攻击目标Id
			_targetId = readLong();
			//怪物模板Id
			_monsterModelId = readInt();
			//怪物名字
			_monsterName = readString();
			//怪物资源造型
			_monsterRes = readInt();
			//怪物头像造型
			_monsterIcon = readInt();
			//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
			_friend = readByte();
			//怪物敌对参数
			_friendPara = readString();
			//怪物等级
			_level = readShort();
			//怪物所在地图
			_mapId = readInt();
			//怪物所在X
			_x = readShort();
			//怪物所在Y
			_y = readShort();
			//怪物HP
			_hp = readInt();
			//怪物最大HP
			_maxHp = readInt();
			//怪物速度
			_speed = readShort();
			//怪物面对方向
			_dir = readByte();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readByte();
			}
			//血量倍率
			_hprate = readByte();
			//buff集合
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			//AI数据
			_bossaiinfo = readBean(BossAIInfo) as BossAIInfo;
			return true;
		}
		
		/**
		 * get 怪物Id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物Id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 攻击目标Id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 攻击目标Id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get 怪物模板Id
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set 怪物模板Id
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get 怪物名字
		 * @return 
		 */
		public function get monsterName(): String{
			return _monsterName;
		}
		
		/**
		 * set 怪物名字
		 */
		public function set monsterName(value: String): void{
			this._monsterName = value;
		}
		
		/**
		 * get 怪物资源造型
		 * @return 
		 */
		public function get monsterRes(): int{
			return _monsterRes;
		}
		
		/**
		 * set 怪物资源造型
		 */
		public function set monsterRes(value: int): void{
			this._monsterRes = value;
		}
		
		/**
		 * get 怪物头像造型
		 * @return 
		 */
		public function get monsterIcon(): int{
			return _monsterIcon;
		}
		
		/**
		 * set 怪物头像造型
		 */
		public function set monsterIcon(value: int): void{
			this._monsterIcon = value;
		}
		
		/**
		 * get 怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
		 * @return 
		 */
		public function get friend(): int{
			return _friend;
		}
		
		/**
		 * set 怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
		 */
		public function set friend(value: int): void{
			this._friend = value;
		}
		
		/**
		 * get 怪物敌对参数
		 * @return 
		 */
		public function get friendPara(): String{
			return _friendPara;
		}
		
		/**
		 * set 怪物敌对参数
		 */
		public function set friendPara(value: String): void{
			this._friendPara = value;
		}
		
		/**
		 * get 怪物等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 怪物等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 怪物所在地图
		 * @return 
		 */
		public function get mapId(): int{
			return _mapId;
		}
		
		/**
		 * set 怪物所在地图
		 */
		public function set mapId(value: int): void{
			this._mapId = value;
		}
		
		/**
		 * get 怪物所在X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 怪物所在X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 怪物所在Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 怪物所在Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 怪物HP
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set 怪物HP
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
		/**
		 * get 怪物最大HP
		 * @return 
		 */
		public function get maxHp(): int{
			return _maxHp;
		}
		
		/**
		 * set 怪物最大HP
		 */
		public function set maxHp(value: int): void{
			this._maxHp = value;
		}
		
		/**
		 * get 怪物速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 怪物速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get 怪物面对方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 怪物面对方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get 跑步坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<int>{
			return _positions;
		}
		
		/**
		 * set 跑步坐标集合
		 */
		public function set positions(value: Vector.<int>): void{
			this._positions = value;
		}
		
		/**
		 * get 血量倍率
		 * @return 
		 */
		public function get hprate(): int{
			return _hprate;
		}
		
		/**
		 * set 血量倍率
		 */
		public function set hprate(value: int): void{
			this._hprate = value;
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
		 * get AI数据
		 * @return 
		 */
		public function get bossaiinfo(): BossAIInfo{
			return _bossaiinfo;
		}
		
		/**
		 * set AI数据
		 */
		public function set bossaiinfo(value: BossAIInfo): void{
			this._bossaiinfo = value;
		}
		
	}
}