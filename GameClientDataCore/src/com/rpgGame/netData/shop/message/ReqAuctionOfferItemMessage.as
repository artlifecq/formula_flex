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
	 * 前端请求拍卖出价
	 */
	public class ReqAuctionOfferItemMessage extends Message {
	
		//拍卖编号
		private var _auctionId: long;
		
		//类型（1原服2跨服）
		private var _type: int;
		
		//拍卖模型（验证消息一致性）
		private var _auctionModelId: int;
		
		//出的价格
		private var _price: int;
		
		//是否匿名
		private var _anonymous: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//拍卖编号
			writeLong(_auctionId);
			//类型（1原服2跨服）
			writeByte(_type);
			//拍卖模型（验证消息一致性）
			writeInt(_auctionModelId);
			//出的价格
			writeInt(_price);
			//是否匿名
			writeByte(_anonymous);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//拍卖编号
			_auctionId = readLong();
			//类型（1原服2跨服）
			_type = readByte();
			//拍卖模型（验证消息一致性）
			_auctionModelId = readInt();
			//出的价格
			_price = readInt();
			//是否匿名
			_anonymous = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149209;
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
		 * get 类型（1原服2跨服）
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型（1原服2跨服）
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 拍卖模型（验证消息一致性）
		 * @return 
		 */
		public function get auctionModelId(): int{
			return _auctionModelId;
		}
		
		/**
		 * set 拍卖模型（验证消息一致性）
		 */
		public function set auctionModelId(value: int): void{
			this._auctionModelId = value;
		}
		
		/**
		 * get 出的价格
		 * @return 
		 */
		public function get price(): int{
			return _price;
		}
		
		/**
		 * set 出的价格
		 */
		public function set price(value: int): void{
			this._price = value;
		}
		
		/**
		 * get 是否匿名
		 * @return 
		 */
		public function get anonymous(): int{
			return _anonymous;
		}
		
		/**
		 * set 是否匿名
		 */
		public function set anonymous(value: int): void{
			this._anonymous = value;
		}
		
	}
}