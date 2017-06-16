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
	 * 帮派成员信息
	 */
	public class GuildMemberInfo extends Bean {
	
		//玩家Id
		private var _id: long;
		
		//玩家姓名
		private var _name: String;
		
		//玩家职业
		private var _job: int;
		
		//玩家等级
		private var _level: int;
		
		//玩家战斗力
		private var _battle: int;
		
		//职位类型
		private var _memberType: int;
		
		//是否在线,1:在线,0:不在线
		private var _online: int;
		
		//本周活跃
		private var _curActive: int;
		
		//总活跃
		private var _allActive: int;
		
		//帮派贡献
		private var _contribution: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_id);
			//玩家姓名
			writeString(_name);
			//玩家职业
			writeByte(_job);
			//玩家等级
			writeInt(_level);
			//玩家战斗力
			writeInt(_battle);
			//职位类型
			writeInt(_memberType);
			//是否在线,1:在线,0:不在线
			writeByte(_online);
			//本周活跃
			writeInt(_curActive);
			//总活跃
			writeInt(_allActive);
			//帮派贡献
			writeInt(_contribution);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_id = readLong();
			//玩家姓名
			_name = readString();
			//玩家职业
			_job = readByte();
			//玩家等级
			_level = readInt();
			//玩家战斗力
			_battle = readInt();
			//职位类型
			_memberType = readInt();
			//是否在线,1:在线,0:不在线
			_online = readByte();
			//本周活跃
			_curActive = readInt();
			//总活跃
			_allActive = readInt();
			//帮派贡献
			_contribution = readInt();
			return true;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get id(): long{
			return _id;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set id(value: long): void{
			this._id = value;
		}
		
		/**
		 * get 玩家姓名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家姓名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 玩家职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 玩家职业
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get 玩家等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 玩家等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 玩家战斗力
		 * @return 
		 */
		public function get battle(): int{
			return _battle;
		}
		
		/**
		 * set 玩家战斗力
		 */
		public function set battle(value: int): void{
			this._battle = value;
		}
		
		/**
		 * get 职位类型
		 * @return 
		 */
		public function get memberType(): int{
			return _memberType;
		}
		
		/**
		 * set 职位类型
		 */
		public function set memberType(value: int): void{
			this._memberType = value;
		}
		
		/**
		 * get 是否在线,1:在线,0:不在线
		 * @return 
		 */
		public function get online(): int{
			return _online;
		}
		
		/**
		 * set 是否在线,1:在线,0:不在线
		 */
		public function set online(value: int): void{
			this._online = value;
		}
		
		/**
		 * get 本周活跃
		 * @return 
		 */
		public function get curActive(): int{
			return _curActive;
		}
		
		/**
		 * set 本周活跃
		 */
		public function set curActive(value: int): void{
			this._curActive = value;
		}
		
		/**
		 * get 总活跃
		 * @return 
		 */
		public function get allActive(): int{
			return _allActive;
		}
		
		/**
		 * set 总活跃
		 */
		public function set allActive(value: int): void{
			this._allActive = value;
		}
		
		/**
		 * get 帮派贡献
		 * @return 
		 */
		public function get contribution(): int{
			return _contribution;
		}
		
		/**
		 * set 帮派贡献
		 */
		public function set contribution(value: int): void{
			this._contribution = value;
		}
		
	}
}