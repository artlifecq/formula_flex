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
	 * 发送商店物品列表
	 */
	public class SCSendShopListMessage extends Message {
	
		//商店类型
		private var _type: int;
		
		//商店物品列表
		private var _items: Vector.<ShopItemInfo> = new Vector.<ShopItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//商店类型
			writeByte(_type);
			//商店物品列表
			writeShort(_items.length);
			for (i = 0; i < _items.length; i++) {
				writeBean(_items[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//商店类型
			_type = readByte();
			//商店物品列表
			var items_length : int = readShort();
			for (i = 0; i < items_length; i++) {
				_items[i] = readBean(ShopItemInfo) as ShopItemInfo;
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
		 * get 商店类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 商店类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 商店物品列表
		 * @return 
		 */
		public function get items(): Vector.<ShopItemInfo>{
			return _items;
		}
		
		/**
		 * set 商店物品列表
		 */
		public function set items(value: Vector.<ShopItemInfo>): void{
			this._items = value;
		}
		
	}
}