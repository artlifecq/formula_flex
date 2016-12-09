package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品信息列表
	 */
	public class ReqItemInfosGameToFightMessage extends Message {
	
		//已开格子数量
		private var _cellnum: int;
		
		//物品信息列表
		private var _itemdata: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//已开格子数量
			writeInt(_cellnum);
			//物品信息列表
			writeString(_itemdata);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//已开格子数量
			_cellnum = readInt();
			//物品信息列表
			_itemdata = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251252;
		}
		
		/**
		 * get 已开格子数量
		 * @return 
		 */
		public function get cellnum(): int{
			return _cellnum;
		}
		
		/**
		 * set 已开格子数量
		 */
		public function set cellnum(value: int): void{
			this._cellnum = value;
		}
		
		/**
		 * get 物品信息列表
		 * @return 
		 */
		public function get itemdata(): String{
			return _itemdata;
		}
		
		/**
		 * set 物品信息列表
		 */
		public function set itemdata(value: String): void{
			this._itemdata = value;
		}
		
	}
}