package com.rpgGame.netData.shop.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回购物品列表
	 */
	public class ResRebuyItemInfosMessage extends Message {
	
		//物品信息列表
		private var _items: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//物品卖出时间信息列表
		private var _timeKeys: Vector.<String> = new Vector.<String>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//物品信息列表
			writeShort(_items.length);
			for (i = 0; i < _items.length; i++) {
				writeBean(_items[i]);
			}
			//物品卖出时间信息列表
			writeShort(_timeKeys.length);
			for (i = 0; i < _timeKeys.length; i++) {
				writeString(_timeKeys[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//物品信息列表
			var items_length : int = readShort();
			for (i = 0; i < items_length; i++) {
				_items[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//物品卖出时间信息列表
			var timeKeys_length : int = readShort();
			for (i = 0; i < timeKeys_length; i++) {
				_timeKeys[i] = readString();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149103;
		}
		
		/**
		 * get 物品信息列表
		 * @return 
		 */
		public function get items(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _items;
		}
		
		/**
		 * set 物品信息列表
		 */
		public function set items(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._items = value;
		}
		
		/**
		 * get 物品卖出时间信息列表
		 * @return 
		 */
		public function get timeKeys(): Vector.<String>{
			return _timeKeys;
		}
		
		/**
		 * set 物品卖出时间信息列表
		 */
		public function set timeKeys(value: Vector.<String>): void{
			this._timeKeys = value;
		}
		
	}
}