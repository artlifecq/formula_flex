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
	 * 战斗服信息,同步到Game
	 */
	public class ReqFightServerInfoPublicToGameMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//战斗服ServerKey
		private var _fightServerKey: int;
		
		//战斗游戏服务器Ip
		private var _serverIp: String;
		
		//战斗游戏服务器port
		private var _serverPort: int;
		
		//战斗游戏服务器sslport
		private var _serverSSLPort: int;
		
		//扩展数据
		private var _expand: String;
		
		//跨服活动类型
		private var _fightType: int;
		
		//战斗所属阵营
		private var _fightCamp: int;
		
		//战斗唯一ID或者战场唯一ID
		private var _fightUniqueID: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
			//战斗服ServerKey
			writeInt(_fightServerKey);
			//战斗游戏服务器Ip
			writeString(_serverIp);
			//战斗游戏服务器port
			writeInt(_serverPort);
			//战斗游戏服务器sslport
			writeInt(_serverSSLPort);
			//扩展数据
			writeString(_expand);
			//跨服活动类型
			writeInt(_fightType);
			//战斗所属阵营
			writeInt(_fightCamp);
			//战斗唯一ID或者战场唯一ID
			writeLong(_fightUniqueID);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色id
			_playerId = readLong();
			//战斗服ServerKey
			_fightServerKey = readInt();
			//战斗游戏服务器Ip
			_serverIp = readString();
			//战斗游戏服务器port
			_serverPort = readInt();
			//战斗游戏服务器sslport
			_serverSSLPort = readInt();
			//扩展数据
			_expand = readString();
			//跨服活动类型
			_fightType = readInt();
			//战斗所属阵营
			_fightCamp = readInt();
			//战斗唯一ID或者战场唯一ID
			_fightUniqueID = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250251;
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
		
		/**
		 * get 跨服活动类型
		 * @return 
		 */
		public function get fightType(): int{
			return _fightType;
		}
		
		/**
		 * set 跨服活动类型
		 */
		public function set fightType(value: int): void{
			this._fightType = value;
		}
		
		/**
		 * get 战斗所属阵营
		 * @return 
		 */
		public function get fightCamp(): int{
			return _fightCamp;
		}
		
		/**
		 * set 战斗所属阵营
		 */
		public function set fightCamp(value: int): void{
			this._fightCamp = value;
		}
		
		/**
		 * get 战斗唯一ID或者战场唯一ID
		 * @return 
		 */
		public function get fightUniqueID(): long{
			return _fightUniqueID;
		}
		
		/**
		 * set 战斗唯一ID或者战场唯一ID
		 */
		public function set fightUniqueID(value: long): void{
			this._fightUniqueID = value;
		}
		
	}
}