package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 展示领取奖励
	 */
	public class SCDrawYaoTaAwardMessage extends Message {
	
		//奖励
		private var _itemModelIds: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//奖励
			writeShort(_itemModelIds.length);
			for (i = 0; i < _itemModelIds.length; i++) {
				writeInt(_itemModelIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//奖励
			var itemModelIds_length : int = readShort();
			for (i = 0; i < itemModelIds_length; i++) {
				_itemModelIds[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129114;
		}
		
		/**
		 * get 奖励
		 * @return 
		 */
		public function get itemModelIds(): Vector.<int>{
			return _itemModelIds;
		}
		
		/**
		 * set 奖励
		 */
		public function set itemModelIds(value: Vector.<int>): void{
			this._itemModelIds = value;
		}
		
	}
}