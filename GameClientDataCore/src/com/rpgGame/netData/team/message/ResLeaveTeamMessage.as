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
	 * 玩家离队
	 */
	public class ResLeaveTeamMessage extends Message {
	
		//离队玩家Id
		private var _leaveplayerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//离队玩家Id
			writeLong(_leaveplayerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//离队玩家Id
			_leaveplayerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109103;
		}
		
		/**
		 * get 离队玩家Id
		 * @return 
		 */
		public function get leaveplayerId(): long{
			return _leaveplayerId;
		}
		
		/**
		 * set 离队玩家Id
		 */
		public function set leaveplayerId(value: long): void{
			this._leaveplayerId = value;
		}
		
	}
}