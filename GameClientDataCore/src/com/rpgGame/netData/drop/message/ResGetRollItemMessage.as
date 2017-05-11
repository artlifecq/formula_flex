package com.rpgGame.netData.drop.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品飞入背包消息
	 */
	public class ResGetRollItemMessage extends Message {
	
		//唯一ID
		private var _uniqueId: long;
		
		//玩家id
		private var _playerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeLong(_uniqueId);
			//玩家id
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_uniqueId = readLong();
			//玩家id
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 210103;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get uniqueId(): long{
			return _uniqueId;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uniqueId(value: long): void{
			this._uniqueId = value;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
	}
}