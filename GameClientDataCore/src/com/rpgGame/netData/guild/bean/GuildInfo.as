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
	 * 帮会信息
	 */
	public class GuildInfo extends Bean {
	
		//是否王城 1是 0否
		private var _isImper: int;
		
		//帮会id
		private var _guildId: long;
		
		//帮会名
		private var _guildName: String;
		
		//帮旗造型Id
		private var _guildFlagModelId: int;
		
		//帮旗等级
		private var _guildFlagLevel: int;
		
		//帮旗名称
		private var _guildFlagName: String;
		
		//帮旗经验
		private var _guildFlagExp: int;
		
		//帮主id
		private var _bangZhuid: long;
		
		//帮主名字
		private var _bangZhuName: String;
		
		//帮主等级
		private var _bangZhuLevel: int;
		
		//帮主是否在线
		private var _bangZhuOnline: int;
		
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
		
		//帮会公告
		private var _guildAnnouncement: String;
		
		//帮会公告最后更新时间
		private var _guildAnnouncementTime: int;
		
		//成员数量
		private var _memberNum: int;
		
		//成员战斗力之和
		private var _memberFightPower: int;
		
		//帮会创建时间
		private var _createTime: int;
		
		//帮会等级
		private var _level: int;
		
		//是否允许自动加入
		private var _autoJoin: int;
		
		//库存金币
		private var _guildMoney: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否王城 1是 0否
			writeByte(_isImper);
			//帮会id
			writeLong(_guildId);
			//帮会名
			writeString(_guildName);
			//帮旗造型Id
			writeInt(_guildFlagModelId);
			//帮旗等级
			writeInt(_guildFlagLevel);
			//帮旗名称
			writeString(_guildFlagName);
			//帮旗经验
			writeInt(_guildFlagExp);
			//帮主id
			writeLong(_bangZhuid);
			//帮主名字
			writeString(_bangZhuName);
			//帮主等级
			writeInt(_bangZhuLevel);
			//帮主是否在线
			writeByte(_bangZhuOnline);
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
			//帮会公告
			writeString(_guildAnnouncement);
			//帮会公告最后更新时间
			writeInt(_guildAnnouncementTime);
			//成员数量
			writeInt(_memberNum);
			//成员战斗力之和
			writeInt(_memberFightPower);
			//帮会创建时间
			writeInt(_createTime);
			//帮会等级
			writeInt(_level);
			//是否允许自动加入
			writeByte(_autoJoin);
			//库存金币
			writeLong(_guildMoney);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否王城 1是 0否
			_isImper = readByte();
			//帮会id
			_guildId = readLong();
			//帮会名
			_guildName = readString();
			//帮旗造型Id
			_guildFlagModelId = readInt();
			//帮旗等级
			_guildFlagLevel = readInt();
			//帮旗名称
			_guildFlagName = readString();
			//帮旗经验
			_guildFlagExp = readInt();
			//帮主id
			_bangZhuid = readLong();
			//帮主名字
			_bangZhuName = readString();
			//帮主等级
			_bangZhuLevel = readInt();
			//帮主是否在线
			_bangZhuOnline = readByte();
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
			//帮会公告
			_guildAnnouncement = readString();
			//帮会公告最后更新时间
			_guildAnnouncementTime = readInt();
			//成员数量
			_memberNum = readInt();
			//成员战斗力之和
			_memberFightPower = readInt();
			//帮会创建时间
			_createTime = readInt();
			//帮会等级
			_level = readInt();
			//是否允许自动加入
			_autoJoin = readByte();
			//库存金币
			_guildMoney = readLong();
			return true;
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
		 * get 帮旗造型Id
		 * @return 
		 */
		public function get guildFlagModelId(): int{
			return _guildFlagModelId;
		}
		
		/**
		 * set 帮旗造型Id
		 */
		public function set guildFlagModelId(value: int): void{
			this._guildFlagModelId = value;
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
		 * get 帮旗经验
		 * @return 
		 */
		public function get guildFlagExp(): int{
			return _guildFlagExp;
		}
		
		/**
		 * set 帮旗经验
		 */
		public function set guildFlagExp(value: int): void{
			this._guildFlagExp = value;
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
		 * get 帮会公告
		 * @return 
		 */
		public function get guildAnnouncement(): String{
			return _guildAnnouncement;
		}
		
		/**
		 * set 帮会公告
		 */
		public function set guildAnnouncement(value: String): void{
			this._guildAnnouncement = value;
		}
		
		/**
		 * get 帮会公告最后更新时间
		 * @return 
		 */
		public function get guildAnnouncementTime(): int{
			return _guildAnnouncementTime;
		}
		
		/**
		 * set 帮会公告最后更新时间
		 */
		public function set guildAnnouncementTime(value: int): void{
			this._guildAnnouncementTime = value;
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
		 * get 是否允许自动加入
		 * @return 
		 */
		public function get autoJoin(): int{
			return _autoJoin;
		}
		
		/**
		 * set 是否允许自动加入
		 */
		public function set autoJoin(value: int): void{
			this._autoJoin = value;
		}
		
		/**
		 * get 库存金币
		 * @return 
		 */
		public function get guildMoney(): long{
			return _guildMoney;
		}
		
		/**
		 * set 库存金币
		 */
		public function set guildMoney(value: long): void{
			this._guildMoney = value;
		}
		
	}
}