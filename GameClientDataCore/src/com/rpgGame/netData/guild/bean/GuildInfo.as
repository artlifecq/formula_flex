package com.rpgGame.netData.guild.bean{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派信息
	 */
	public class GuildInfo extends Bean {
	
		//帮派Id
		private var _id: long;
		
		//帮派名字
		private var _name: String;
		
		//帮派等级
		private var _level: int;
		
		//帮主名字
		private var _chiefName: String;
		
		//帮主战斗力
		private var _chiefBattle: int;
		
		//帮主外观信息
		private var _chiefAvatar: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		//成员数
		private var _memberNum: int;
		
		//帮派排名
		private var _rank: int;
		
		//活跃值
		private var _active: int;
		
		//帮会宣言
		private var _note: String;
		
		//帮派总战力
		private var _battle: int;
		
		//占领城池情况
		private var _city: int;
		
		//是否自动通过申请
		private var _isAutoApply: int;
		
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
			//帮主战斗力
			writeInt(_chiefBattle);
			//帮主外观信息
			writeBean(_chiefAvatar);
			//成员数
			writeInt(_memberNum);
			//帮派排名
			writeInt(_rank);
			//活跃值
			writeInt(_active);
			//帮会宣言
			writeString(_note);
			//帮派总战力
			writeInt(_battle);
			//占领城池情况
			writeInt(_city);
			//是否自动通过申请
			writeByte(_isAutoApply);
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
			//帮主战斗力
			_chiefBattle = readInt();
			//帮主外观信息
			_chiefAvatar = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			//成员数
			_memberNum = readInt();
			//帮派排名
			_rank = readInt();
			//活跃值
			_active = readInt();
			//帮会宣言
			_note = readString();
			//帮派总战力
			_battle = readInt();
			//占领城池情况
			_city = readInt();
			//是否自动通过申请
			_isAutoApply = readByte();
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
		 * get 帮主战斗力
		 * @return 
		 */
		public function get chiefBattle(): int{
			return _chiefBattle;
		}
		
		/**
		 * set 帮主战斗力
		 */
		public function set chiefBattle(value: int): void{
			this._chiefBattle = value;
		}
		
		/**
		 * get 帮主外观信息
		 * @return 
		 */
		public function get chiefAvatar(): com.rpgGame.netData.player.bean.PlayerAppearanceInfo{
			return _chiefAvatar;
		}
		
		/**
		 * set 帮主外观信息
		 */
		public function set chiefAvatar(value: com.rpgGame.netData.player.bean.PlayerAppearanceInfo): void{
			this._chiefAvatar = value;
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
		 * get 帮派排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 帮派排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 活跃值
		 * @return 
		 */
		public function get active(): int{
			return _active;
		}
		
		/**
		 * set 活跃值
		 */
		public function set active(value: int): void{
			this._active = value;
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
		 * get 帮派总战力
		 * @return 
		 */
		public function get battle(): int{
			return _battle;
		}
		
		/**
		 * set 帮派总战力
		 */
		public function set battle(value: int): void{
			this._battle = value;
		}
		
		/**
		 * get 占领城池情况
		 * @return 
		 */
		public function get city(): int{
			return _city;
		}
		
		/**
		 * set 占领城池情况
		 */
		public function set city(value: int): void{
			this._city = value;
		}
		
		/**
		 * get 是否自动通过申请
		 * @return 
		 */
		public function get isAutoApply(): int{
			return _isAutoApply;
		}
		
		/**
		 * set 是否自动通过申请
		 */
		public function set isAutoApply(value: int): void{
			this._isAutoApply = value;
		}
		
	}
}