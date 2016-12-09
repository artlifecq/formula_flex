package com.rpgGame.netData.backpack.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 物品信息修正
	 */
	public class ResItemChangeMessage extends Message {
	
		//类型(1-获得新物品)
		private var _type: int;
		
		//物品信息
		private var _item: ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型(1-获得新物品)
			writeByte(_type);
			//物品信息
			writeBean(_item);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型(1-获得新物品)
			_type = readByte();
			//物品信息
			_item = readBean(ItemInfo) as ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108103;
		}
		
		/**
		 * get 类型(1-获得新物品)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型(1-获得新物品)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get item(): ItemInfo{
			return _item;
		}
		
		/**
		 * set 物品信息
		 */
		public function set item(value: ItemInfo): void{
			this._item = value;
		}
		
	}
}