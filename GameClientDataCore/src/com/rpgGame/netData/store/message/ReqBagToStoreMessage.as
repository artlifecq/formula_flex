package com.rpgGame.netData.store.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品存入仓库
	 */
	public class ReqBagToStoreMessage extends Message {
	
		//物品Id
		private var _itemId: long;
		
		//仓库目标格子
		private var _toCellId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品Id
			writeLong(_itemId);
			//仓库目标格子
			writeInt(_toCellId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品Id
			_itemId = readLong();
			//仓库目标格子
			_toCellId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 105203;
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
		 * get 仓库目标格子
		 * @return 
		 */
		public function get toCellId(): int{
			return _toCellId;
		}
		
		/**
		 * set 仓库目标格子
		 */
		public function set toCellId(value: int): void{
			this._toCellId = value;
		}
		
	}
}