package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品删除
	 */
	public class ResItemRemoveMessage extends Message {
	
		//物品格子Id
		private var _gridId: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//物品格子Id
			writeShort(_gridId.length);
			for (i = 0; i < _gridId.length; i++) {
				writeInt(_gridId[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//物品格子Id
			var gridId_length : int = readShort();
			for (i = 0; i < gridId_length; i++) {
				_gridId[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108104;
		}
		
		/**
		 * get 物品格子Id
		 * @return 
		 */
		public function get gridId(): Vector.<int>{
			return _gridId;
		}
		
		/**
		 * set 物品格子Id
		 */
		public function set gridId(value: Vector.<int>): void{
			this._gridId = value;
		}
		
	}
}