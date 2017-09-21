package com.rpgGame.netData.team.message{
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
		private var _playerName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被踢的玩家Id
			writeString(_playerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被踢的玩家Id
			_playerName = readString();
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
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 被踢的玩家Id
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
	}
}