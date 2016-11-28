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
	 * 帮会申请同盟邀请数据信息
	 */
	public class GuildDipApplyInfo extends Bean {
	
		//来源帮会名称
		private var _guildName: String;
		
		//来源帮会Id
		private var _guildId: long;
		
		//来源帮会成员数
		private var _memberSize: int;
		
		//来源帮会成员上限
		private var _memberMaxSize: int;
		
		//来源帮会成员战斗力之和
		private var _memberFightPower: int;
		
		//来源帮旗等级
		private var _guildFlagLevel: int;
		
		//来源帮旗造型ID
		private var _guildFlagModel: int;
		
		//来源帮主等级
		private var _bangZhuLevel: int;
		
		//来源帮主名称
		private var _bangZhuName: String;
		
		//来源帮主ID
		private var _bangZhuId: long;
		
		//来源帮会等级
		private var _guildLevel: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//来源帮会名称
			writeString(_guildName);
			//来源帮会Id
			writeLong(_guildId);
			//来源帮会成员数
			writeInt(_memberSize);
			//来源帮会成员上限
			writeInt(_memberMaxSize);
			//来源帮会成员战斗力之和
			writeInt(_memberFightPower);
			//来源帮旗等级
			writeInt(_guildFlagLevel);
			//来源帮旗造型ID
			writeInt(_guildFlagModel);
			//来源帮主等级
			writeInt(_bangZhuLevel);
			//来源帮主名称
			writeString(_bangZhuName);
			//来源帮主ID
			writeLong(_bangZhuId);
			//来源帮会等级
			writeInt(_guildLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//来源帮会名称
			_guildName = readString();
			//来源帮会Id
			_guildId = readLong();
			//来源帮会成员数
			_memberSize = readInt();
			//来源帮会成员上限
			_memberMaxSize = readInt();
			//来源帮会成员战斗力之和
			_memberFightPower = readInt();
			//来源帮旗等级
			_guildFlagLevel = readInt();
			//来源帮旗造型ID
			_guildFlagModel = readInt();
			//来源帮主等级
			_bangZhuLevel = readInt();
			//来源帮主名称
			_bangZhuName = readString();
			//来源帮主ID
			_bangZhuId = readLong();
			//来源帮会等级
			_guildLevel = readInt();
			return true;
		}
		
		/**
		 * get 来源帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 来源帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 来源帮会Id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 来源帮会Id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 来源帮会成员数
		 * @return 
		 */
		public function get memberSize(): int{
			return _memberSize;
		}
		
		/**
		 * set 来源帮会成员数
		 */
		public function set memberSize(value: int): void{
			this._memberSize = value;
		}
		
		/**
		 * get 来源帮会成员上限
		 * @return 
		 */
		public function get memberMaxSize(): int{
			return _memberMaxSize;
		}
		
		/**
		 * set 来源帮会成员上限
		 */
		public function set memberMaxSize(value: int): void{
			this._memberMaxSize = value;
		}
		
		/**
		 * get 来源帮会成员战斗力之和
		 * @return 
		 */
		public function get memberFightPower(): int{
			return _memberFightPower;
		}
		
		/**
		 * set 来源帮会成员战斗力之和
		 */
		public function set memberFightPower(value: int): void{
			this._memberFightPower = value;
		}
		
		/**
		 * get 来源帮旗等级
		 * @return 
		 */
		public function get guildFlagLevel(): int{
			return _guildFlagLevel;
		}
		
		/**
		 * set 来源帮旗等级
		 */
		public function set guildFlagLevel(value: int): void{
			this._guildFlagLevel = value;
		}
		
		/**
		 * get 来源帮旗造型ID
		 * @return 
		 */
		public function get guildFlagModel(): int{
			return _guildFlagModel;
		}
		
		/**
		 * set 来源帮旗造型ID
		 */
		public function set guildFlagModel(value: int): void{
			this._guildFlagModel = value;
		}
		
		/**
		 * get 来源帮主等级
		 * @return 
		 */
		public function get bangZhuLevel(): int{
			return _bangZhuLevel;
		}
		
		/**
		 * set 来源帮主等级
		 */
		public function set bangZhuLevel(value: int): void{
			this._bangZhuLevel = value;
		}
		
		/**
		 * get 来源帮主名称
		 * @return 
		 */
		public function get bangZhuName(): String{
			return _bangZhuName;
		}
		
		/**
		 * set 来源帮主名称
		 */
		public function set bangZhuName(value: String): void{
			this._bangZhuName = value;
		}
		
		/**
		 * get 来源帮主ID
		 * @return 
		 */
		public function get bangZhuId(): long{
			return _bangZhuId;
		}
		
		/**
		 * set 来源帮主ID
		 */
		public function set bangZhuId(value: long): void{
			this._bangZhuId = value;
		}
		
		/**
		 * get 来源帮会等级
		 * @return 
		 */
		public function get guildLevel(): int{
			return _guildLevel;
		}
		
		/**
		 * set 来源帮会等级
		 */
		public function set guildLevel(value: int): void{
			this._guildLevel = value;
		}
		
	}
}