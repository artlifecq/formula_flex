package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 删除物品
	 */
	public class ReqGuildDeleteItemMessage extends Message {
	
		//物品Id
		private var _itemId: long;
		
		//0 取消删除 1确认删除
		private var _isDelete: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品Id
			writeLong(_itemId);
			//0 取消删除 1确认删除
			writeByte(_isDelete);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品Id
			_itemId = readLong();
			//0 取消删除 1确认删除
			_isDelete = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111304;
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
		 * get 0 取消删除 1确认删除
		 * @return 
		 */
		public function get isDelete(): int{
			return _isDelete;
		}
		
		/**
		 * set 0 取消删除 1确认删除
		 */
		public function set isDelete(value: int): void{
			this._isDelete = value;
		}
		
	}
}