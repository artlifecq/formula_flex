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
	public class ReqBuyItemMessage extends Message {
	
		//商店model(shop_base主键，商店种类)
		private var _shopType: int;
		
		//物品模型ID
		private var _itemModelId: int;
		
		//商品ID(shop_data主键)
		private var _shopItemId: int;
		
		//商店生成物品的唯一id(TempItemInfo里面的唯一id)
		private var _shopItemSid: long;
		
		//售价信息
		private var _moneyInfo: String;
		
		//货币类型
		private var _moneyType: int;
		
		//购买数量
		private var _num: int;
		
		//打折道具ID
		private var _discountItemid: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//商店model(shop_base主键，商店种类)
			writeInt(_shopType);
			//物品模型ID
			writeInt(_itemModelId);
			//商品ID(shop_data主键)
			writeInt(_shopItemId);
			//商店生成物品的唯一id(TempItemInfo里面的唯一id)
			writeLong(_shopItemSid);
			//售价信息
			writeString(_moneyInfo);
			//货币类型
			writeInt(_moneyType);
			//购买数量
			writeInt(_num);
			//打折道具ID
			writeLong(_discountItemid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//商店model(shop_base主键，商店种类)
			_shopType = readInt();
			//物品模型ID
			_itemModelId = readInt();
			//商品ID(shop_data主键)
			_shopItemId = readInt();
			//商店生成物品的唯一id(TempItemInfo里面的唯一id)
			_shopItemSid = readLong();
			//售价信息
			_moneyInfo = readString();
			//货币类型
			_moneyType = readInt();
			//购买数量
			_num = readInt();
			//打折道具ID
			_discountItemid = readLong();
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
		 * get 商店model(shop_base主键，商店种类)
		 * @return 
		 */
		public function get shopType(): int{
			return _shopType;
		}
		
		/**
		 * set 商店model(shop_base主键，商店种类)
		 */
		public function set shopType(value: int): void{
			this._shopType = value;
		}
		
		/**
		 * get 物品模型ID
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品模型ID
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
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
		 * get 商店生成物品的唯一id(TempItemInfo里面的唯一id)
		 * @return 
		 */
		public function get shopItemSid(): long{
			return _shopItemSid;
		}
		
		/**
		 * set 商店生成物品的唯一id(TempItemInfo里面的唯一id)
		 */
		public function set shopItemSid(value: long): void{
			this._shopItemSid = value;
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
		 * get 货币类型
		 * @return 
		 */
		public function get moneyType(): int{
			return _moneyType;
		}
		
		/**
		 * set 货币类型
		 */
		public function set moneyType(value: int): void{
			this._moneyType = value;
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
		
	}
}