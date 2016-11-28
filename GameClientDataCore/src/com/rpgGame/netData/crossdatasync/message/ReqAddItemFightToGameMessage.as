package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗服通知原服添加道具
	 */
	public class ReqAddItemFightToGameMessage extends Message {
	
		//道具数据
		private var _itemdata: String;
		
		//原因
		private var _reasonId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具数据
			writeString(_itemdata);
			//原因
			writeInt(_reasonId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具数据
			_itemdata = readString();
			//原因
			_reasonId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251251;
		}
		
		/**
		 * get 道具数据
		 * @return 
		 */
		public function get itemdata(): String{
			return _itemdata;
		}
		
		/**
		 * set 道具数据
		 */
		public function set itemdata(value: String): void{
			this._itemdata = value;
		}
		
		/**
		 * get 原因
		 * @return 
		 */
		public function get reasonId(): int{
			return _reasonId;
		}
		
		/**
		 * set 原因
		 */
		public function set reasonId(value: int): void{
			this._reasonId = value;
		}
		
	}
}