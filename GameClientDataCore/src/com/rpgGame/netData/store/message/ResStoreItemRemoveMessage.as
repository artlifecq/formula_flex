package com.rpgGame.netData.store.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品删除
	 */
	public class ResStoreItemRemoveMessage extends Message {
	
		//物品格子Id
		private var _gridId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品格子Id
			writeInt(_gridId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品格子Id
			_gridId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 105103;
		}
		
		/**
		 * get 物品格子Id
		 * @return 
		 */
		public function get gridId(): int{
			return _gridId;
		}
		
		/**
		 * set 物品格子Id
		 */
		public function set gridId(value: int): void{
			this._gridId = value;
		}
		
	}
}