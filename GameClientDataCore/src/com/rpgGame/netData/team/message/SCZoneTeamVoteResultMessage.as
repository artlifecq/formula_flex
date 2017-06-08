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
	 * 返回队伍投票信息
	 */
	public class SCZoneTeamVoteResultMessage extends Message {
	
		//投票玩家Id
		private var _playerId: long;
		
		//副本ID
		private var _zoneModelid: int;
		
		//投票结果(0不同意，1同意)
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//投票玩家Id
			writeLong(_playerId);
			//副本ID
			writeInt(_zoneModelid);
			//投票结果(0不同意，1同意)
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//投票玩家Id
			_playerId = readLong();
			//副本ID
			_zoneModelid = readInt();
			//投票结果(0不同意，1同意)
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109117;
		}
		
		/**
		 * get 投票玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 投票玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 投票结果(0不同意，1同意)
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 投票结果(0不同意，1同意)
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}