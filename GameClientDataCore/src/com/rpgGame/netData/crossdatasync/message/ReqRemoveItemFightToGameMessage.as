package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗服通知原服删除道具
	 */
	public class ReqRemoveItemFightToGameMessage extends Message {
	
		//道具唯一ID
		private var _itemid: long;
		
		//数量
		private var _num: int;
		
		//道具modelid
		private var _itemmodelid: int;
		
		//原因
		private var _reasonId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具唯一ID
			writeLong(_itemid);
			//数量
			writeInt(_num);
			//道具modelid
			writeInt(_itemmodelid);
			//原因
			writeInt(_reasonId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具唯一ID
			_itemid = readLong();
			//数量
			_num = readInt();
			//道具modelid
			_itemmodelid = readInt();
			//原因
			_reasonId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251250;
		}
		
		/**
		 * get 道具唯一ID
		 * @return 
		 */
		public function get itemid(): long{
			return _itemid;
		}
		
		/**
		 * set 道具唯一ID
		 */
		public function set itemid(value: long): void{
			this._itemid = value;
		}
		
		/**
		 * get 数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 道具modelid
		 * @return 
		 */
		public function get itemmodelid(): int{
			return _itemmodelid;
		}
		
		/**
		 * set 道具modelid
		 */
		public function set itemmodelid(value: int): void{
			this._itemmodelid = value;
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