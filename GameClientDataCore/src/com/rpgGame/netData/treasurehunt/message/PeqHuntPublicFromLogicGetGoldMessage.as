package com.rpgGame.netData.treasurehunt.message{
	import com.rpgGame.netData.treasurehunt.bean.TreasureHuntRewardInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 公共服处理完寻宝回到游戏服
	 */
	public class PeqHuntPublicFromLogicGetGoldMessage extends Message {
	
		//玩家ID
		private var _playerId: long;
		
		//玩家serverKey
		private var _serverKey: int;
		
		//公共服奖励集合(此时还没有对道具组包做权重)
		private var _info: Vector.<TreasureHuntRewardInfo> = new Vector.<TreasureHuntRewardInfo>();
		//玩家请求时的奖励列表(公共服返回时候玩家掉线的处理)
		private var _treasureRewards: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家ID
			writeLong(_playerId);
			//玩家serverKey
			writeInt(_serverKey);
			//公共服奖励集合(此时还没有对道具组包做权重)
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeBean(_info[i]);
			}
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
			//玩家ID
			_playerId = readLong();
			//玩家serverKey
			_serverKey = readInt();
			//公共服奖励集合(此时还没有对道具组包做权重)
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readBean(TreasureHuntRewardInfo) as TreasureHuntRewardInfo;
			}
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
			return 160210;
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
		 * get 公共服奖励集合(此时还没有对道具组包做权重)
		 * @return 
		 */
		public function get info(): Vector.<TreasureHuntRewardInfo>{
			return _info;
		}
		
		/**
		 * set 公共服奖励集合(此时还没有对道具组包做权重)
		 */
		public function set info(value: Vector.<TreasureHuntRewardInfo>): void{
			this._info = value;
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