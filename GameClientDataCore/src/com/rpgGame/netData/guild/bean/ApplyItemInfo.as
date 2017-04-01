package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 申请仓库物品信息
	 */
	public class ApplyItemInfo extends Bean {
	
		//申请者ID
		private var _playerId: long;
		
		//申请者名字
		private var _name: String;
		
		//申请物品
		private var _itemId: long;
		
		//物品模版Id
		private var _itemModelId: int;
		
		//物品数量
		private var _itemNum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//申请者ID
			writeLong(_playerId);
			//申请者名字
			writeString(_name);
			//申请物品
			writeLong(_itemId);
			//物品模版Id
			writeInt(_itemModelId);
			//物品数量
			writeInt(_itemNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//申请者ID
			_playerId = readLong();
			//申请者名字
			_name = readString();
			//申请物品
			_itemId = readLong();
			//物品模版Id
			_itemModelId = readInt();
			//物品数量
			_itemNum = readInt();
			return true;
		}
		
		/**
		 * get 申请者ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 申请者ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 申请者名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 申请者名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 申请物品
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 申请物品
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
		/**
		 * get 物品模版Id
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品模版Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 物品数量
		 * @return 
		 */
		public function get itemNum(): int{
			return _itemNum;
		}
		
		/**
		 * set 物品数量
		 */
		public function set itemNum(value: int): void{
			this._itemNum = value;
		}
		
	}
}