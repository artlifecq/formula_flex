package com.rpgGame.netData.backpack.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 移动物品
	 */
	public class ReqMoveItemMessage extends Message {
	
		//物品Id
		private var _itemId: long;
		
		//移动到格子Id
		private var _toGridId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品Id
			writeLong(_itemId);
			//移动到格子Id
			writeInt(_toGridId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品Id
			_itemId = readLong();
			//移动到格子Id
			_toGridId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108202;
		}
		
		/**
		 * get 物品Id
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 物品Id
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
		/**
		 * get 移动到格子Id
		 * @return 
		 */
		public function get toGridId(): int{
			return _toGridId;
		}
		
		/**
		 * set 移动到格子Id
		 */
		public function set toGridId(value: int): void{
			this._toGridId = value;
		}
		
	}
}