package com.rpgGame.netData.backpack.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 私有物品信息列表
	 */
	public class ResPrivateItemInfoMessage extends Message {
	
		//类型
		private var _type: int;
		
		//物品列表
		private var _items: Vector.<ItemInfo> = new Vector.<ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//类型
			writeInt(_type);
			//物品列表
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
			//类型
			_type = readInt();
			//物品列表
			var items_length : int = readShort();
			for (i = 0; i < items_length; i++) {
				_items[i] = readBean(ItemInfo) as ItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108112;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 物品列表
		 * @return 
		 */
		public function get items(): Vector.<ItemInfo>{
			return _items;
		}
		
		/**
		 * set 物品列表
		 */
		public function set items(value: Vector.<ItemInfo>): void{
			this._items = value;
		}
		
	}
}