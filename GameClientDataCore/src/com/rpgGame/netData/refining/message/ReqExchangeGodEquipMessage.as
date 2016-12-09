package com.rpgGame.netData.refining.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求兑换神装
	 */
	public class ReqExchangeGodEquipMessage extends Message {
	
		//物品model
		private var _itemModel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品model
			writeInt(_itemModel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品model
			_itemModel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204202;
		}
		
		/**
		 * get 物品model
		 * @return 
		 */
		public function get itemModel(): int{
			return _itemModel;
		}
		
		/**
		 * set 物品model
		 */
		public function set itemModel(value: int): void{
			this._itemModel = value;
		}
		
	}
}