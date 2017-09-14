package com.rpgGame.netData.zhengba.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 机器人简介
	 */
	public class JJPlayerInfo extends Bean {
	
		//敌方id
		private var _enemyPlayerId: long;
		
		//敌方名字
		private var _enemyName: String;
		
		//敌方血量
		private var _enemyHp: int;
		
		//敌方战斗力
		private var _enemyFightPower: int;
		
		//敌方职业
		private var _enemyJob: int;
		
		//敌方性别
		private var _enemySex: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//敌方id
			writeLong(_enemyPlayerId);
			//敌方名字
			writeString(_enemyName);
			//敌方血量
			writeInt(_enemyHp);
			//敌方战斗力
			writeInt(_enemyFightPower);
			//敌方职业
			writeInt(_enemyJob);
			//敌方性别
			writeInt(_enemySex);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//敌方id
			_enemyPlayerId = readLong();
			//敌方名字
			_enemyName = readString();
			//敌方血量
			_enemyHp = readInt();
			//敌方战斗力
			_enemyFightPower = readInt();
			//敌方职业
			_enemyJob = readInt();
			//敌方性别
			_enemySex = readInt();
			return true;
		}
		
		/**
		 * get 敌方id
		 * @return 
		 */
		public function get enemyPlayerId(): long{
			return _enemyPlayerId;
		}
		
		/**
		 * set 敌方id
		 */
		public function set enemyPlayerId(value: long): void{
			this._enemyPlayerId = value;
		}
		
		/**
		 * get 敌方名字
		 * @return 
		 */
		public function get enemyName(): String{
			return _enemyName;
		}
		
		/**
		 * set 敌方名字
		 */
		public function set enemyName(value: String): void{
			this._enemyName = value;
		}
		
		/**
		 * get 敌方血量
		 * @return 
		 */
		public function get enemyHp(): int{
			return _enemyHp;
		}
		
		/**
		 * set 敌方血量
		 */
		public function set enemyHp(value: int): void{
			this._enemyHp = value;
		}
		
		/**
		 * get 敌方战斗力
		 * @return 
		 */
		public function get enemyFightPower(): int{
			return _enemyFightPower;
		}
		
		/**
		 * set 敌方战斗力
		 */
		public function set enemyFightPower(value: int): void{
			this._enemyFightPower = value;
		}
		
		/**
		 * get 敌方职业
		 * @return 
		 */
		public function get enemyJob(): int{
			return _enemyJob;
		}
		
		/**
		 * set 敌方职业
		 */
		public function set enemyJob(value: int): void{
			this._enemyJob = value;
		}
		
		/**
		 * get 敌方性别
		 * @return 
		 */
		public function get enemySex(): int{
			return _enemySex;
		}
		
		/**
		 * set 敌方性别
		 */
		public function set enemySex(value: int): void{
			this._enemySex = value;
		}
		
	}
}