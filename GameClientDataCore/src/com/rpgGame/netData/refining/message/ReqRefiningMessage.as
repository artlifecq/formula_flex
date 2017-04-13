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
	 * 请求炼化
	 */
	public class ReqRefiningMessage extends Message {
	
		//物品列表
		private var _itemList: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//物品列表
			writeShort(_itemList.length);
			for (i = 0; i < _itemList.length; i++) {
				writeLong(_itemList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//物品列表
			var itemList_length : int = readShort();
			for (i = 0; i < itemList_length; i++) {
				_itemList[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204201;
		}
		
		/**
		 * get 物品列表
		 * @return 
		 */
		public function get itemList(): Vector.<long>{
			return _itemList;
		}
		
		/**
		 * set 物品列表
		 */
		public function set itemList(value: Vector.<long>): void{
			this._itemList = value;
		}
		
	}
}