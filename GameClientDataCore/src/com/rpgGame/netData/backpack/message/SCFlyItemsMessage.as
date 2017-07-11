package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品ICON飘动效果消息
	 */
	public class SCFlyItemsMessage extends Message {
	
		//道具ID列表
		private var _itemModels: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//道具ID列表
			writeShort(_itemModels.length);
			for (i = 0; i < _itemModels.length; i++) {
				writeInt(_itemModels[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//道具ID列表
			var itemModels_length : int = readShort();
			for (i = 0; i < itemModels_length; i++) {
				_itemModels[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108117;
		}
		
		/**
		 * get 道具ID列表
		 * @return 
		 */
		public function get itemModels(): Vector.<int>{
			return _itemModels;
		}
		
		/**
		 * set 道具ID列表
		 */
		public function set itemModels(value: Vector.<int>): void{
			this._itemModels = value;
		}
		
	}
}