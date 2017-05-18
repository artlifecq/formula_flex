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
	
		//标签页类型
		private var _pageType: int;
		
		//标签页说明
		private var _pageTitle: String;
		
		//商品ID(shop_data主键)
		private var _shopItemId: int;
		
		//全服限购数量(0.否，1.是)
		private var _global_limit: int;
		
		//限购次数
		private var _limitNum: int;
		
		//限购类型（0.无限制，1.每日限购，2.每周限购）
		private var _limitType: int;
		
		//原始价格
		private var _price: int;
		
		//货币类型
		private var _priceType: int;
		
		//购买VIP等级
		private var _vipLevel: int;
		
		//打折价格
		private var _discountPrice: int;
		
		//今日购买数量计数
		private var _todayBuyNum: int;
		
		//物品
		private var _item: com.rpgGame.netData.backpack.bean.TempItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//标签页类型
			writeByte(_pageType);
			//标签页说明
			writeString(_pageTitle);
			//商品ID(shop_data主键)
			writeInt(_shopItemId);
			//全服限购数量(0.否，1.是)
			writeByte(_global_limit);
			//限购次数
			writeInt(_limitNum);
			//限购类型（0.无限制，1.每日限购，2.每周限购）
			writeByte(_limitType);
			//原始价格
			writeInt(_price);
			//货币类型
			writeByte(_priceType);
			//购买VIP等级
			writeByte(_vipLevel);
			//打折价格
			writeInt(_discountPrice);
			//今日购买数量计数
			writeInt(_todayBuyNum);
			//物品
			writeBean(_item);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//标签页类型
			_pageType = readByte();
			//标签页说明
			_pageTitle = readString();
			//商品ID(shop_data主键)
			_shopItemId = readInt();
			//全服限购数量(0.否，1.是)
			_global_limit = readByte();
			//限购次数
			_limitNum = readInt();
			//限购类型（0.无限制，1.每日限购，2.每周限购）
			_limitType = readByte();
			//原始价格
			_price = readInt();
			//货币类型
			_priceType = readByte();
			//购买VIP等级
			_vipLevel = readByte();
			//打折价格
			_discountPrice = readInt();
			//今日购买数量计数
			_todayBuyNum = readInt();
			//物品
			_item = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			return true;
		}
		
		/**
		 * get 标签页类型
		 * @return 
		 */
		public function get pageType(): int{
			return _pageType;
		}
		
		/**
		 * set 标签页类型
		 */
		public function set pageType(value: int): void{
			this._pageType = value;
		}
		
		/**
		 * get 标签页说明
		 * @return 
		 */
		public function get pageTitle(): String{
			return _pageTitle;
		}
		
		/**
		 * set 标签页说明
		 */
		public function set pageTitle(value: String): void{
			this._pageTitle = value;
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
		 * get 全服限购数量(0.否，1.是)
		 * @return 
		 */
		public function get global_limit(): int{
			return _global_limit;
		}
		
		/**
		 * set 全服限购数量(0.否，1.是)
		 */
		public function set global_limit(value: int): void{
			this._global_limit = value;
		}
		
		/**
		 * get 限购次数
		 * @return 
		 */
		public function get limitNum(): int{
			return _limitNum;
		}
		
		/**
		 * set 限购次数
		 */
		public function set limitNum(value: int): void{
			this._limitNum = value;
		}
		
		/**
		 * get 限购类型（0.无限制，1.每日限购，2.每周限购）
		 * @return 
		 */
		public function get limitType(): int{
			return _limitType;
		}
		
		/**
		 * set 限购类型（0.无限制，1.每日限购，2.每周限购）
		 */
		public function set limitType(value: int): void{
			this._limitType = value;
		}
		
		/**
		 * get 原始价格
		 * @return 
		 */
		public function get price(): int{
			return _price;
		}
		
		/**
		 * set 原始价格
		 */
		public function set price(value: int): void{
			this._price = value;
		}
		
		/**
		 * get 货币类型
		 * @return 
		 */
		public function get priceType(): int{
			return _priceType;
		}
		
		/**
		 * set 货币类型
		 */
		public function set priceType(value: int): void{
			this._priceType = value;
		}
		
		/**
		 * get 购买VIP等级
		 * @return 
		 */
		public function get vipLevel(): int{
			return _vipLevel;
		}
		
		/**
		 * set 购买VIP等级
		 */
		public function set vipLevel(value: int): void{
			this._vipLevel = value;
		}
		
		/**
		 * get 打折价格
		 * @return 
		 */
		public function get discountPrice(): int{
			return _discountPrice;
		}
		
		/**
		 * set 打折价格
		 */
		public function set discountPrice(value: int): void{
			this._discountPrice = value;
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