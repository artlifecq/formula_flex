package com.rpgGame.netData.shop.message{
	import com.rpgGame.netData.shop.bean.AuctionItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送给前端拍卖物品信息
	 */
	public class ResAuctionItemsMessage extends Message {
	
		//拍卖物品列表
		private var _auctionItemList: Vector.<AuctionItemInfo> = new Vector.<AuctionItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//拍卖物品列表
			writeShort(_auctionItemList.length);
			for (i = 0; i < _auctionItemList.length; i++) {
				writeBean(_auctionItemList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//拍卖物品列表
			var auctionItemList_length : int = readShort();
			for (i = 0; i < auctionItemList_length; i++) {
				_auctionItemList[i] = readBean(AuctionItemInfo) as AuctionItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149106;
		}
		
		/**
		 * get 拍卖物品列表
		 * @return 
		 */
		public function get auctionItemList(): Vector.<AuctionItemInfo>{
			return _auctionItemList;
		}
		
		/**
		 * set 拍卖物品列表
		 */
		public function set auctionItemList(value: Vector.<AuctionItemInfo>): void{
			this._auctionItemList = value;
		}
		
	}
}