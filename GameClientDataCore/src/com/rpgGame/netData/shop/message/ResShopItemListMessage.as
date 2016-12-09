package com.rpgGame.netData.shop.message{
	import com.rpgGame.netData.shop.bean.ShopItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 商品列表
	 */
	public class ResShopItemListMessage extends Message {
	
		//商店编号
		private var _shopId: int;
		
		//指定页的列表
		private var _shopItemList: Vector.<ShopItemInfo> = new Vector.<ShopItemInfo>();
		//下次刷新时间
		private var _nextRefreshTime: int;
		
		//刷新消耗
		private var _refreshCost: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//商店编号
			writeInt(_shopId);
			//指定页的列表
			writeShort(_shopItemList.length);
			for (i = 0; i < _shopItemList.length; i++) {
				writeBean(_shopItemList[i]);
			}
			//下次刷新时间
			writeInt(_nextRefreshTime);
			//刷新消耗
			writeInt(_refreshCost);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//商店编号
			_shopId = readInt();
			//指定页的列表
			var shopItemList_length : int = readShort();
			for (i = 0; i < shopItemList_length; i++) {
				_shopItemList[i] = readBean(ShopItemInfo) as ShopItemInfo;
			}
			//下次刷新时间
			_nextRefreshTime = readInt();
			//刷新消耗
			_refreshCost = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149104;
		}
		
		/**
		 * get 商店编号
		 * @return 
		 */
		public function get shopId(): int{
			return _shopId;
		}
		
		/**
		 * set 商店编号
		 */
		public function set shopId(value: int): void{
			this._shopId = value;
		}
		
		/**
		 * get 指定页的列表
		 * @return 
		 */
		public function get shopItemList(): Vector.<ShopItemInfo>{
			return _shopItemList;
		}
		
		/**
		 * set 指定页的列表
		 */
		public function set shopItemList(value: Vector.<ShopItemInfo>): void{
			this._shopItemList = value;
		}
		
		/**
		 * get 下次刷新时间
		 * @return 
		 */
		public function get nextRefreshTime(): int{
			return _nextRefreshTime;
		}
		
		/**
		 * set 下次刷新时间
		 */
		public function set nextRefreshTime(value: int): void{
			this._nextRefreshTime = value;
		}
		
		/**
		 * get 刷新消耗
		 * @return 
		 */
		public function get refreshCost(): int{
			return _refreshCost;
		}
		
		/**
		 * set 刷新消耗
		 */
		public function set refreshCost(value: int): void{
			this._refreshCost = value;
		}
		
	}
}