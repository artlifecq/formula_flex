package com.rpgGame.netData.refining.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求装备重置
	 */
	public class ReqEquipResetMessage extends Message {
	
		//物品唯一Id
		private var _itemId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品唯一Id
			writeLong(_itemId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品唯一Id
			_itemId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204211;
		}
		
		/**
		 * get 物品唯一Id
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 物品唯一Id
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
	}
}