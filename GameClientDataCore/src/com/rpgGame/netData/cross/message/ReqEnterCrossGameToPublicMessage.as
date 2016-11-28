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
	 * 原服通知public验证跨服战斗服务器(test)
	 */
	public class ReqEnterCrossGameToPublicMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//原服Serverkey
		private var _oldserverkey: int;
		
		//跨服类型
		private var _type: int;
		
		//版本号
		private var _version: int;
		
		//扩展数据
		private var _expand: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
			//原服Serverkey
			writeInt(_oldserverkey);
			//跨服类型
			writeInt(_type);
			//版本号
			writeInt(_version);
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
			//原服Serverkey
			_oldserverkey = readInt();
			//跨服类型
			_type = readInt();
			//版本号
			_version = readInt();
			//扩展数据
			_expand = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250256;
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
		 * get 跨服类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 跨服类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 版本号
		 * @return 
		 */
		public function get version(): int{
			return _version;
		}
		
		/**
		 * set 版本号
		 */
		public function set version(value: int): void{
			this._version = value;
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