package com.rpgGame.netData.chat.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 超链接物品信息
	 */
	public class ChatGoodInfo extends Bean {
	
		//序号
		private var _index: int;
		
		//物品信息
		private var _itemInfos: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//序号
			writeInt(_index);
			//物品信息
			writeBean(_itemInfos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//序号
			_index = readInt();
			//物品信息
			_itemInfos = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get 序号
		 * @return 
		 */
		public function get index(): int{
			return _index;
		}
		
		/**
		 * set 序号
		 */
		public function set index(value: int): void{
			this._index = value;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get itemInfos(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _itemInfos;
		}
		
		/**
		 * set 物品信息
		 */
		public function set itemInfos(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._itemInfos = value;
		}
		
	}
}