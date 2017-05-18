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
	 * 发送商品改变消息
	 */
	public class SCSendShopItemChangeMessage extends Message {
	
		//商店类型
		private var _type: int;
		
		//商品信息
		private var _items: ShopItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//商店类型
			writeByte(_type);
			//商品信息
			writeBean(_items);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//商店类型
			_type = readByte();
			//商品信息
			_items = readBean(ShopItemInfo) as ShopItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149107;
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
		 * get 商品信息
		 * @return 
		 */
		public function get items(): ShopItemInfo{
			return _items;
		}
		
		/**
		 * set 商品信息
		 */
		public function set items(value: ShopItemInfo): void{
			this._items = value;
		}
		
	}
}