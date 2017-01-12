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
	 * 怪物信息类
	 */
	public class MonsterInfo extends Bean {
	
		//怪物Id
		private var _monsterId: long;
		
		//怪物模板Id
		private var _modelId: int;
		
		//怪物名字
		private var _monsterName: String;
		
		//怪物资源造型
		private var _monsterRes: int;
		
		//怪物头像造型
		private var _monsterIcon: int;
		
		//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
		private var _friend: int;
		
		//怪物等级
		private var _level: int;
		
		//怪物所在地图
		private var _mapModelId: int;
		
		//怪物所在坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		//怪物HP
		private var _hp: int;
		
		//怪物最大HP
		private var _maxHp: int;
		
		//怪物速度
		private var _speed: int;
		
		//怪物面对方向
		private var _dir: int;
		
		//跑步坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//buff列表
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物Id
			writeLong(_monsterId);
			//怪物模板Id
			writeInt(_modelId);
			//怪物名字
			writeString(_monsterName);
			//怪物资源造型
			writeInt(_monsterRes);
			//怪物头像造型
			writeInt(_monsterIcon);
			//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
			writeByte(_friend);
			//怪物等级
			writeShort(_level);
			//怪物所在地图
			writeInt(_mapModelId);
			//怪物所在坐标
			writeBean(_position);
			//怪物HP
			writeInt(_hp);
			//怪物最大HP
			writeInt(_maxHp);
			//怪物速度
			writeShort(_speed);
			//怪物面对方向
			writeShort(_dir);
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//buff列表
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物Id
			_monsterId = readLong();
			//怪物模板Id
			_modelId = readInt();
			//怪物名字
			_monsterName = readString();
			//怪物资源造型
			_monsterRes = readInt();
			//怪物头像造型
			_monsterIcon = readInt();
			//怪物敌对类型 0-全体玩家敌对， 1-全体玩家友好， 2-帮派敌对
			_friend = readByte();
			//怪物等级
			_level = readShort();
			//怪物所在地图
			_mapModelId = readInt();
			//怪物所在坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//怪物HP
			_hp = readInt();
			//怪物最大HP
			_maxHp = readInt();
			//怪物速度
			_speed = readShort();
			//怪物面对方向
			_dir = readShort();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//buff列表
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
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
		 * get 怪物模板Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 怪物模板Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
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
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 怪物所在地图
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get 怪物所在坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 怪物所在坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
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
		 * get buff列表
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff列表
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}