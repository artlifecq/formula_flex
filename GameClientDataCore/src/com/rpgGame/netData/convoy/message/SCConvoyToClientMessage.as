package com.rpgGame.netData.convoy.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送护送同步消息
	 */
	public class SCConvoyToClientMessage extends Message {
	
		//玩家id
		private var _playerId: int;
		
		//护送宝物id
		private var _convoyId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeShort(_playerId);
			//护送宝物id
			writeInt(_convoyId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readShort();
			//护送宝物id
			_convoyId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230108;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): int{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: int): void{
			this._playerId = value;
		}
		
		/**
		 * get 护送宝物id
		 * @return 
		 */
		public function get convoyId(): int{
			return _convoyId;
		}
		
		/**
		 * set 护送宝物id
		 */
		public function set convoyId(value: int): void{
			this._convoyId = value;
		}
		
	}
}