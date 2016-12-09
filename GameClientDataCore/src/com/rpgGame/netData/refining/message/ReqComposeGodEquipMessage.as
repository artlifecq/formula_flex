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
	 * 请求合成神装
	 */
	public class ReqComposeGodEquipMessage extends Message {
	
		//物品model
		private var _itemModel: int;
		
		//数量
		private var _num: int;
		
		//类型
		private var _handleType: int;
		
		//物品列表
		private var _itemIdList: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//物品model
			writeInt(_itemModel);
			//数量
			writeInt(_num);
			//类型
			writeByte(_handleType);
			//物品列表
			writeShort(_itemIdList.length);
			for (i = 0; i < _itemIdList.length; i++) {
				writeLong(_itemIdList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//物品model
			_itemModel = readInt();
			//数量
			_num = readInt();
			//类型
			_handleType = readByte();
			//物品列表
			var itemIdList_length : int = readShort();
			for (i = 0; i < itemIdList_length; i++) {
				_itemIdList[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204203;
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
		 * get 类型
		 * @return 
		 */
		public function get handleType(): int{
			return _handleType;
		}
		
		/**
		 * set 类型
		 */
		public function set handleType(value: int): void{
			this._handleType = value;
		}
		
		/**
		 * get 物品列表
		 * @return 
		 */
		public function get itemIdList(): Vector.<long>{
			return _itemIdList;
		}
		
		/**
		 * set 物品列表
		 */
		public function set itemIdList(value: Vector.<long>): void{
			this._itemIdList = value;
		}
		
	}
}