package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本队伍投票
	 */
	public class CSZoneTeamVoteMessage extends Message {
	
		//副本ID
		private var _zoneId: int;
		
		//投票信息(0不同意，1同意)
		private var _voteValue: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneId);
			//投票信息(0不同意，1同意)
			writeByte(_voteValue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneId = readInt();
			//投票信息(0不同意，1同意)
			_voteValue = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109217;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneId(): int{
			return _zoneId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneId(value: int): void{
			this._zoneId = value;
		}
		
		/**
		 * get 投票信息(0不同意，1同意)
		 * @return 
		 */
		public function get voteValue(): int{
			return _voteValue;
		}
		
		/**
		 * set 投票信息(0不同意，1同意)
		 */
		public function set voteValue(value: int): void{
			this._voteValue = value;
		}
		
	}
}