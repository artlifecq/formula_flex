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
	 * 任命新队长
	 */
	public class ReqAppointGameMessage extends Message {
	
		//队伍Id
		private var _teamid: long;
		
		//玩家名称
		private var _playerName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队伍Id
			writeLong(_teamid);
			//玩家名称
			writeString(_playerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队伍Id
			_teamid = readLong();
			//玩家名称
			_playerName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109209;
		}
		
		/**
		 * get 队伍Id
		 * @return 
		 */
		public function get teamid(): long{
			return _teamid;
		}
		
		/**
		 * set 队伍Id
		 */
		public function set teamid(value: long): void{
			this._teamid = value;
		}
		
		/**
		 * get 玩家名称
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名称
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
	}
}