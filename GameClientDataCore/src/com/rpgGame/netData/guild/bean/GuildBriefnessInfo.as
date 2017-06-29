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
	 * 帮派简介信息
	 */
	public class GuildBriefnessInfo extends Bean {
	
		//帮派Id
		private var _id: long;
		
		//帮派名字
		private var _name: String;
		
		//帮派等级
		private var _level: int;
		
		//帮主名字
		private var _chiefName: String;
		
		//帮主是否是vip,1:是0:不是
		private var _chiefVip: int;
		
		//成员数
		private var _memberNum: int;
		
		//帮会宣言
		private var _note: String;
		
		//是否自动加入
		private var _isAutoJoin: int;
		
		//是否已经申请
		private var _isApply: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派Id
			writeLong(_id);
			//帮派名字
			writeString(_name);
			//帮派等级
			writeInt(_level);
			//帮主名字
			writeString(_chiefName);
			//帮主是否是vip,1:是0:不是
			writeByte(_chiefVip);
			//成员数
			writeInt(_memberNum);
			//帮会宣言
			writeString(_note);
			//是否自动加入
			writeByte(_isAutoJoin);
			//是否已经申请
			writeByte(_isApply);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮派Id
			_id = readLong();
			//帮派名字
			_name = readString();
			//帮派等级
			_level = readInt();
			//帮主名字
			_chiefName = readString();
			//帮主是否是vip,1:是0:不是
			_chiefVip = readByte();
			//成员数
			_memberNum = readInt();
			//帮会宣言
			_note = readString();
			//是否自动加入
			_isAutoJoin = readByte();
			//是否已经申请
			_isApply = readByte();
			return true;
		}
		
		/**
		 * get 帮派Id
		 * @return 
		 */
		public function get id(): long{
			return _id;
		}
		
		/**
		 * set 帮派Id
		 */
		public function set id(value: long): void{
			this._id = value;
		}
		
		/**
		 * get 帮派名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 帮派名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 帮派等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 帮派等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 帮主名字
		 * @return 
		 */
		public function get chiefName(): String{
			return _chiefName;
		}
		
		/**
		 * set 帮主名字
		 */
		public function set chiefName(value: String): void{
			this._chiefName = value;
		}
		
		/**
		 * get 帮主是否是vip,1:是0:不是
		 * @return 
		 */
		public function get chiefVip(): int{
			return _chiefVip;
		}
		
		/**
		 * set 帮主是否是vip,1:是0:不是
		 */
		public function set chiefVip(value: int): void{
			this._chiefVip = value;
		}
		
		/**
		 * get 成员数
		 * @return 
		 */
		public function get memberNum(): int{
			return _memberNum;
		}
		
		/**
		 * set 成员数
		 */
		public function set memberNum(value: int): void{
			this._memberNum = value;
		}
		
		/**
		 * get 帮会宣言
		 * @return 
		 */
		public function get note(): String{
			return _note;
		}
		
		/**
		 * set 帮会宣言
		 */
		public function set note(value: String): void{
			this._note = value;
		}
		
		/**
		 * get 是否自动加入
		 * @return 
		 */
		public function get isAutoJoin(): int{
			return _isAutoJoin;
		}
		
		/**
		 * set 是否自动加入
		 */
		public function set isAutoJoin(value: int): void{
			this._isAutoJoin = value;
		}
		
		/**
		 * get 是否已经申请
		 * @return 
		 */
		public function get isApply(): int{
			return _isApply;
		}
		
		/**
		 * set 是否已经申请
		 */
		public function set isApply(value: int): void{
			this._isApply = value;
		}
		
	}
}