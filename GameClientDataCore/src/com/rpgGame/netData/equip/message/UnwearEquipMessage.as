package com.rpgGame.netData.equip.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 卸下装备
	 */
	public class UnwearEquipMessage extends Message {
	
		//物品Id
		private var _itemId: long;
		
		//放到背包的格子
		private var _cellId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品Id
			writeLong(_itemId);
			//放到背包的格子
			writeInt(_cellId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品Id
			_itemId = readLong();
			//放到背包的格子
			_cellId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107202;
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
		 * get 放到背包的格子
		 * @return 
		 */
		public function get cellId(): int{
			return _cellId;
		}
		
		/**
		 * set 放到背包的格子
		 */
		public function set cellId(value: int): void{
			this._cellId = value;
		}
		
	}
}