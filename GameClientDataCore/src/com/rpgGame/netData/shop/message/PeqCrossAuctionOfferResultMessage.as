package com.rpgGame.netData.shop.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 公共服发送给逻辑服跨服拍卖结果（用于解锁）
	 */
	public class PeqCrossAuctionOfferResultMessage extends Message {
	
		//拍卖编号
		private var _auctionId: long;
		
		//玩家ID
		private var _playerId: long;
		
		//结果（0失败1成功）
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//拍卖编号
			writeLong(_auctionId);
			//玩家ID
			writeLong(_playerId);
			//结果（0失败1成功）
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//拍卖编号
			_auctionId = readLong();
			//玩家ID
			_playerId = readLong();
			//结果（0失败1成功）
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149211;
		}
		
		/**
		 * get 拍卖编号
		 * @return 
		 */
		public function get auctionId(): long{
			return _auctionId;
		}
		
		/**
		 * set 拍卖编号
		 */
		public function set auctionId(value: long): void{
			this._auctionId = value;
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
		 * get 结果（0失败1成功）
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果（0失败1成功）
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}