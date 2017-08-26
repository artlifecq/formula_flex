package com.rpgGame.netData.backpack.message{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 礼包获得的道具
	 */
	public class ResGiftItemInfoMessage extends Message {
	
		//礼包Id
		private var _giftId: int;
		
		//道具列表
		private var _itemList: Vector.<TempItemInfo> = new Vector.<TempItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//礼包Id
			writeInt(_giftId);
			//道具列表
			writeShort(_itemList.length);
			for (i = 0; i < _itemList.length; i++) {
				writeBean(_itemList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//礼包Id
			_giftId = readInt();
			//道具列表
			var itemList_length : int = readShort();
			for (i = 0; i < itemList_length; i++) {
				_itemList[i] = readBean(TempItemInfo) as TempItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108118;
		}
		
		/**
		 * get 礼包Id
		 * @return 
		 */
		public function get giftId(): int{
			return _giftId;
		}
		
		/**
		 * set 礼包Id
		 */
		public function set giftId(value: int): void{
			this._giftId = value;
		}
		
		/**
		 * get 道具列表
		 * @return 
		 */
		public function get itemList(): Vector.<TempItemInfo>{
			return _itemList;
		}
		
		/**
		 * set 道具列表
		 */
		public function set itemList(value: Vector.<TempItemInfo>): void{
			this._itemList = value;
		}
		
	}
}