package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 使用物品成功
	 */
	public class ResUseItemSuccessMessage extends Message {
	
		//物品ModelIdId
		private var _itemModelId: int;
		
		//物品数量
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品ModelIdId
			writeInt(_itemModelId);
			//物品数量
			writeInt(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品ModelIdId
			_itemModelId = readInt();
			//物品数量
			_num = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108105;
		}
		
		/**
		 * get 物品ModelIdId
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品ModelIdId
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 物品数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 物品数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}