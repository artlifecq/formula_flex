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
	 * 把玩家从跨服踢下线
	 */
	public class ReqKickPlayerGameToFightMessage extends Message {
	
		//角色id
		private var _playerId: long;
		
		//战斗服ServerKey
		private var _fightServerKey: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色id
			writeLong(_playerId);
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
			//战斗服ServerKey
			_fightServerKey = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250255;
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
		
	}
}