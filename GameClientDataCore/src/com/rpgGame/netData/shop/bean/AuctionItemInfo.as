package com.rpgGame.netData.shop.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 拍卖商品动态信息
	 */
	public class AuctionItemInfo extends Bean {
	
		//唯一ID
		private var _auctionId: long;
		
		//拍卖模型ID
		private var _auctionModelId: int;
		
		//拍卖类型1本服2跨服
		private var _auctionType: int;
		
		//当前价格
		private var _price: int;
		
		//出价人ID
		private var _playerId: long;
		
		//出价人名字（空为匿名）
		private var _playerName: String;
		
		//剩余时间
		private var _time: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeLong(_auctionId);
			//拍卖模型ID
			writeInt(_auctionModelId);
			//拍卖类型1本服2跨服
			writeByte(_auctionType);
			//当前价格
			writeInt(_price);
			//出价人ID
			writeLong(_playerId);
			//出价人名字（空为匿名）
			writeString(_playerName);
			//剩余时间
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_auctionId = readLong();
			//拍卖模型ID
			_auctionModelId = readInt();
			//拍卖类型1本服2跨服
			_auctionType = readByte();
			//当前价格
			_price = readInt();
			//出价人ID
			_playerId = readLong();
			//出价人名字（空为匿名）
			_playerName = readString();
			//剩余时间
			_time = readInt();
			return true;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get auctionId(): long{
			return _auctionId;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set auctionId(value: long): void{
			this._auctionId = value;
		}
		
		/**
		 * get 拍卖模型ID
		 * @return 
		 */
		public function get auctionModelId(): int{
			return _auctionModelId;
		}
		
		/**
		 * set 拍卖模型ID
		 */
		public function set auctionModelId(value: int): void{
			this._auctionModelId = value;
		}
		
		/**
		 * get 拍卖类型1本服2跨服
		 * @return 
		 */
		public function get auctionType(): int{
			return _auctionType;
		}
		
		/**
		 * set 拍卖类型1本服2跨服
		 */
		public function set auctionType(value: int): void{
			this._auctionType = value;
		}
		
		/**
		 * get 当前价格
		 * @return 
		 */
		public function get price(): int{
			return _price;
		}
		
		/**
		 * set 当前价格
		 */
		public function set price(value: int): void{
			this._price = value;
		}
		
		/**
		 * get 出价人ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 出价人ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 出价人名字（空为匿名）
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 出价人名字（空为匿名）
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}