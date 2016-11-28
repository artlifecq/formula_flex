package com.rpgGame.netData.cross.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知前端登录战斗服
	 */
	public class ResChangeServerGameToClientMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//账号id
		private var _userId: long;
		
		//原服Serverkey
		private var _oldserverKey: int;
		
		//战斗服ServerKey
		private var _fightServerKey: int;
		
		//战斗游戏服务器Ip
		private var _serverIp: String;
		
		//战斗游戏服务器port
		private var _serverPort: int;
		
		//战斗游戏服务器sslport
		private var _serverSSLPort: int;
		
		//战斗类型(1.10v10 2.多人副本)
		private var _fighttype: int;
		
		//参数(map类型 与后端特殊定义)
		private var _expand: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
			//账号id
			writeLong(_userId);
			//原服Serverkey
			writeInt(_oldserverKey);
			//战斗服ServerKey
			writeInt(_fightServerKey);
			//战斗游戏服务器Ip
			writeString(_serverIp);
			//战斗游戏服务器port
			writeInt(_serverPort);
			//战斗游戏服务器sslport
			writeInt(_serverSSLPort);
			//战斗类型(1.10v10 2.多人副本)
			writeInt(_fighttype);
			//参数(map类型 与后端特殊定义)
			writeString(_expand);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色id
			_playerId = readLong();
			//账号id
			_userId = readLong();
			//原服Serverkey
			_oldserverKey = readInt();
			//战斗服ServerKey
			_fightServerKey = readInt();
			//战斗游戏服务器Ip
			_serverIp = readString();
			//战斗游戏服务器port
			_serverPort = readInt();
			//战斗游戏服务器sslport
			_serverSSLPort = readInt();
			//战斗类型(1.10v10 2.多人副本)
			_fighttype = readInt();
			//参数(map类型 与后端特殊定义)
			_expand = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250101;
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
		 * get 账号id
		 * @return 
		 */
		public function get userId(): long{
			return _userId;
		}
		
		/**
		 * set 账号id
		 */
		public function set userId(value: long): void{
			this._userId = value;
		}
		
		/**
		 * get 原服Serverkey
		 * @return 
		 */
		public function get oldserverKey(): int{
			return _oldserverKey;
		}
		
		/**
		 * set 原服Serverkey
		 */
		public function set oldserverKey(value: int): void{
			this._oldserverKey = value;
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
		 * get 战斗游戏服务器Ip
		 * @return 
		 */
		public function get serverIp(): String{
			return _serverIp;
		}
		
		/**
		 * set 战斗游戏服务器Ip
		 */
		public function set serverIp(value: String): void{
			this._serverIp = value;
		}
		
		/**
		 * get 战斗游戏服务器port
		 * @return 
		 */
		public function get serverPort(): int{
			return _serverPort;
		}
		
		/**
		 * set 战斗游戏服务器port
		 */
		public function set serverPort(value: int): void{
			this._serverPort = value;
		}
		
		/**
		 * get 战斗游戏服务器sslport
		 * @return 
		 */
		public function get serverSSLPort(): int{
			return _serverSSLPort;
		}
		
		/**
		 * set 战斗游戏服务器sslport
		 */
		public function set serverSSLPort(value: int): void{
			this._serverSSLPort = value;
		}
		
		/**
		 * get 战斗类型(1.10v10 2.多人副本)
		 * @return 
		 */
		public function get fighttype(): int{
			return _fighttype;
		}
		
		/**
		 * set 战斗类型(1.10v10 2.多人副本)
		 */
		public function set fighttype(value: int): void{
			this._fighttype = value;
		}
		
		/**
		 * get 参数(map类型 与后端特殊定义)
		 * @return 
		 */
		public function get expand(): String{
			return _expand;
		}
		
		/**
		 * set 参数(map类型 与后端特殊定义)
		 */
		public function set expand(value: String): void{
			this._expand = value;
		}
		
	}
}