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
	 * 请求装备注灵
	 */
	public class ReqSoulMessage extends Message {
	
		//物品唯一Id
		private var _itemId: long;
		
		//是否自动(0 否 1是)
		private var _isAuto: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品唯一Id
			writeLong(_itemId);
			//是否自动(0 否 1是)
			writeByte(_isAuto);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品唯一Id
			_itemId = readLong();
			//是否自动(0 否 1是)
			_isAuto = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204207;
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
		
		/**
		 * get 是否自动(0 否 1是)
		 * @return 
		 */
		public function get isAuto(): int{
			return _isAuto;
		}
		
		/**
		 * set 是否自动(0 否 1是)
		 */
		public function set isAuto(value: int): void{
			this._isAuto = value;
		}
		
	}
}