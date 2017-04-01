package com.rpgGame.netData.royalCity.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 三级城市战斗统计信息
	 */
	public class CityFightInfo3 extends Bean {
	
		//玩家ID
		private var _playerId: long;
		
		//玩家等级
		private var _level: int;
		
		//玩家名称
		private var _name: String;
		
		//击杀数量
		private var _killNum: int;
		
		//死亡数量
		private var _deathNum: int;
		
		//是否是守方（0否1是）
		private var _isShou: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_playerId);
			//玩家等级
			writeInt(_level);
			//玩家名称
			writeString(_name);
			//击杀数量
			writeInt(_killNum);
			//死亡数量
			writeInt(_deathNum);
			//是否是守方（0否1是）
			writeByte(_isShou);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_playerId = readLong();
			//玩家等级
			_level = readInt();
			//玩家名称
			_name = readString();
			//击杀数量
			_killNum = readInt();
			//死亡数量
			_deathNum = readInt();
			//是否是守方（0否1是）
			_isShou = readByte();
			return true;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
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
		 * get 玩家名称
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名称
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 击杀数量
		 * @return 
		 */
		public function get killNum(): int{
			return _killNum;
		}
		
		/**
		 * set 击杀数量
		 */
		public function set killNum(value: int): void{
			this._killNum = value;
		}
		
		/**
		 * get 死亡数量
		 * @return 
		 */
		public function get deathNum(): int{
			return _deathNum;
		}
		
		/**
		 * set 死亡数量
		 */
		public function set deathNum(value: int): void{
			this._deathNum = value;
		}
		
		/**
		 * get 是否是守方（0否1是）
		 * @return 
		 */
		public function get isShou(): int{
			return _isShou;
		}
		
		/**
		 * set 是否是守方（0否1是）
		 */
		public function set isShou(value: int): void{
			this._isShou = value;
		}
		
	}
}