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
	 * 公共服发送给逻辑服跨服拍卖数据（广播）
	 */
	public class PeqCrossAuctionItemsMessage extends Message {
	
		//拍卖编号
		private var _auctionId: long;
		
		//ServerAuctionItem结构
		private var _auctionItemJson: Vector.<String> = new Vector.<String>();
		//类型（0连接上后同步1创建同步2结算同步3出价成功同步99完结商品需要订单处理的）
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//拍卖编号
			writeLong(_auctionId);
			//ServerAuctionItem结构
			writeShort(_auctionItemJson.length);
			for (i = 0; i < _auctionItemJson.length; i++) {
				writeString(_auctionItemJson[i]);
			}
			//类型（0连接上后同步1创建同步2结算同步3出价成功同步99完结商品需要订单处理的）
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//拍卖编号
			_auctionId = readLong();
			//ServerAuctionItem结构
			var auctionItemJson_length : int = readShort();
			for (i = 0; i < auctionItemJson_length; i++) {
				_auctionItemJson[i] = readString();
			}
			//类型（0连接上后同步1创建同步2结算同步3出价成功同步99完结商品需要订单处理的）
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149210;
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
		 * get ServerAuctionItem结构
		 * @return 
		 */
		public function get auctionItemJson(): Vector.<String>{
			return _auctionItemJson;
		}
		
		/**
		 * set ServerAuctionItem结构
		 */
		public function set auctionItemJson(value: Vector.<String>): void{
			this._auctionItemJson = value;
		}
		
		/**
		 * get 类型（0连接上后同步1创建同步2结算同步3出价成功同步99完结商品需要订单处理的）
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型（0连接上后同步1创建同步2结算同步3出价成功同步99完结商品需要订单处理的）
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}