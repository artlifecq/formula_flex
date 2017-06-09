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
	 * 帮派申请信息
	 */
	public class GuildApplyInfo extends Bean {
	
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
		
	}
}