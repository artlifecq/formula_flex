package com.rpgGame.netData.stall.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 点击某个摊位，进行看摊
	 */
	public class ReqStallInfoMessage extends Message {
	
		//摆摊的玩家ID
		private var _playerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//摆摊的玩家ID
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//摆摊的玩家ID
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142202;
		}
		
		/**
		 * get 摆摊的玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 摆摊的玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
	}
}