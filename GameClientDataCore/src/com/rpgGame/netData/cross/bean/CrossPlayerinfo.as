package com.rpgGame.netData.cross.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家跨服数据信息
	 */
	public class CrossPlayerinfo extends Bean {
	
		//角色id
		private var _playerId: long;
		
		//账号
		private var _userId: long;
		
		//原服Serverkey
		private var _oldserverkey: int;
		
		//战斗服ServerKey
		private var _fightServerKey: int;
		
		//玩家数据
		private var _data: String;
		
		//帮会名字
		private var _guildname: String;
		
		//扩展数据
		private var _expand: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
			//账号
			writeLong(_userId);
			//原服Serverkey
			writeInt(_oldserverkey);
			//战斗服ServerKey
			writeInt(_fightServerKey);
			//玩家数据
			writeString(_data);
			//帮会名字
			writeString(_guildname);
			//扩展数据
			writeString(_expand);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色id
			_playerId = readLong();
			//账号
			_userId = readLong();
			//原服Serverkey
			_oldserverkey = readInt();
			//战斗服ServerKey
			_fightServerKey = readInt();
			//玩家数据
			_data = readString();
			//帮会名字
			_guildname = readString();
			//扩展数据
			_expand = readString();
			return true;
		}
		
		/**
		 * get 角色id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 角色id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 账号
		 * @return 
		 */
		public function get userId(): long{
			return _userId;
		}
		
		/**
		 * set 账号
		 */
		public function set userId(value: long): void{
			this._userId = value;
		}
		
		/**
		 * get 原服Serverkey
		 * @return 
		 */
		public function get oldserverkey(): int{
			return _oldserverkey;
		}
		
		/**
		 * set 原服Serverkey
		 */
		public function set oldserverkey(value: int): void{
			this._oldserverkey = value;
		}
		
		/**
		 * get 战斗服ServerKey
		 * @return 
		 */
		public function get fightServerKey(): int{
			return _fightServerKey;
		}
		
		/**
		 * set 战斗服ServerKey
		 */
		public function set fightServerKey(value: int): void{
			this._fightServerKey = value;
		}
		
		/**
		 * get 玩家数据
		 * @return 
		 */
		public function get data(): String{
			return _data;
		}
		
		/**
		 * set 玩家数据
		 */
		public function set data(value: String): void{
			this._data = value;
		}
		
		/**
		 * get 帮会名字
		 * @return 
		 */
		public function get guildname(): String{
			return _guildname;
		}
		
		/**
		 * set 帮会名字
		 */
		public function set guildname(value: String): void{
			this._guildname = value;
		}
		
		/**
		 * get 扩展数据
		 * @return 
		 */
		public function get expand(): String{
			return _expand;
		}
		
		/**
		 * set 扩展数据
		 */
		public function set expand(value: String): void{
			this._expand = value;
		}
		
	}
}