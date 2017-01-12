package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家使用的加属性类道具
	 */
	public class PlayerUseItem extends Bean {
	
		//道具ID
		private var _itemModelId: int;
		
		//道具数量
		private var _itemNum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具ID
			writeInt(_itemModelId);
			//道具数量
			writeInt(_itemNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具ID
			_itemModelId = readInt();
			//道具数量
			_itemNum = readInt();
			return true;
		}
		
		/**
		 * get 道具ID
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 道具ID
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 道具数量
		 * @return 
		 */
		public function get itemNum(): int{
			return _itemNum;
		}
		
		/**
		 * set 道具数量
		 */
		public function set itemNum(value: int): void{
			this._itemNum = value;
		}
		
	}
}