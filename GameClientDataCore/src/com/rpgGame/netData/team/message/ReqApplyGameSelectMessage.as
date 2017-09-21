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
	 * 申请入队-队长选择
	 */
	public class ReqApplyGameSelectMessage extends Message {
	
		//队伍Id
		private var _teamid: long;
		
		//玩家名称
		private var _playerName: String;
		
		//1同意，0拒绝
		private var _select: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队伍Id
			writeLong(_teamid);
			//玩家名称
			writeString(_playerName);
			//1同意，0拒绝
			writeByte(_select);
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
			//1同意，0拒绝
			_select = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109204;
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
		
		/**
		 * get 1同意，0拒绝
		 * @return 
		 */
		public function get select(): int{
			return _select;
		}
		
		/**
		 * set 1同意，0拒绝
		 */
		public function set select(value: int): void{
			this._select = value;
		}
		
	}
}