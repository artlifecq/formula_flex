package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发出邀请玩家加入队伍
	 */
	public class ReqInviteTeamMessage extends Message {
	
		//被邀请的玩家名称
		private var _playerName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被邀请的玩家名称
			writeString(_playerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被邀请的玩家名称
			_playerName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109208;
		}
		
		/**
		 * get 被邀请的玩家名称
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 被邀请的玩家名称
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
	}
}