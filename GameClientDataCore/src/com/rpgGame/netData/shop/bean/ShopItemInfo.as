package com.rpgGame.netData.shop.bean{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 商品动态信息
	 */
	public class ShopItemInfo extends Bean {
	
		//商品ID(shop_data主键)
		private var _shopItemId: int;
		
		//商品库存量
		private var _shopItemNum: int;
		
		//高16位存单日购买次数限制，低16位存单次购买次数限制
		private var _limit: int;
		
		//售价信息
		private var _moneyInfo: String;
		
		//今日购买数量计数
		private var _todayBuyNum: int;
		
		//热销标识 0无热销，1热销中，2折扣，3热销+折扣
		private var _hot: int;
		
		//物品
		private var _item: com.rpgGame.netData.backpack.bean.TempItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//商品ID(shop_data主键)
			writeInt(_shopItemId);
			//商品库存量
			writeInt(_shopItemNum);
			//高16位存单日购买次数限制，低16位存单次购买次数限制
			writeInt(_limit);
			//售价信息
			writeString(_moneyInfo);
			//今日购买数量计数
			writeInt(_todayBuyNum);
			//热销标识 0无热销，1热销中，2折扣，3热销+折扣
			writeByte(_hot);
			//物品
			writeBean(_item);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//商品ID(shop_data主键)
			_shopItemId = readInt();
			//商品库存量
			_shopItemNum = readInt();
			//高16位存单日购买次数限制，低16位存单次购买次数限制
			_limit = readInt();
			//售价信息
			_moneyInfo = readString();
			//今日购买数量计数
			_todayBuyNum = readInt();
			//热销标识 0无热销，1热销中，2折扣，3热销+折扣
			_hot = readByte();
			//物品
			_item = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			return true;
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
		 * get 商品库存量
		 * @return 
		 */
		public function get shopItemNum(): int{
			return _shopItemNum;
		}
		
		/**
		 * set 商品库存量
		 */
		public function set shopItemNum(value: int): void{
			this._shopItemNum = value;
		}
		
		/**
		 * get 高16位存单日购买次数限制，低16位存单次购买次数限制
		 * @return 
		 */
		public function get limit(): int{
			return _limit;
		}
		
		/**
		 * set 高16位存单日购买次数限制，低16位存单次购买次数限制
		 */
		public function set limit(value: int): void{
			this._limit = value;
		}
		
		/**
		 * get 售价信息
		 * @return 
		 */
		public function get moneyInfo(): String{
			return _moneyInfo;
		}
		
		/**
		 * set 售价信息
		 */
		public function set moneyInfo(value: String): void{
			this._moneyInfo = value;
		}
		
		/**
		 * get 今日购买数量计数
		 * @return 
		 */
		public function get todayBuyNum(): int{
			return _todayBuyNum;
		}
		
		/**
		 * set 今日购买数量计数
		 */
		public function set todayBuyNum(value: int): void{
			this._todayBuyNum = value;
		}
		
		/**
		 * get 热销标识 0无热销，1热销中，2折扣，3热销+折扣
		 * @return 
		 */
		public function get hot(): int{
			return _hot;
		}
		
		/**
		 * set 热销标识 0无热销，1热销中，2折扣，3热销+折扣
		 */
		public function set hot(value: int): void{
			this._hot = value;
		}
		
		/**
		 * get 物品
		 * @return 
		 */
		public function get item(): com.rpgGame.netData.backpack.bean.TempItemInfo{
			return _item;
		}
		
		/**
		 * set 物品
		 */
		public function set item(value: com.rpgGame.netData.backpack.bean.TempItemInfo): void{
			this._item = value;
		}
		
	}
}