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
	 * 逻辑服发送给公共服订单处理结果（公共服拍卖的所有订单都处理了才会删除商品）
	 */
	public class PesAuctionDealOrderResultMessage extends Message {
	
		//拍卖编号
		private var _auctionId: long;
		
		//订单编号
		private var _orderId: long;
		
		//结果（0失败1已退款2已发奖）
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//拍卖编号
			writeLong(_auctionId);
			//订单编号
			writeLong(_orderId);
			//结果（0失败1已退款2已发奖）
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//拍卖编号
			_auctionId = readLong();
			//订单编号
			_orderId = readLong();
			//结果（0失败1已退款2已发奖）
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149108;
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
		 * get 订单编号
		 * @return 
		 */
		public function get orderId(): long{
			return _orderId;
		}
		
		/**
		 * set 订单编号
		 */
		public function set orderId(value: long): void{
			this._orderId = value;
		}
		
		/**
		 * get 结果（0失败1已退款2已发奖）
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果（0失败1已退款2已发奖）
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}