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
	 * 包裹信息列表
	 */
	public class ResParcelInfoMessage extends Message {
	
		//包裹类型
		private var _parcelType: int;
		
		//已开格子数量
		private var _cellnum: int;
		
		//物品信息列表
		private var _items: Vector.<ItemInfo> = new Vector.<ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//包裹类型
			writeInt(_parcelType);
			//已开格子数量
			writeInt(_cellnum);
			//物品信息列表
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
			//包裹类型
			_parcelType = readInt();
			//已开格子数量
			_cellnum = readInt();
			//物品信息列表
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
			return 108101;
		}
		
		/**
		 * get 包裹类型
		 * @return 
		 */
		public function get parcelType(): int{
			return _parcelType;
		}
		
		/**
		 * set 包裹类型
		 */
		public function set parcelType(value: int): void{
			this._parcelType = value;
		}
		
		/**
		 * get 已开格子数量
		 * @return 
		 */
		public function get cellnum(): int{
			return _cellnum;
		}
		
		/**
		 * set 已开格子数量
		 */
		public function set cellnum(value: int): void{
			this._cellnum = value;
		}
		
		/**
		 * get 物品信息列表
		 * @return 
		 */
		public function get items(): Vector.<ItemInfo>{
			return _items;
		}
		
		/**
		 * set 物品信息列表
		 */
		public function set items(value: Vector.<ItemInfo>): void{
			this._items = value;
		}
		
	}
}