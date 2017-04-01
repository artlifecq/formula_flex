package com.rpgGame.netData.store.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品信息增加
	 */
	public class ResStoreItemAddMessage extends Message {
	
		//物品信息
		private var _item: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品信息
			writeBean(_item);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品信息
			_item = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 105101;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get item(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _item;
		}
		
		/**
		 * set 物品信息
		 */
		public function set item(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._item = value;
		}
		
	}
}