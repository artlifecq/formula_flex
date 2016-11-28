package com.rpgGame.netData.friend.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 好友信息
	 */
	public class FriendRelationInfo extends Bean {
	
		//角色Id
		private var _playerId: long;
		
		//角色名
		private var _name: String;
		
		//等级
		private var _level: int;
		
		//VIP等级
		private var _vipLevel: int;
		
		//人物头像
		private var _icon: int;
		
		//性别
		private var _sex: int;
		
		//当前所在地图Id
		private var _mapId: int;
		
		//历史战绩
		private var _winFightNum: int;
		
		//签名心情
		private var _signature: String;
		
		//帮会名称
		private var _guildName: String;
		
		//添加时间
		private var _addTime: long;
		
		//最后聊天时间
		private var _lastChatTime: long;
		
		//状态0 离线 1在线
		private var _state: int;
		
		//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 )
		private var _relationType: int;
		
		//添加类型（1是被添加 0是添加）
		private var _addType: int;
		
		//X坐标
		private var _x: int;
		
		//Y坐标
		private var _y: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_playerId);
			//角色名
			writeString(_name);
			//等级
			writeInt(_level);
			//VIP等级
			writeInt(_vipLevel);
			//人物头像
			writeInt(_icon);
			//性别
			writeByte(_sex);
			//当前所在地图Id
			writeInt(_mapId);
			//历史战绩
			writeInt(_winFightNum);
			//签名心情
			writeString(_signature);
			//帮会名称
			writeString(_guildName);
			//添加时间
			writeLong(_addTime);
			//最后聊天时间
			writeLong(_lastChatTime);
			//状态0 离线 1在线
			writeByte(_state);
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 )
			writeByte(_relationType);
			//添加类型（1是被添加 0是添加）
			writeByte(_addType);
			//X坐标
			writeShort(_x);
			//Y坐标
			writeShort(_y);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_playerId = readLong();
			//角色名
			_name = readString();
			//等级
			_level = readInt();
			//VIP等级
			_vipLevel = readInt();
			//人物头像
			_icon = readInt();
			//性别
			_sex = readByte();
			//当前所在地图Id
			_mapId = readInt();
			//历史战绩
			_winFightNum = readInt();
			//签名心情
			_signature = readString();
			//帮会名称
			_guildName = readString();
			//添加时间
			_addTime = readLong();
			//最后聊天时间
			_lastChatTime = readLong();
			//状态0 离线 1在线
			_state = readByte();
			//关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 )
			_relationType = readByte();
			//添加类型（1是被添加 0是添加）
			_addType = readByte();
			//X坐标
			_x = readShort();
			//Y坐标
			_y = readShort();
			return true;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 角色名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 角色名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get VIP等级
		 * @return 
		 */
		public function get vipLevel(): int{
			return _vipLevel;
		}
		
		/**
		 * set VIP等级
		 */
		public function set vipLevel(value: int): void{
			this._vipLevel = value;
		}
		
		/**
		 * get 人物头像
		 * @return 
		 */
		public function get icon(): int{
			return _icon;
		}
		
		/**
		 * set 人物头像
		 */
		public function set icon(value: int): void{
			this._icon = value;
		}
		
		/**
		 * get 性别
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 性别
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 当前所在地图Id
		 * @return 
		 */
		public function get mapId(): int{
			return _mapId;
		}
		
		/**
		 * set 当前所在地图Id
		 */
		public function set mapId(value: int): void{
			this._mapId = value;
		}
		
		/**
		 * get 历史战绩
		 * @return 
		 */
		public function get winFightNum(): int{
			return _winFightNum;
		}
		
		/**
		 * set 历史战绩
		 */
		public function set winFightNum(value: int): void{
			this._winFightNum = value;
		}
		
		/**
		 * get 签名心情
		 * @return 
		 */
		public function get signature(): String{
			return _signature;
		}
		
		/**
		 * set 签名心情
		 */
		public function set signature(value: String): void{
			this._signature = value;
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
		 * get 添加时间
		 * @return 
		 */
		public function get addTime(): long{
			return _addTime;
		}
		
		/**
		 * set 添加时间
		 */
		public function set addTime(value: long): void{
			this._addTime = value;
		}
		
		/**
		 * get 最后聊天时间
		 * @return 
		 */
		public function get lastChatTime(): long{
			return _lastChatTime;
		}
		
		/**
		 * set 最后聊天时间
		 */
		public function set lastChatTime(value: long): void{
			this._lastChatTime = value;
		}
		
		/**
		 * get 状态0 离线 1在线
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 状态0 离线 1在线
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 )
		 * @return 
		 */
		public function get relationType(): int{
			return _relationType;
		}
		
		/**
		 * set 关系类型 (1 好友列表 2 仇人列表  3 黑名单 4陌生人 )
		 */
		public function set relationType(value: int): void{
			this._relationType = value;
		}
		
		/**
		 * get 添加类型（1是被添加 0是添加）
		 * @return 
		 */
		public function get addType(): int{
			return _addType;
		}
		
		/**
		 * set 添加类型（1是被添加 0是添加）
		 */
		public function set addType(value: int): void{
			this._addType = value;
		}
		
		/**
		 * get X坐标
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set X坐标
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get Y坐标
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set Y坐标
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}