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
	 * 前端开始登录战斗服
	 */
	public class ReqLoginFightServerClientToFightMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//账号id
		private var _userId: long;
		
		//原服Serverkey
		private var _oldserverKey: int;
		
		//战斗服ServerKey
		private var _fightServerKey: int;
		
		
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
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250201;
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
		
	}
}