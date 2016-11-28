package com.rpgGame.netData.team.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 踢出队伍
	 */
	public class ReqKickTeamMessage extends Message {
	
		//被踢的玩家Id
		private var _playerid: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被踢的玩家Id
			writeLong(_playerid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被踢的玩家Id
			_playerid = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109207;
		}
		
		/**
		 * get 被踢的玩家Id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 被踢的玩家Id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
	}
}