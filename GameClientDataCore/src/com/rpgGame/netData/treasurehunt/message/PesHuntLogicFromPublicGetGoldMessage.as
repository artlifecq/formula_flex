package com.rpgGame.netData.treasurehunt.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 游戏服发送寻宝消息到公共服处理
	 */
	public class PesHuntLogicFromPublicGetGoldMessage extends Message {
	
		//寻宝次数
		private var _huntCount: int;
		
		//玩家ID
		private var _playerId: long;
		
		//玩家serverKey
		private var _serverKey: int;
		
		//玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
		private var _treasureRewards: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//寻宝次数
			writeInt(_huntCount);
			//玩家ID
			writeLong(_playerId);
			//玩家serverKey
			writeInt(_serverKey);
			//玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
			writeShort(_treasureRewards.length);
			for (i = 0; i < _treasureRewards.length; i++) {
				writeInt(_treasureRewards[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//寻宝次数
			_huntCount = readInt();
			//玩家ID
			_playerId = readLong();
			//玩家serverKey
			_serverKey = readInt();
			//玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
			var treasureRewards_length : int = readShort();
			for (i = 0; i < treasureRewards_length; i++) {
				_treasureRewards[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160209;
		}
		
		/**
		 * get 寻宝次数
		 * @return 
		 */
		public function get huntCount(): int{
			return _huntCount;
		}
		
		/**
		 * set 寻宝次数
		 */
		public function set huntCount(value: int): void{
			this._huntCount = value;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 玩家serverKey
		 * @return 
		 */
		public function get serverKey(): int{
			return _serverKey;
		}
		
		/**
		 * set 玩家serverKey
		 */
		public function set serverKey(value: int): void{
			this._serverKey = value;
		}
		
		/**
		 * get 玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
		 * @return 
		 */
		public function get treasureRewards(): Vector.<int>{
			return _treasureRewards;
		}
		
		/**
		 * set 玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
		 */
		public function set treasureRewards(value: Vector.<int>): void{
			this._treasureRewards = value;
		}
		
	}
}