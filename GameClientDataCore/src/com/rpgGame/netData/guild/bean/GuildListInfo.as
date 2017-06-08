package com.rpgGame.netData.guild.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派列表信息
	 */
	public class GuildListInfo extends Bean {
	
		//帮派排名
		private var _rank: int;
		
		//帮派名称
		private var _guildName: String;
		
		//帮派等级
		private var _guildLevel: int;
		
		//帮主名字
		private var _chiefName: String;
		
		//帮会人数
		private var _guildMemberNum: int;
		
		//总战力
		private var _allBattle: int;
		
		//是否自动加入
		private var _isAutoJoin: int;
		
		//是否已经申请
		private var _isApply: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派排名
			writeInt(_rank);
			//帮派名称
			writeString(_guildName);
			//帮派等级
			writeInt(_guildLevel);
			//帮主名字
			writeString(_chiefName);
			//帮会人数
			writeInt(_guildMemberNum);
			//总战力
			writeInt(_allBattle);
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
			//帮派排名
			_rank = readInt();
			//帮派名称
			_guildName = readString();
			//帮派等级
			_guildLevel = readInt();
			//帮主名字
			_chiefName = readString();
			//帮会人数
			_guildMemberNum = readInt();
			//总战力
			_allBattle = readInt();
			//是否自动加入
			_isAutoJoin = readByte();
			//是否已经申请
			_isApply = readByte();
			return true;
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
		 * get 帮派等级
		 * @return 
		 */
		public function get guildLevel(): int{
			return _guildLevel;
		}
		
		/**
		 * set 帮派等级
		 */
		public function set guildLevel(value: int): void{
			this._guildLevel = value;
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
		 * get 帮会人数
		 * @return 
		 */
		public function get guildMemberNum(): int{
			return _guildMemberNum;
		}
		
		/**
		 * set 帮会人数
		 */
		public function set guildMemberNum(value: int): void{
			this._guildMemberNum = value;
		}
		
		/**
		 * get 总战力
		 * @return 
		 */
		public function get allBattle(): int{
			return _allBattle;
		}
		
		/**
		 * set 总战力
		 */
		public function set allBattle(value: int): void{
			this._allBattle = value;
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