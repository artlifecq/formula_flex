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
	 * 购买物品
	 */
	public class CSBuyItemMessage extends Message {
	
		//商品ID(shop_data主键)
		private var _shopItemId: int;
		
		//购买数量
		private var _num: int;
		
		//打折道具ID
		private var _discountItemid: long;
		
		//自动使用物品（0不使用，1使用）
		private var _autoUse: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//商品ID(shop_data主键)
			writeInt(_shopItemId);
			//购买数量
			writeInt(_num);
			//打折道具ID
			writeLong(_discountItemid);
			//自动使用物品（0不使用，1使用）
			writeByte(_autoUse);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//商品ID(shop_data主键)
			_shopItemId = readInt();
			//购买数量
			_num = readInt();
			//打折道具ID
			_discountItemid = readLong();
			//自动使用物品（0不使用，1使用）
			_autoUse = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149201;
		}
		
		/**
		 * get 商品ID(shop_data主键)
		 * @return 
		 */
		public function get shopItemId(): int{
			return _shopItemId;
		}
		
		/**
		 * set 商品ID(shop_data主键)
		 */
		public function set shopItemId(value: int): void{
			this._shopItemId = value;
		}
		
		/**
		 * get 购买数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 购买数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 打折道具ID
		 * @return 
		 */
		public function get discountItemid(): long{
			return _discountItemid;
		}
		
		/**
		 * set 打折道具ID
		 */
		public function set discountItemid(value: long): void{
			this._discountItemid = value;
		}
		
		/**
		 * get 自动使用物品（0不使用，1使用）
		 * @return 
		 */
		public function get autoUse(): int{
			return _autoUse;
		}
		
		/**
		 * set 自动使用物品（0不使用，1使用）
		 */
		public function set autoUse(value: int): void{
			this._autoUse = value;
		}
		
	}
}