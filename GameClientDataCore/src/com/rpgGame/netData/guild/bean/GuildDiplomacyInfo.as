package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会外交信息
	 */
	public class GuildDiplomacyInfo extends Bean {
	
		//与本帮关系 1 同盟 2 敌对
		private var _relation: int;
		
		//帮会id
		private var _guildId: long;
		
		//帮会名
		private var _guildName: String;
		
		//帮旗等级
		private var _guildFlagLevel: int;
		
		//帮旗名称
		private var _guildFlagName: String;
		
		//帮主id
		private var _bangZhuid: long;
		
		//帮主名字
		private var _bangZhuName: String;
		
		//帮主是否在线
		private var _bangZhuOnline: int;
		
		//帮主等级
		private var _bangZhuLevel: int;
		
		//帮主军衔等级
		private var _bangZhurankLevel: int;
		
		//副帮主id
		private var _viceBangZhuId: long;
		
		//副帮主名字
		private var _viceBangZhuName: String;
		
		//副帮主等级
		private var _viceBangZhuLevel: int;
		
		//副帮主军衔等级
		private var _viceBangZhurankLevel: int;
		
		//副帮主是否在线
		private var _viceBangZhuOnline: int;
		
		//成员数量
		private var _memberNum: int;
		
		//成员战斗力之和
		private var _memberFightPower: int;
		
		//帮会等级
		private var _level: int;
		
		//帮会创建时间
		private var _createTime: int;
		
		//是否王城 1是 0否
		private var _isImper: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//与本帮关系 1 同盟 2 敌对
			writeByte(_relation);
			//帮会id
			writeLong(_guildId);
			//帮会名
			writeString(_guildName);
			//帮旗等级
			writeInt(_guildFlagLevel);
			//帮旗名称
			writeString(_guildFlagName);
			//帮主id
			writeLong(_bangZhuid);
			//帮主名字
			writeString(_bangZhuName);
			//帮主是否在线
			writeByte(_bangZhuOnline);
			//帮主等级
			writeInt(_bangZhuLevel);
			//帮主军衔等级
			writeInt(_bangZhurankLevel);
			//副帮主id
			writeLong(_viceBangZhuId);
			//副帮主名字
			writeString(_viceBangZhuName);
			//副帮主等级
			writeInt(_viceBangZhuLevel);
			//副帮主军衔等级
			writeInt(_viceBangZhurankLevel);
			//副帮主是否在线
			writeByte(_viceBangZhuOnline);
			//成员数量
			writeInt(_memberNum);
			//成员战斗力之和
			writeInt(_memberFightPower);
			//帮会等级
			writeInt(_level);
			//帮会创建时间
			writeInt(_createTime);
			//是否王城 1是 0否
			writeByte(_isImper);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//与本帮关系 1 同盟 2 敌对
			_relation = readByte();
			//帮会id
			_guildId = readLong();
			//帮会名
			_guildName = readString();
			//帮旗等级
			_guildFlagLevel = readInt();
			//帮旗名称
			_guildFlagName = readString();
			//帮主id
			_bangZhuid = readLong();
			//帮主名字
			_bangZhuName = readString();
			//帮主是否在线
			_bangZhuOnline = readByte();
			//帮主等级
			_bangZhuLevel = readInt();
			//帮主军衔等级
			_bangZhurankLevel = readInt();
			//副帮主id
			_viceBangZhuId = readLong();
			//副帮主名字
			_viceBangZhuName = readString();
			//副帮主等级
			_viceBangZhuLevel = readInt();
			//副帮主军衔等级
			_viceBangZhurankLevel = readInt();
			//副帮主是否在线
			_viceBangZhuOnline = readByte();
			//成员数量
			_memberNum = readInt();
			//成员战斗力之和
			_memberFightPower = readInt();
			//帮会等级
			_level = readInt();
			//帮会创建时间
			_createTime = readInt();
			//是否王城 1是 0否
			_isImper = readByte();
			return true;
		}
		
		/**
		 * get 与本帮关系 1 同盟 2 敌对
		 * @return 
		 */
		public function get relation(): int{
			return _relation;
		}
		
		/**
		 * set 与本帮关系 1 同盟 2 敌对
		 */
		public function set relation(value: int): void{
			this._relation = value;
		}
		
		/**
		 * get 帮会id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮会id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 帮会名
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 帮旗等级
		 * @return 
		 */
		public function get guildFlagLevel(): int{
			return _guildFlagLevel;
		}
		
		/**
		 * set 帮旗等级
		 */
		public function set guildFlagLevel(value: int): void{
			this._guildFlagLevel = value;
		}
		
		/**
		 * get 帮旗名称
		 * @return 
		 */
		public function get guildFlagName(): String{
			return _guildFlagName;
		}
		
		/**
		 * set 帮旗名称
		 */
		public function set guildFlagName(value: String): void{
			this._guildFlagName = value;
		}
		
		/**
		 * get 帮主id
		 * @return 
		 */
		public function get bangZhuid(): long{
			return _bangZhuid;
		}
		
		/**
		 * set 帮主id
		 */
		public function set bangZhuid(value: long): void{
			this._bangZhuid = value;
		}
		
		/**
		 * get 帮主名字
		 * @return 
		 */
		public function get bangZhuName(): String{
			return _bangZhuName;
		}
		
		/**
		 * set 帮主名字
		 */
		public function set bangZhuName(value: String): void{
			this._bangZhuName = value;
		}
		
		/**
		 * get 帮主是否在线
		 * @return 
		 */
		public function get bangZhuOnline(): int{
			return _bangZhuOnline;
		}
		
		/**
		 * set 帮主是否在线
		 */
		public function set bangZhuOnline(value: int): void{
			this._bangZhuOnline = value;
		}
		
		/**
		 * get 帮主等级
		 * @return 
		 */
		public function get bangZhuLevel(): int{
			return _bangZhuLevel;
		}
		
		/**
		 * set 帮主等级
		 */
		public function set bangZhuLevel(value: int): void{
			this._bangZhuLevel = value;
		}
		
		/**
		 * get 帮主军衔等级
		 * @return 
		 */
		public function get bangZhurankLevel(): int{
			return _bangZhurankLevel;
		}
		
		/**
		 * set 帮主军衔等级
		 */
		public function set bangZhurankLevel(value: int): void{
			this._bangZhurankLevel = value;
		}
		
		/**
		 * get 副帮主id
		 * @return 
		 */
		public function get viceBangZhuId(): long{
			return _viceBangZhuId;
		}
		
		/**
		 * set 副帮主id
		 */
		public function set viceBangZhuId(value: long): void{
			this._viceBangZhuId = value;
		}
		
		/**
		 * get 副帮主名字
		 * @return 
		 */
		public function get viceBangZhuName(): String{
			return _viceBangZhuName;
		}
		
		/**
		 * set 副帮主名字
		 */
		public function set viceBangZhuName(value: String): void{
			this._viceBangZhuName = value;
		}
		
		/**
		 * get 副帮主等级
		 * @return 
		 */
		public function get viceBangZhuLevel(): int{
			return _viceBangZhuLevel;
		}
		
		/**
		 * set 副帮主等级
		 */
		public function set viceBangZhuLevel(value: int): void{
			this._viceBangZhuLevel = value;
		}
		
		/**
		 * get 副帮主军衔等级
		 * @return 
		 */
		public function get viceBangZhurankLevel(): int{
			return _viceBangZhurankLevel;
		}
		
		/**
		 * set 副帮主军衔等级
		 */
		public function set viceBangZhurankLevel(value: int): void{
			this._viceBangZhurankLevel = value;
		}
		
		/**
		 * get 副帮主是否在线
		 * @return 
		 */
		public function get viceBangZhuOnline(): int{
			return _viceBangZhuOnline;
		}
		
		/**
		 * set 副帮主是否在线
		 */
		public function set viceBangZhuOnline(value: int): void{
			this._viceBangZhuOnline = value;
		}
		
		/**
		 * get 成员数量
		 * @return 
		 */
		public function get memberNum(): int{
			return _memberNum;
		}
		
		/**
		 * set 成员数量
		 */
		public function set memberNum(value: int): void{
			this._memberNum = value;
		}
		
		/**
		 * get 成员战斗力之和
		 * @return 
		 */
		public function get memberFightPower(): int{
			return _memberFightPower;
		}
		
		/**
		 * set 成员战斗力之和
		 */
		public function set memberFightPower(value: int): void{
			this._memberFightPower = value;
		}
		
		/**
		 * get 帮会等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 帮会等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 帮会创建时间
		 * @return 
		 */
		public function get createTime(): int{
			return _createTime;
		}
		
		/**
		 * set 帮会创建时间
		 */
		public function set createTime(value: int): void{
			this._createTime = value;
		}
		
		/**
		 * get 是否王城 1是 0否
		 * @return 
		 */
		public function get isImper(): int{
			return _isImper;
		}
		
		/**
		 * set 是否王城 1是 0否
		 */
		public function set isImper(value: int): void{
			this._isImper = value;
		}
		
	}
}