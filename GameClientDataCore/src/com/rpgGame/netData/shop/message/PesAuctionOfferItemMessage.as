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
	 * 逻辑服发送给公共服请求出价（肯定是玩家出价）
	 */
	public class PesAuctionOfferItemMessage extends Message {
	
		//拍卖编号
		private var _auctionId: long;
		
		//订单json数据
		private var _orderJson: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//拍卖编号
			writeLong(_auctionId);
			//订单json数据
			writeString(_orderJson);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//拍卖编号
			_auctionId = readLong();
			//订单json数据
			_orderJson = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149107;
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
		 * get 订单json数据
		 * @return 
		 */
		public function get orderJson(): String{
			return _orderJson;
		}
		
		/**
		 * set 订单json数据
		 */
		public function set orderJson(value: String): void{
			this._orderJson = value;
		}
		
	}
}