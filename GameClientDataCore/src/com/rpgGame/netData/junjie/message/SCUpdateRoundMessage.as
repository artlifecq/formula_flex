package com.rpgGame.netData.junjie.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知周围玩家军阶更新
	 */
	public class SCUpdateRoundMessage extends Message {
	
		//玩家id
		private var _playerId: long;
		
		//对应的军阶模型id
		private var _modelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerId);
			//对应的军阶模型id
			writeInt(_modelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readLong();
			//对应的军阶模型id
			_modelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 126105;
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
		
		/**
		 * get 对应的军阶模型id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 对应的军阶模型id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
	}
}